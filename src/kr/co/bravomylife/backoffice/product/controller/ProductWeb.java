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
 * Program		: com.github.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: LoginWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930153637][lcm991224@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.product.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.product.dto.ProductDto;
import kr.co.bravomylife.backoffice.product.service.ProductSrvc;

/**
 * @version 1.0.0
 * @author lcm991224@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.product.controller.ProductWeb")
public class ProductWeb {
	
	@Inject
	ProductSrvc productSrvc;
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(ProductWeb.class);
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-17
	 * <p>DESCRIPTION:상품 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/backoffice/product/productRegProc.web")
	public ModelAndView productRegProc(HttpServletRequest request, HttpServletResponse response, ProductDto productDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			logger.debug("새턴" + productDto.getDesces());
			
			productSrvc.insert(productDto);
			
			mav.setViewName("front/sale/total_list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".productRegProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-17
	 * <p>DESCRIPTION:상품 등록 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/backoffice/product/productReg.web")
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("backoffice/product/productReg");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".productReg()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
