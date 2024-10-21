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
 * File			: SaleSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241001112558][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.sale.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.sale.dao.SaleDao;
import kr.co.bravomylife.front.sale.dto.SaleDto;
import kr.co.bravomylife.front.sale.dto.SaleFileDto;
import kr.co.bravomylife.front.sale.dto.SaleListDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.front.sale.service.SaleSrvc")
public class SaleSrvc {
	
	@Inject
	SaleDao saleDao;
	
	public SaleDto review(SaleDto saleDto) {
		
		return saleDao.review(saleDto);
	}
	
	@Transactional("txFront")
	public boolean deleteLike(SaleDto saleDto) {
		
		int result = saleDao.deleteLike(saleDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public SaleListDto reviewListPage(SaleDto saleDto) {
		
		SaleListDto saleListDto = new SaleListDto();
		
		saleListDto.setSale(saleDto);
		saleListDto.setList(saleDao.reviewListPage(saleDto));
		
		return saleListDto;
	}
	
	/*
	@Transactional("txFront")
	public boolean insertRate(SaleDto saleDto) {
		try {
			
			saleDto.setSeq_rate(saleDao.rateSequence());
			
			int result = saleDao.rateInsert(saleDto);
			
			if(result == 1) {
				
				return true;
			}
			return false;
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	*/
	
	@Transactional("txFront")
	public boolean reviewCheck(SaleDto saleDto) {
		
		boolean totalResult = false;
		
		try {
			
			int result = saleDao.reviewCheck(saleDto);
			
			if (result == 1) { 
				
				totalResult = true;
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
		return totalResult;
	}
	
	@Transactional("txFront")
	public boolean insertText(SaleDto saleDto) {
		
		boolean totalResult = false;
		
		int result = 0;
		
		saleDto.setSeq_review(saleDao.sequence());
		saleDto.setSeq_rate(saleDao.rateSequence());
		
		try {
			
			result += saleDao.insertText(saleDto);
			result += saleDao.rateInsert(saleDto);
			result += saleDao.dtlUpdate(saleDto);
			
			if (result == 3) { 
				
				totalResult = true;
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
		return totalResult;
	}
	
	@Transactional("txFront")
	public boolean insertReview(SaleDto saleDto, SaleFileDto[] saleFileDto) {
		
		boolean totalResult = false;
		int result = 0;
		
		saleDto.setSeq_review(saleDao.sequence());
		saleDto.setSeq_rate(saleDao.rateSequence());
		
		try {
			
			result += saleDao.insertReview(saleDto);
			result += saleDao.rateInsert(saleDto);
			result += saleDao.dtlUpdate(saleDto);
			
			if (result == 3) {
				
				if (saleFileDto[0].getFile_orig() != null && !saleFileDto[0].getFile_orig().equals("")) {
				
					for (SaleFileDto fileDto : saleFileDto) {
						
						fileDto.setSeq_sle(saleDto.getSeq_sle());
						fileDto.setSeq_review(saleDto.getSeq_review());
						
						int reImgResult = saleDao.insertReviewFile(fileDto);
						
						if (reImgResult <= 0) {
							
							return false;
						}
					}
				}
				totalResult = true;
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
		return totalResult;
	}
		
	public SaleDto reviewCounts(SaleDto saleDto) {
		
		return saleDao.reviewCounts(saleDto);
	}
	
	@Transactional("txFront")
	public boolean delLike(SaleDto saleDto) {
		
		int result = saleDao.delLike(saleDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean setLike(SaleDto saleDto) {
		try {
			
			int check = saleDao.setLikeCheck(saleDto);
			
			if (check == 1) {
				
				saleDao.setLikeUpdate(saleDto);
				return true;
			}
			else if (check == 0) {
								
				int result = saleDao.setLikeInsert(saleDto);
				if (result == 1) {
					
					return true;
				} else {
					
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					return false;
				}
			}
			return false;
		} catch (Exception e) {
			
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean insertReview(SaleDto saleDto) {
		
		int result = saleDao.insertReview(saleDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public PagingListDto mergeReviewAndImages(PagingListDto reviewListDto, PagingListDto reviewImgsDto) {
		
		List<SaleDto> reviewList = (List<SaleDto>) reviewListDto.getList();
		List<SaleDto> reviewImgsList = (List<SaleDto>) reviewImgsDto.getList();
		
		Map<Integer, List<String>> imagesMap = new HashMap<>();
		
		for (SaleDto reviewImg : reviewImgsList) {
			
			int seqReview = reviewImg.getSeq_review();
			String fileSave = reviewImg.getFile_save();
			
			if (!imagesMap.containsKey(seqReview)) {
				
				imagesMap.put(seqReview, new ArrayList<>());
			}
			
			imagesMap.get(seqReview).add(fileSave);
		}
		
		for (SaleDto review : reviewList) {
			int seqReview = review.getSeq_review();
			
			List<String> images = imagesMap.get(seqReview);
			
			if (images != null) {
				review.setImgs(images);
			}
		}
		
		PagingListDto mergedPagingListDto = new PagingListDto();
		mergedPagingListDto.setPaging(reviewListDto.getPaging());
		mergedPagingListDto.setList(reviewList);
		
		return mergedPagingListDto;
	}
	
	public PagingListDto reviewList(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		pagingDto.setLinePerPage(5);
		
		int totalLine = saleDao.reviewCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(saleDao.reviewList(pagingDto));
		
		return pagingListDto;
	}
	
	public PagingListDto reviewListImgs(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		pagingDto.setLinePerPage(5);
		
		int totalLine = saleDao.reviewCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(saleDao.reviewListImgs(pagingDto));
		
		return pagingListDto;
	}
	
	public PagingListDto detailList(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		pagingDto.setLinePerPage(5);
		pagingDto.setTotalPage(1);
		
		int totalPage = pagingDto.getTotalPage();
		
		int totalLine = saleDao.detailCount(pagingDto);
		
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(saleDao.detailList(pagingDto));
		
		return pagingListDto;
	}
	
	public SaleDto select(SaleDto saleDto) {
		return saleDao.select(saleDto);
	}
	
	public PagingListDto functionList(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = saleDao.functionCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(saleDao.functionList(pagingDto));
		
		return pagingListDto;
	}
	
	public PagingListDto ingredientList(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = saleDao.ingredientCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(saleDao.ingredientList(pagingDto));
		
		return pagingListDto;
	}
	
	public PagingListDto genderList(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = saleDao.genderCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(saleDao.genderList(pagingDto));
		
		return pagingListDto;
	}
	
	public PagingListDto totalList(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = saleDao.totalCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(saleDao.totalList(pagingDto));
		
		return pagingListDto;
	}
	
	public PagingListDto listingMyLike(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(saleDao.listingMyLike(pagingDto));
		
		return pagingListDto;
	}
	
	public PagingListDto listingLike(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = saleDao.myLikeCount(pagingDto);
		
		int totalPage = (int) Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(saleDao.listingLike(pagingDto));
		
		return pagingListDto;
	}
}