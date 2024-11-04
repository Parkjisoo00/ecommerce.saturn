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
 * File			: SurveySrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241104165657][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.survey.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.front.survey.dao.SurveyDao;
import kr.co.bravomylife.front.survey.dto.SurveyDto;
import kr.co.bravomylife.front.survey.dto.SurveyListDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-11-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.front.survey.service.SurveySrvc")
public class SurveySrvc {
	
	@Inject
	SurveyDao surveyDao;
	
	public SurveyListDto selectList(SurveyListDto surveyListDto) {
		
		List<SurveyDto> surveyList = surveyListDto.getSurveyList();
		List<SurveyDto> _surveyList = new ArrayList<>();
		
		for (SurveyDto survey : surveyList) {
			
			SurveyDto surveyDto = new SurveyDto();
			
			surveyDto.setCd_ctg_m(survey.getCd_ctg_m());
			surveyDto.setCd_ctg_b(survey.getCd_ctg_b());
			
			SurveyDto resultList = surveyDao.select(surveyDto);
			
			resultList.setCd_ctg_m(surveyDto.getCd_ctg_m());
			resultList.setCd_ctg_b(surveyDto.getCd_ctg_b());
			
			_surveyList.add(resultList);
		}
		
		surveyListDto.setSurveyList(_surveyList);
		
		return surveyListDto;
	}
	
	@Transactional("txFront")
	public boolean insert(SurveyDto surveyDto, SurveyListDto surveyListDto) {
		
		int result = 0;
		
		surveyDto.setSeq_hp_sur(surveyDao.sequence());
		
		result += surveyDao.insert(surveyDto);
		
		List<SurveyDto> surveyList = surveyListDto.getSurveyList();
		
		for(SurveyDto survey : surveyList) {
			
			surveyDto.setCd_ctg_m(survey.getCd_ctg_m());
			surveyDto.setCd_ctg_b(survey.getCd_ctg_b());
			surveyDto.setSeq_sle(survey.getSeq_sle());
			
			result += surveyDao.insertDtl(surveyDto);
		}
		
		if (result == 1 + surveyList.size()) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public SurveyDto userInfo(SurveyDto surveyDto) {
		return surveyDao.userInfo(surveyDto);
	}
}
