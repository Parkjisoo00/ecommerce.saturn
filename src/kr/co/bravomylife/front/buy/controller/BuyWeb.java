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

import java.util.ArrayList;
import java.util.Collections;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.common.dto.FileUploadDto;
import kr.co.bravomylife.common.file.FileUpload;
import kr.co.bravomylife.front.buy.dto.BuyDetailDto;
import kr.co.bravomylife.front.buy.dto.BuyDetailListDto;
import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
import kr.co.bravomylife.front.buy.service.BuySrvc;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.sale.dto.SaleDto;
import kr.co.bravomylife.front.sale.dto.SaleFileDto;
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
	private MessageSourceAccessor dynamicProperties;
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	BuySrvc buySrvc;
	
	@Inject
	SaleSrvc saleSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-17
	 * <p>DESCRIPTION: 고객센터 쓰기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({"unchecked" })
	@RequestMapping(value = "/front/buy/reviewWriteProc.web", method = RequestMethod.POST)
	public ModelAndView reviewWriteProc(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message = "";
		
		try {
			
			int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			saleDto.setSeq_mbr(seqMbr);
			saleDto.setRegister(seqMbr);
			
			String pathBase = dynamicProperties.getMessage("backoffice.upload.path", "[UNDEFINED]");
			String maxSize = dynamicProperties.getMessage("backoffice.upload.file.max10MB", "[UNDEFINED]");
			String allowedExt = dynamicProperties.getMessage("backoffice.upload.file.extension.doc", "[UNDEFINED]");
			
			int countFile = fileUploadDto.getFiles() != null ? fileUploadDto.getFiles().size() : 0;
			
			if (countFile > 0) {
				
				LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);
				
				Hashtable<String, String> hashtable = (Hashtable<String, String>) uploadResult.getLast();
				
				message = hashtable.get("resultID");
				
				if (message.equals("success")) {
					
					SaleFileDto[] saleFileDto = new SaleFileDto[countFile];
					for (int loop = 0; loop < countFile; loop++) {
						
						String fileNameSrc = hashtable.get("files[" + loop + "]_fileSrcName");
						String fileNameSve = hashtable.get("files[" + loop + "]_fileSveNameRelative");
						String fileSize = hashtable.get("files[" + loop + "]_fileSveSize");
						if (fileSize == null || fileSize.isEmpty()) fileSize = "0";
						
						saleFileDto[loop] = new SaleFileDto();
						saleFileDto[loop].setSeq_sle(saleDto.getSeq_sle());
						saleFileDto[loop].setSeq_mbr(saleDto.getSeq_mbr());
						saleFileDto[loop].setFile_orig(fileNameSrc);
						saleFileDto[loop].setFile_save(fileNameSve);
					}
					
					boolean result = false;
					
					if (countFile > 0) {
						
						result = saleSrvc.insertReview(saleDto, saleFileDto);
					} else {
						
						result = saleSrvc.insertText(saleDto);
					}
					if (result) {
						
						request.setAttribute("script", "alert('상품 후기가 등록되었습니다.');");
						request.setAttribute("redirect", "/");
					} else {
						
						request.setAttribute("script", "alert('시스템 관리자에게 문의하세요!');");
						request.setAttribute("redirect", "/");
					}
				} 
			} 
		mav.setViewName("forward:/servlet/result.web");
		
		}	catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".reviewWriteProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
				/*
				boolean result = false;
				
				if (countFile > 0) {
					
					result = saleSrvc.insertReview(saleDto, saleFileDto);
				} else {
					
					result = saleSrvc.insertReview(saleDto);
				}
				if (result) {
					
					request.setAttribute("script", "alert('상품 후기가 등록되었습니다.');");
					request.setAttribute("redirect", "/");
				} else {
					
					request.setAttribute("script", "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect", "/");
				}
			} 
		} 
		mav.setViewName("forward:/servlet/result.web");
	
		} 	catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".reviewWriteProc()] " + e.getMessage(), e);
		}
		finally {}
	
		return mav;
	}
	*/
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-010-17
	 * <p>DESCRIPTION: 리뷰 관리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/review.web")
	public ModelAndView review(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			mav.addObject("saleDto", saleDto);
			mav.setViewName("front/buy/review");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".review()] " + e.getMessage(), e);
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
	 * @since 2024-10-13
	 * <p>DESCRIPTION: 상품 구매</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/writeProc.web")
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, BuyDetailListDto buyDetailListDto, int usePoint) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			// logger.debug("" + buyDetailListDto.getBuyList().size());
			// logger.debug("사용한 포인트" + usePoint);
			
			String finalSleName = "";	// 마지막 판매 상품명
			
			int totalCount = 0;			// 총 갯수
			// int totalPrice = 0;
			int totalPrice = 0;			// 총 가격
			int totalPoint = 0;			// 총 포인트
			
			ArrayList<BuyDetailDto> listBuyDetailDto = new ArrayList<BuyDetailDto>();
			
			if (buyDetailListDto.getBuyList() != null) {
				for (int loop = 0; loop < buyDetailListDto.getBuyList().size(); loop++) {
					
					if (buyDetailListDto.getBuyList().get(loop).getCount() >= 1) {
						
						// logger.debug(loop + " : seq_sle(" + buyDetailListDto.getBuyList().get(loop).getSeq_sle() + ")" + " + count(" + buyDetailListDto.getBuyList().get(loop).getCount() + ")");
						
						// 갯수가 1개 이상인 상품
						listBuyDetailDto.add(buyDetailListDto.getBuyList().get(loop));
						
						// 전체 상품 갯수 및 금액 그리고 구매명
						totalCount += buyDetailListDto.getBuyList().get(loop).getCount();
						totalPrice += buyDetailListDto.getBuyList().get(loop).getCount() * buyDetailListDto.getBuyList().get(loop).getPrice();
						totalPoint += buyDetailListDto.getBuyList().get(loop).getCount() * buyDetailListDto.getBuyList().get(loop).getPoint();
						finalSleName = buyDetailListDto.getBuyList().get(loop).getSle_nm();
						
						if (loop == buyDetailListDto.getBuyList().size() - 1) {
							
							totalPrice -= usePoint;
							if (totalPrice < 0) {
								totalPrice = 0;
							}
						}
					}
				}
			}
			// logger.debug("count=" + listBuyDetailDto.size());
			
			// 선택된 상품이 1개 이상을 경우만 구매 실행
			if (listBuyDetailDto.size() > 0) {
				
				// 마스터 설정
				BuyMasterDto buyMasterDto = new BuyMasterDto();
				buyMasterDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
				buyMasterDto.setBuy_info(finalSleName + "-포함(총 개수: " + totalCount + ")");
				buyMasterDto.setBuy_count(totalCount);
				buyMasterDto.setBuy_price(totalPrice);
				buyMasterDto.setTotal_point(totalPoint);
				buyMasterDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
				
				if (buySrvc.insert(buyMasterDto, listBuyDetailDto, "N/A")) {
					request.setAttribute("script"	, "alert('추후 결제 페이지로 이동 예정');");
					request.setAttribute("redirect"	, "/");
				}
				else {
					request.setAttribute("script"	, "alert('구매에 실패했습니다! 잠시 후에 이용 바랍니다!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('선택된 상품이 없습니다!');");
				request.setAttribute("redirect"	, "/");
			}
			
			request.setAttribute("redirect"	, "/");
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
	 * @param saleDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-13
	 * <p>DESCRIPTION: 상품 상세 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/front/buy/writeForm.web")
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, PagingDto reviewpagingDto, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String check = "[UNDEFINED]";
			
			if (check.equals(getSession(request, "SEQ_MBR"))) {
				
				reviewpagingDto.setSeq_mbr(0);
				saleDto.setSeq_mbr(0);
			} else {
				
				reviewpagingDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
				saleDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
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
			
			if (reviewList != null && !reviewList.isEmpty()) {
				
				if (reviewList.get(0).getRate_review().equals("") || reviewList.get(0).getRate_review() == null) {
					
					_reviewpagingDto.setList("");
				} else {
					
					for (int loop = 0; loop < reviewList.size(); loop++) {
						reviewList.get(loop).setMbr_nm(aes.decode(reviewList.get(loop).getMbr_nm()));
					}
				}
			} else {
				
				mav.addObject("reviewList", Collections.emptyList());
			}
			
			mav.addObject("reviewList"	, _reviewpagingDto.getList());
			
			mav.setViewName("front/buy/writeForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
