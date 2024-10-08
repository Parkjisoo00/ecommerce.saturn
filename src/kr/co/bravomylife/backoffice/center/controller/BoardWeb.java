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
 *				: [20241008110249][lcm991224#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.center.controller;



import java.util.Hashtable;
import java.util.LinkedList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.center.dto.BoardDto;
import kr.co.bravomylife.backoffice.center.service.BoardSrvc;
import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.backoffice.common.component.SessionCmpn;
import kr.co.bravomylife.backoffice.common.dto.PagingDto;
import kr.co.bravomylife.backoffice.common.dto.PagingListDto;
import kr.co.bravomylife.common.dto.FileDto;
import kr.co.bravomylife.common.dto.FileUploadDto;
import kr.co.bravomylife.common.file.FileUpload;



/**
 * @version 1.0.0
 * @author lcm991224#gmail.com
 * 
 * @since 2024-10-08
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.center.controller.BoardWeb")
public class BoardWeb extends Common{
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BoardWeb.class);
	
	@Autowired
	SessionCmpn sessionCmpn;
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	BoardSrvc boardSrvc;

	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 쓰기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/center/board/writeForm.web")
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			if (boardDto.getCd_bbs_type() == 1) {
				mav.setViewName("backoffice/center/board/notice/writeForm");
			}
			else if (boardDto.getCd_bbs_type() == 2) {
				mav.setViewName("backoffice/center/board/faq/writeForm");
			}
			else if (boardDto.getCd_bbs_type() == 3) {
				
				BoardDto _boardDto = boardSrvc.select(boardDto);
				
				mav.addObject("boardDto", _boardDto);
				mav.setViewName("backoffice/center/board/question/writeForm");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @param fileUploadDto [파일 업로드 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 쓰기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	@RequestMapping(value = "/console/center/board/writeProc.web")
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			
			logger.debug("++++++++++++++++++++++++++++++++++++++++++++++++++" );
			
			// boardDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			// **************************
			// For Board File
			// **************************
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path", "[UNDEFINED]") + "/bbs/";
			String maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
			String allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.image"	, "[UNDEFINED]");
			
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();
			
			FileDto[] fileDto = new FileDto[countFile];
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);
			
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");
			
			if (message.equals("success")) {
				
				Hashtable<String, String> hashtable	= (Hashtable<String, String>)uploadResult.getLast();
				
				String fileNameSrc	= "";
				String fileNameSve	= "";
				String fileSize		= "";
				long totalSize		= 0;
				
				for (int loop = 0; loop < countFile; loop++) {
					fileNameSrc		= (String)hashtable.get("files[" + loop + "]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[" + loop + "]_fileSveNameRelative");
					fileSize		= (String)hashtable.get("files[" + loop + "]_fileSveSize");
					if (fileSize == null || fileSize == "") fileSize = "0";
					
					fileDto[loop] = new FileDto();
					fileDto[loop].setFileNameOriginal(fileNameSrc);
					fileDto[loop].setFileNameSave(fileNameSve);
					fileDto[loop].setFileSize((Long.parseLong(fileSize)));
					
					totalSize += Long.parseLong(fileSize);
				}
				
				/*
				if (totalSize > 0) {
					boardSrvc.insert(boardDto, boardFileDto);
				}
				else {
					boardSrvc.insert(boardDto);
				}
				*/
				
				boardDto.setFile_orig(fileNameSrc);
				boardDto.setFile_save("bbs\\" + fileNameSve);
				
				if (boardDto.getCd_bbs_type() == 3) {
					// 답변글(상위 일련번호에 문의글 번호를 저장)
					boardDto.setSeq_bbs_parent(boardDto.getSeq_bbs());
					boardDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
				}
				
				if (boardSrvc.insert(boardDto)) {
					if (boardDto.getCd_bbs_type() == 3) {
						request.setAttribute("script"	, "alert('답변이 등록되었습니다.');");
					}
					else {
						request.setAttribute("script"	, "alert('등록되었습니다.');");
					}
					request.setAttribute("redirect"	, "/console/center/board/list.web?cd_bbs_type=" + boardDto.getCd_bbs_type());
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('" + message + "');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeProc()] " + e.getMessage(), e);
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
	 * @since 2024-10-08
	 * <p>DESCRIPTION:고객센터 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/center/board/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			logger.debug("게시판 타입 확인" + " + " + pagingDto.getCd_bbs_type());
			
			PagingListDto pagingListDto = boardSrvc.list(pagingDto);
			
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			if (pagingDto.getCd_bbs_type() == 1) {
				mav.setViewName("backoffice/center/board/notice/list");
			}
			else if (pagingDto.getCd_bbs_type() == 2) {
				mav.setViewName("backoffice/center/board/faq/list");
			}
			else if (pagingDto.getCd_bbs_type() == 3) {
				mav.setViewName("backoffice/center/board/question/list");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
