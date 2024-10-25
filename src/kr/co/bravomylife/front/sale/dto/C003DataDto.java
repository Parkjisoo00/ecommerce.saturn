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
 * File			: ImageData.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241023140532][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.sale.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-23
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class C003DataDto {
	
	
	/*
	{
        "total_count": "5",
        "row": [
            {
                "PRDLST_REPORT_NO": "200700170351816",
                "SHAP": "",
                "PRMS_DT": "20210331",
                "LAST_UPDT_DTM": "20210510",
                "PRDT_SHAP_CD_NM": "캡슐",
                "LCNS_NO": "20070017035",
                "CRET_DTM": "20210331",
                "PRDLST_NM": "솔가 밀크씨슬 130",
                "IFTKN_ATNT_MATR_CN": "알레르기 반응이 나타나는 경우에는 섭취 중단\n설사, 위통, 복부팽만 등의 위장관계 장애가 나타나는 경우에는 섭취에 주의",
                "BSSH_NM": "코스맥스엔비티(주)",
                "STDR_STND": "1. 성상: 고유의 향미가 있고 이미, 이취가 없는 회황색의 내용물을 함유한 투명한 장방형 경질캡슐\n2. 붕해도: 20분이내\n3. 실리마린: 표시량(130mg/450mg)의 80～120%\n4. 납(mg/kg): 1.0 이하\n5. 카드뮴(mg/kg): 0.5 이하\n6. 수은(mg/kg): 0.5 이하\n7. 비소(mg/kg): 1.0 이하\n8. 대장균군: 음성",
                "DISPOS": "고유의 향미가 있고 이미, 이취가 없는 회황색의 내용물을 함유한 투명한 장방형 경질캡슐",
                "PRIMARY_FNCLTY": "[밀크씨슬추출물]\n간 건강에 도움을 줄 수 있음",
                "POG_DAYCNT": "제조일로부터 24개월",
                "CSTDY_MTHD": "",
                "NTK_MTHD": "1일 1회, 1회 1캡슐을 물과 함께 섭취하십시오.",
                "RAWMTRL_NM": "밀크씨슬(카르두스 마리아누스) 추출물(고시형), 히드록시프로필메틸셀룰로스, 결정셀룰로스, 유당, 옥수수전분, 올리고당, 스테아린산마그네슘, 이산화규소"
            }
        ],
        "RESULT": {
            "MSG": "정상처리되었습니다.",
            "CODE": "INFO-000"
        }
        */
	
	@JsonProperty("total_count")
	private int total_count;
	
	@JsonProperty("row")
	private RowDataDto[] row;
	
	@JsonProperty("RESULT")
	private ResultDto result;
	
	
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	public RowDataDto[] getRow() {
		return row;
	}
	public void setRow(RowDataDto[] row) {
		this.row = row;
	}
	public ResultDto getResult() {
		return result;
	}
	public void setResult(ResultDto result) {
		this.result = result;
	}
}