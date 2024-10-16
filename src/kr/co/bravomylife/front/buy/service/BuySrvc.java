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

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.front.buy.dao.BuyDao;
import kr.co.bravomylife.front.buy.dto.BuyDetailDto;
import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
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
	
	@Transactional("txFront")
	public boolean insert(BuyMasterDto buyMasterDto, ArrayList<BuyDetailDto> listBuyDetailDto) {
			
		int result = 0;
		
		// 구매 마스터 정보
		buyMasterDto.setSeq_buy_mst(buyDao.sequenceMaster());
		result += buyDao.insertMaster(buyMasterDto);
		
		// 구매 상세 정보들
		for (int loop = 0; loop < listBuyDetailDto.size(); loop++) {
			
			listBuyDetailDto.get(loop).setSeq_buy_dtl(buyDao.sequenceDetail());
			listBuyDetailDto.get(loop).setSeq_buy_mst(buyMasterDto.getSeq_buy_mst());
			listBuyDetailDto.get(loop).setRegister(buyMasterDto.getRegister());
			
			result += buyDao.insertDetail(listBuyDetailDto.get(loop));
		}
		
		// 결제 정보
		PayDto payDto = new PayDto();
		payDto.setSeq_pay(payDao.sequence());
		payDto.setSeq_mbr(buyMasterDto.getSeq_mbr());
		payDto.setSeq_buy_mst(buyMasterDto.getSeq_buy_mst());
		payDto.setRegister(buyMasterDto.getSeq_mbr());
		result += payDao.insert(payDto);
		
		if (result == 1 + listBuyDetailDto.size() + 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
}
