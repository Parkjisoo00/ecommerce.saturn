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
 * Program		: com.github.ecommorce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BoardWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004150812][lcm991224#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.center.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.front.center.service.BoardSrvc;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.component.SessionCmpn;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;

/**
 * @version 1.0.0
 * @author lcm991224#gmail.com
 * 
 * @since 2024-10-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.center.controller.BoardWeb")
public class BoardWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BoardWeb.class);
	
	@Autowired
	SessionCmpn sessionCmpn;
	
	@Inject
	BoardSrvc boardSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-07
	 * <p>DESCRIPTION: 고객센터 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			
			/* 로그인 세션 체크가 정상적으로 동작하지 않던 코드 수정 */
			/*이 주석을 풀시 이 코드를 사용하거나 아래의 코드 하나만을 사용해야 됨 */
			
			if (pagingDto.getCd_bbs_type() == 3 && !sessionCmpn.isSession(request)) {
				request.setAttribute("script"	, "alert('로그인이 필요합니다!');");
				request.setAttribute("redirect"	, "/front/login/loginForm.web?url=/front/center/board/list.web");
				mav.setViewName("forward:/servlet/result.web");
			}
			else {
				// 로그인 성공 후 세션에 사용자 정보 저장
				if (pagingDto.getCd_bbs_type() == 3) {
					HttpSession session = request.getSession();
					session.setAttribute("sessionUser", "SEQ_MBR");
				}
				/*
				if (pagingDto.getCd_bbs_type() == 3) {
					pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
				
				PagingListDto pagingListDto = boardSrvc.list(pagingDto);
				
				mav.addObject("paging"	, pagingListDto.getPaging());
				mav.addObject("list"	, pagingListDto.getList());
				}
				*/
				/*
				if (pagingDto.getCd_bbs_type() == 1) {
					mav.setViewName("front/center/board/notice/list");
				}
				else if (pagingDto.getCd_bbs_type() == 2) {
					mav.setViewName("front/center/board/faq/list");
				}
				else if (pagingDto.getCd_bbs_type() == 3) {
					mav.setViewName("front/center/board/question/list");
				}
				
				else {
					request.setAttribute("redirect"	, "/");
					mav.setViewName("forward:/servlet/result.web");
				}
				*/
			}
			
			
			logger.debug("게시판 타입 확인" + " + " + pagingDto.getCd_bbs_type());
			logger.debug("세션 SEQ_MBR 확인" + " + " + getSession(request, "SEQ_MBR"));
			
				String check = "[UNDEFINED]";
				
				if (pagingDto.getCd_bbs_type() == 3 && check.equals(getSession(request, "SEQ_MBR"))) {
					pagingDto.setRegister(0);
				} else if (pagingDto.getCd_bbs_type() == 3 && !check.equals(getSession(request, "SEQ_MBR"))) {
					pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
				}
				
				PagingListDto pagingListDto = boardSrvc.list(pagingDto);
				
				logger.debug("등록자 번호 확인" + " + " + pagingDto.getRegister());
				
				mav.addObject("paging"	, pagingListDto.getPaging());
				mav.addObject("list"	, pagingListDto.getList());
				
				if (pagingDto.getCd_bbs_type() == 1) {
					mav.setViewName("front/center/board/notice/list");
				}
				else if (pagingDto.getCd_bbs_type() == 2) {
					mav.setViewName("front/center/board/faq/list");
				}
				else if (pagingDto.getCd_bbs_type() == 3) {
					mav.setViewName("front/center/board/question/list");
				}
				else {
					request.setAttribute("redirect"	, "/");
					mav.setViewName("forward:/servlet/result.web");
				}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".totalList()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
