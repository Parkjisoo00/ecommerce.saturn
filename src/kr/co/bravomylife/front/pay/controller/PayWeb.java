/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF bravomylife.CO.KR.
 * bravomylife.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 bravomylife.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 bravomylife.co.kr에 있으며,
 * bravomylife.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * bravomylife.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 bravomylife.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.bravomylife.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: PayWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930144800][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.pay.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import kr.co.bravomylife.front.basket.controller.BasketWeb;
import kr.co.bravomylife.front.buy.dto.BuyDetailDto;
import kr.co.bravomylife.front.buy.dto.BuyDetailListDto;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.member.dto.MemberDto;
import kr.co.bravomylife.front.member.service.MemberSrvc;
import kr.co.bravomylife.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.pay.controller.PayWeb")
public class PayWeb extends Common {

	@Autowired
	Properties staticProperties;
	
	@Inject
	MemberSrvc memberSrvc;
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BasketWeb.class);
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	/*
	@RequestMapping(value = "/front/pay/index.web")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/pay/index");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	*/
	
	@RequestMapping(value = "/front/pay/index.web")
	public ModelAndView index(BuyDetailListDto buyDetailListDto, HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String staticKey = staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes = new SKwithAES(staticKey);
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			MemberDto _memberDto = memberSrvc.select(memberDto);
			_memberDto.setEmail(aes.decode(_memberDto.getEmail()));
			_memberDto.setMbr_nm(aes.decode(_memberDto.getMbr_nm()));
			_memberDto.setPhone(aes.decode(_memberDto.getPhone()));
			_memberDto.setPost(aes.decode(_memberDto.getPost()));
			_memberDto.setAddr1(aes.decode(_memberDto.getAddr1()));
			_memberDto.setAddr2(aes.decode(_memberDto.getAddr2()));
			
			DecimalFormat formatter = new DecimalFormat("#,###");
			
			List<BuyDetailDto> _buyDetailListDto = buyDetailListDto.getBuyList();
			List<Map<String, Object>> responseList = new ArrayList<>();
			
			int totalPriceSum = 0;
			int totalPointSum = 0;
			int totalPrice = 0;
			int totalPoint = 0;
			
			String formatTotalPriceSum = "";
			String formatTotalPointSum = "";
			
			for (BuyDetailDto detail : _buyDetailListDto) {
				
				Map<String, Object> map = new HashMap<>();
				map.put("seq_sle", detail.getSeq_sle());
				map.put("sle_nm", detail.getSle_nm());
				map.put("price", detail.getPrice());
				map.put("count", detail.getCount());
				map.put("point", detail.getPoint());
				map.put("total_price_sum", detail.getTotal_price_sum());
				map.put("total_point_sum", detail.getTotal_point_sum());
				
				logger.debug("수량" + detail.getCount());
				logger.debug("포인트" + detail.getPoint());
				
				totalPrice = detail.getPrice() * detail.getCount();
				totalPoint = detail.getPoint() * detail.getCount();
				
				totalPriceSum += totalPrice;
				totalPointSum += totalPoint;
				
				logger.debug("판매 일련번호" + detail.getSeq_sle());
				logger.debug("판매명" + detail.getSle_nm());
				logger.debug("판매 가격" + detail.getPrice());
				logger.debug("판매 개수" + detail.getCount());
				logger.debug("포인트" + detail.getPoint());
				logger.debug("개별 총 금액" + totalPrice);
				logger.debug("개별 총 포인트" + totalPoint);
				
				logger.debug("금액 총합" + totalPriceSum);
				logger.debug("포인트 총합" + totalPointSum);
				
				formatTotalPriceSum = formatter.format(totalPriceSum);
				formatTotalPointSum = formatter.format(totalPointSum);
				
				responseList.add(map);
			}
			
			mav.addObject("buyList", responseList);
			mav.addObject("formatTotalPriceSum", formatTotalPriceSum);
			mav.addObject("formatTotalPointSum", formatTotalPointSum);
			mav.addObject("totalPriceSum", totalPriceSum);
			mav.addObject("totalPointSum", totalPointSum);
			mav.addObject("memberDto", _memberDto);
			mav.setViewName("front/pay/index");
		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		}
		return mav;
	}
}
