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
 * Program		: kr.co.bravomylife
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BasketWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930144655][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.basket.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.front.basket.controller.BasketWeb;
import kr.co.bravomylife.front.basket.dto.BasketDto;
import kr.co.bravomylife.front.basket.service.BasketSrvc;
import kr.co.bravomylife.front.buy.dto.BuyDto;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.basket.controller.BasketWeb")
public class BasketWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BasketWeb.class);
	
	@Inject
	BasketSrvc basketSrvc;
	
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
	@RequestMapping(value = "/front/basket/setBasketIframe.web")
	public ModelAndView setBasketIframe(HttpServletRequest request, HttpServletResponse response
			, String item) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			logger.debug("item=" + item);
			
			String[] arrBasket = item.split("\\|");
			logger.debug("arrBasket.length=" + arrBasket.length);
			
			BasketDto basketDto = new BasketDto();
			
			basketDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			basketDto.setSeq_sle(Integer.parseInt(arrBasket[0]));
			basketDto.setSle_nm(arrBasket[1]);
			basketDto.setPrice(Integer.parseInt(arrBasket[2]));
			basketDto.setCount(Integer.parseInt(arrBasket[3]));
			basketDto.setImg(arrBasket[4]);
			basketDto.setPoint_value(Integer.parseInt(arrBasket[5]));
			
			if (basketSrvc.insert(basketDto)) {
				request.setAttribute("script", "alert('장바구니에 저장되었습니다');");
			}
			else {
				request.setAttribute("script", "alert('시스템 관리자에게 문의하세요');");
				
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".setBasketIframe()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/basket/main.web")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, BuyDto buyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			pagingDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			PagingListDto pagingListDto = basketSrvc.listing(pagingDto);
			
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("front/basket/index");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".main()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
