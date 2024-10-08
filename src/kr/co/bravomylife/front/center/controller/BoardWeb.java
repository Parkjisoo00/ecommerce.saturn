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
			
			/* 24.10.08 cydgate4957@gmail.com*/
			/* 진유혁 */
			/* 민선씨에게 -- 집에 가시고도 저한테 물어봤던 부분을 계속 생각해봤습니다. 해결해서 알려드립니다. */
			/* 먼저 강의 끝나기 전에 봤을 때도 약간 이상했는데 로그인 세션 체크가 제대로 되고 있지 않아서 수정했습니다. */
			/* 이제 로그인 세션 체크가 정상적으로 동작하고 로그인 하지 않았을시 로그인 페이지로 이동시킵니다. 문제는 (1)의 else 중괄호 {}가 코드의 마지막까지 전부 감싸야 밑에 코드 로직들이 메소드의 한 블럭 */
			/* 안에서 동작하는데 민선씨는 else의 중괄호를 끝까지 닫지 않고 (2) 에서 닫아버려 "script"와 "redirect"가 result.web으로 요청되지 못해 로그인을 하지 않았음에도 경고창 뜨지 않고 로그인 페이지로 이동하지 */
			/* 않았던 것 입니다. */
			/* 그러나 이제 이 로그인 세션 체크는 여기서 필요가 없으므로 모두 주석 처리를 해놓았습니다. 우리가 원하는 로직은 cd_bbs_type = 3인 1대1 문의 게시판을 들어갈때 바로 로그인 세션 체크를 해서 */
			/* 로그인을 하지 않았을시 로그인 페이지로 보내는 것이 아닌, 1대1 문의 게시판이 그대로 보이되 로그인을 하지 않았을시 어떤 내용도 출력하지 않는 것이었기 때문입니다.*/
			/* 여기서 문제는 로그인을 한 뒤에는 세션 체크를 통해 seq_mbr을 register로 등록할 수 있어 1:1 문의 메뉴 버튼이 제대로 출력되지만 */
			/* 로그인을 하지 않은 상태에서는 세션 체크로 가지고 올 seq_mbr이 없으므로 이때 세션 체크 메소드에 정의된 바에 따라 세션에서 가지고 올 seq_mbr이 없을시 [UNDEFINED]라는 값이 */
			/* 출력되어 집니다. 이때 [UNDEFINED]는 문자열이므로 int 정수 기본 타입인 register 필드 값에 설정되지 못합니다. */
			/* 원인의 정의는 여기까지고 이제 해결을 위해 가정을 하나 정하면, 로그인을 하지 않았을때의 값은 cd_bbs_type = 3 이고 세션 체크의 값이 [UNDEFINED]인 상태입니다. 그러므로 이 부분을 if 조건문으로 걸어서 */
			/* if (pagingDto.getCd_bbs_type() == 3 && check.equals(getSession(request, "SEQ_MBR"))) {pagingDto.setRegister(0); 로그인 하지 않고 1대1 문의 게시판에 진입할시 임의로 register의 값에 0이 들어가도록 */
			/* 코드를 짜두었습니다. 이제 로그인을 하지 않았을때도 1대1 문의 게시판에 정상적으로 진입할 수 있고 메뉴 버튼도 활성화되어 집니다. */
			/* 물론, 당연히 register = 0이란 등록자(회원)은 존재하지 않으므로 1대1 게시판에는 어떤 게시글도 출력되지 않습니다. */
			/* 이 주석은 지우지 말고 시간 나시거든 한번 천천히 읽어보세요. */
			
			/* 로그인 세션 체크가 정상적으로 동작하지 않던 코드 수정 */
			/*이 주석을 풀시 이 코드를 사용하거나 아래의 코드 하나만을 사용해야 됨 */
			/*
			if (pagingDto.getCd_bbs_type() == 3 && !sessionCmpn.isSession(request)) {
				request.setAttribute("script"	, "alert('로그인이 필요합니다!');");
				request.setAttribute("redirect"	, "/front/login/loginForm.web?url=/front/center/board/list.web");
				mav.setViewName("forward:/servlet/result.web");
			}
			else (1) {
				
				if (pagingDto.getCd_bbs_type() == 3)
					pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
				
				PagingListDto pagingListDto = boardSrvc.list(pagingDto);
				
				mav.addObject("paging"	, pagingListDto.getPaging());
				mav.addObject("list"	, pagingListDto.getList());
				(2)
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
			*/
			
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
