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
 * File			: BuySrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241003231521][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.buy.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.front.buy.dao.BuyDao;
import kr.co.bravomylife.front.buy.dto.BuyDetailDto;
import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.pay.dao.PayDao;
import kr.co.bravomylife.front.pay.dto.PayDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-03
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.front.buy.service.BuySrvc")
public class BuySrvc {
	
	@Inject
	BuyDao buyDao;
	
	@Inject
	PayDao payDao;
	
	public PagingListDto pointHistory(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = buyDao.pointCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(buyDao.pointHistory(pagingDto));
		
		return pagingListDto;
	}
	
	@Transactional("txFront")
	public boolean update(String deal_num, int updater, String flg_success) {
		
		int result = 0;
		
		// Null 체크 필요
		if (deal_num == null || flg_success == null) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return false;
			}
		
		PayDto payDto = new PayDto();
		payDto.setDeal_num(deal_num);
		payDto.setFlg_success(flg_success);			// 성공(Y), 실패(N)
		result += payDao.update(payDto);
		
		// payDto가 null일 경우를 대비한 처리
		payDto = payDao.select(payDto);
			if (payDto == null) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return false;
			}
			
		BuyMasterDto buyMasterDto = new BuyMasterDto();
		buyMasterDto.setSeq_buy_mst(payDto.getSeq_buy_mst());
		buyMasterDto.setCd_state_pay(flg_success);	// 결제 완료(Y), 결제 전(N), 결제 취소(C)
		buyMasterDto.setUpdater(updater);
		result += buyDao.update(buyMasterDto);
		
		if (result == 2) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean insert(BuyMasterDto buyMasterDto, ArrayList<BuyDetailDto> listBuyDetailDto, String deal_num) {
			
		int result = 0;
		
		// int check = 0;
		
		// 구매 마스터 정보
		buyMasterDto.setSeq_buy_mst(buyDao.sequenceMaster());
		result += buyDao.insertMaster(buyMasterDto);
		
		// 구매 상세 정보들
		for (int loop = 0; loop < listBuyDetailDto.size(); loop++) {
			
			listBuyDetailDto.get(loop).setSeq_buy_dtl(buyDao.sequenceDetail());
			listBuyDetailDto.get(loop).setSeq_buy_mst(buyMasterDto.getSeq_buy_mst());
			listBuyDetailDto.get(loop).setRegister(buyMasterDto.getRegister());
			
			result += buyDao.insertDetail(listBuyDetailDto.get(loop));
			result += buyDao.updateCountStock(listBuyDetailDto.get(loop));
			
			buyDao.updateBasket(listBuyDetailDto.get(loop));
			/*
			check += buyDao.checkBasket(listBuyDetailDto.get(loop));
			
			
			if (check == listBuyDetailDto.size()) {
				
				buyDao.updateBasket(listBuyDetailDto.get(loop));
			}
			*/
		}
		
		// 결제 정보
		PayDto payDto = new PayDto();
		payDto.setSeq_pay(payDao.sequence());
		payDto.setSeq_mbr(buyMasterDto.getSeq_mbr());
		payDto.setSeq_buy_mst(buyMasterDto.getSeq_buy_mst());
		payDto.setDeal_num(deal_num);
		payDto.setRegister(buyMasterDto.getSeq_mbr());
		result += payDao.insert(payDto);
		
		if (result == 1 + listBuyDetailDto.size() + listBuyDetailDto.size() + 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	
	/**
	 * @return String
	 * 
	 * @since 2024-10-21
	 * <p>DESCRIPTION: 마이페이지 구매이력 총 구매 금액</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public String selectTotal(BuyDetailDto buyDetailDto) {
		return buyDao.selectTotal(buyDetailDto);
	}
	
	/**
	 * @return List<BuyDto>
	 * 
	 * @since 2024-10-21
	 * <p>DESCRIPTION: 마이페이지 구매이력 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<BuyDetailDto> list(BuyDetailDto buyDetailDto) {
		return buyDao.list(buyDetailDto);
	}
	
	/**
	 * @return List<BuyDto>
	 * 
	 * @since 2024-10-21
	 * <p>DESCRIPTION: 마이페이지 구매이력 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<BuyDetailDto> historyList(BuyDetailDto buyDetailDto) {
		return buyDao.historyList(buyDetailDto);
	}


	
}
