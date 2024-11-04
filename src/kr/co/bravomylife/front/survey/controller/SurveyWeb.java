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
 * File			: SurveyWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241104165626][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.survey.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.front.basket.controller.BasketWeb;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.survey.dto.SurveyDto;
import kr.co.bravomylife.front.survey.service.SurveySrvc;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-11-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.survey.controller.SurveyWeb")
public class SurveyWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BasketWeb.class);
	
	@Inject
	private SurveySrvc surveySrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-11-04
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/surveyProc.web")
	public ModelAndView surveyProc(HttpServletRequest request, HttpServletResponse response, SurveyDto surveyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		surveyDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
		
		logger.debug("type 확인" + surveyDto.getCd_survey_type());
		
		try {
			
			if (surveyDto.getCd_survey_type().equals("2")) {
				
				//mav.addObject("surveyDto"	, surveyDto);
				mav.setViewName("front/center/board/personalHealth/survey/Tes2");
			}
			else if (surveyDto.getCd_survey_type().equals("3")) {
				
				//mav.addObject("surveyDto"	, surveyDto);
				mav.setViewName("front/center/board/personalHealth/survey/Tes3");
			}
			else if (surveyDto.getCd_survey_type().equals("4")) {
				
				//mav.addObject("surveyDto"	, surveyDto);
				mav.setViewName("front/center/board/personalHealth/survey/Tes4");
			}
			else if (surveyDto.getCd_survey_type().equals("5")) {
				
				//mav.addObject("surveyDto"	, surveyDto);
				mav.setViewName("front/center/board/personalHealth/survey/Tes5");
			}
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".surveyProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-011-04
	 * <p>DESCRIPTION: 리뷰 관리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/surveyForm.web")
	public ModelAndView surveyForm(HttpServletRequest request, HttpServletResponse response, SurveyDto surveyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			mav.setViewName("front/center/board/personalHealth/survey/Tes");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".surveyForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}