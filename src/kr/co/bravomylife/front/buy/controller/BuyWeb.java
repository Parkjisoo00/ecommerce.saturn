/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BuyWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241003231427][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.buy.controller;

import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.front.buy.service.BuySrvc;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.sale.dto.SaleDto;
import kr.co.bravomylife.front.sale.service.SaleSrvc;
import kr.co.bravomylife.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-03
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.buy.controller.BuyWeb")
public class BuyWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BuyWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	BuySrvc buySrvc;
	
	@Inject
	SaleSrvc saleSrvc;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/front/buy/writeForm.web")
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, PagingDto reviewpagingDto, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String check = "[UNDEFINED]";
			
			if (check.equals(getSession(request, "SEQ_MBR"))) {
				
				reviewpagingDto.setRegister(0);
				saleDto.setRegister(0);
			} else {
				
				reviewpagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
				saleDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
			}
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
						
			SaleDto _saleDto	= saleSrvc.select(saleDto);
			mav.addObject("saleDto"		, _saleDto);
			
			PagingListDto _pagingListDto = saleSrvc.detailList(pagingDto);
			mav.addObject("paging"	, _pagingListDto.getPaging());
			mav.addObject("list"	, _pagingListDto.getList());
			
			PagingListDto _reviewpagingDto = saleSrvc.reviewList(reviewpagingDto);
			
			List<SaleDto> reviewList = (List<SaleDto>) _reviewpagingDto.getList();
			
			for (int loop = 0; loop < reviewList.size(); loop++) {
				SaleDto _reviewList = reviewList.get(loop);
				_reviewList.setMbr_nm(aes.decode(_reviewList.getMbr_nm()));
				
				logger.debug("LOOP 크기 확인" + " = " + reviewList.size());
				logger.debug("LOOP 돌린 복호화 값 확인" + " = " + aes.decode(_reviewList.getMbr_nm()));
				logger.debug("LOOP 돌린 복호화 Set 뒤의 값 확인" + " = " + _reviewList.getMbr_nm());
			}
			
			_reviewpagingDto.setList(reviewList);
			
			if (_reviewpagingDto.getPaging().getMbr_nm() == null || _reviewpagingDto.getPaging().getMbr_nm().equals("")) {
				
				mav.addObject("reviewList", "");
			} else {
				mav.addObject("reviewList", _reviewpagingDto);
			}
			
			mav.setViewName("front/buy/writeForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
