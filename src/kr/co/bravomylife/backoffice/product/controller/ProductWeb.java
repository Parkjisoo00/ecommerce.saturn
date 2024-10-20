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

import kr.co.bravomylife.backoffice.product.dto.ProductDto;
import kr.co.bravomylife.backoffice.product.service.ProductSrvc;
import kr.co.bravomylife.common.dto.FileDto;
import kr.co.bravomylife.common.dto.FileUploadDto;
import kr.co.bravomylife.common.file.FileUpload;

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
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(ProductWeb.class);
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	ProductSrvc productSrvc;
	
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
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/backoffice/product/productRegProc.web")
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, ProductDto productDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			//파일이 저장될 기본 경로를 가져온다
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_product", "[UNDEFINED]");
			//업로드 가능한 파일의 최대 크기
			String maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max5MB"			, "[UNDEFINED]");
			//허용되는 파일 확장자
			String allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.image"	, "[UNDEFINED]");
			
			logger.debug("업로드 경로 확인" + pathBase);
			
			//파일 개수 확인
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();

			//파일 DTO에 배열 생성
			FileDto[] fileDto = new FileDto[countFile];
			//파일 업로드 수행
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);

			//업로드 결과 확인
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");

			//성공적으로 업로드된 경우 처리
			if (message.equals("success")) {
				
				@SuppressWarnings("unchecked")
				Hashtable<String, String> hashtable	= (Hashtable<String, String>)uploadResult.getLast();
				
				//파일 정보 처리 및 DTO 설정
				
				if (countFile == 2) { // 파일 개수가 2개일 경우
					// 첫 번째 파일의 원본 파일명
					
					String firstFileNameSrc = (String) hashtable.get("files[0]_fileSrcName"); // 첫 번째 원본 파일명
					String firstFileNameSve = firstFileNameSrc; // 첫 번째 파일명으로 저장

					// 첫 번째 파일 정보 설정
					fileDto[0] = new FileDto();
					fileDto[0].setFileNameOriginal(firstFileNameSrc); // 첫 번째 원본명 설정
					fileDto[0].setFileNameSave(firstFileNameSve); // 첫 번째 저장명 설정 (원본명으로)

					// 두 번째 파일의 원본 파일명
					String secondFileNameSrc = (String) hashtable.get("files[1]_fileSrcName"); // 두 번째 원본 파일명
					String secondFileNameSve = secondFileNameSrc; // 두 번째 파일명으로 저장

					// 두 번째 파일 정보 설정
					fileDto[1] = new FileDto();
					fileDto[1].setFileNameOriginal(secondFileNameSrc); // 두 번째 원본명 설정
					fileDto[1].setFileNameSave(secondFileNameSve); // 두 번째 저장명 설정 (원본명으로)

				// 상품 DTO에 파일 정보 설정
				productDto.setImg(fileDto[0].getFileNameOriginal()); // 첫 번째 이미지
				productDto.setDesces(fileDto[1].getFileNameOriginal()); // 두 번째 이미지
				}
				
				//상품 DTO에 파일 정보 설정
				 
				//상품 등록 처리
				if (productSrvc.insert(productDto)) {
					request.setAttribute("script"	, "alert('등록되었습니다.');");
					request.setAttribute("redirect"	, "/console/");
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/console/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('" + message + "');");
				request.setAttribute("redirect"	, "/console/");
			}
			
			mav.setViewName("/console/");
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
