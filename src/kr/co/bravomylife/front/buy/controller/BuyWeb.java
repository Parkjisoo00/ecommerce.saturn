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

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.front.buy.service.BuySrvc;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.sale.dto.SaleDto;
import kr.co.bravomylife.front.sale.service.SaleSrvc;

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
	
	@Inject
	BuySrvc buySrvc;
	
	@Inject
	SaleSrvc saleSrvc;
	
	@RequestMapping(value = "/front/buy/writeForm.web")
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			logger.debug("paging SEQ_MBR 번호 확인" + " = " + pagingDto.getSeq_mbr());
			logger.debug("paging SEQ_SLE 번호 확인" + " = " + pagingDto.getSeq_sle());
			logger.debug("paging CD_CTB_B 번호 확인" + " = " + pagingDto.getCd_ctg_b());
			logger.debug("paging CD_CTB_M 번호 확인" + " = " + pagingDto.getCd_ctg_m());
			
			logger.debug("sale SEQ_MBR 번호 확인" + " = " + saleDto.getSeq_mbr());
			logger.debug("sale SEQ_SLE 번호 확인" + " = " + saleDto.getSeq_sle());
			logger.debug("sale CD_CTB_B 번호 확인" + " = " + saleDto.getCd_ctg_b());
			logger.debug("sale CD_CTB_M 번호 확인" + " = " + saleDto.getCd_ctg_m());
			
			pagingDto.setSeq_mbr(101);
			saleDto.setSeq_mbr(101);
			
			SaleDto _saleDto	= saleSrvc.select(saleDto);
			
			logger.debug("SEQ_MBR 번호 확인" + " = " + saleDto.getSeq_mbr());
			logger.debug("FLG_LIKE 번호 확인" + " = " + saleDto.getFlg_like());
			
			PagingListDto pagingListDto = saleSrvc.detailList(pagingDto);
			
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			mav.addObject("saleDto"		, _saleDto);
			
			mav.setViewName("front/buy/writeForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
