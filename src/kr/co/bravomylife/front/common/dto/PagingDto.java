package kr.co.bravomylife.front.common.dto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class PagingDto {
	
	private int totalLine		= 0;
	private int totalPage		= 0;
	private int linePerPage		= 10;
	private int currentPage		= 1;
	
	private String searchKey	= "";
	private String searchWord	= "";
	
	private Integer cd_bbs_type	= 0;
	private int cd_ctg			= 0;
	private int register		= 0;
	
	private Integer seq_sle		= 0;
	private Integer	seq_mbr		= 0;
	private String cd_ctg_m		= "";
	private String cd_ctg_b		= "";
	private String filter		= "";
	private String corp_nm		= "";
	private String prd_type		= "";
	private int point_stack		= 0;
	private int point_value		= 0;
	private String mbr_nm		= "";
	private int count			= 0;
	private int seq_sle_count			= 0;
	private int total_price_sum			= 0;
	private int total_point_sum			= 0;
	
	private String sle_nm			= "";	// 판매 상품명
	private String desces			= "";	// 판매 상품 상세설명(이미지)
	private String img				= "";	// 판매 상품 이미지
	private int price_sale			= 0;	// 판매 상품 원가
	private int discount_sale		= 0;	// 판매가(원가에서 할인율%을 뺀 가격)
	private int rnum				= 0;
	private int seq_like			= 0;	// 찜 일련번호(판매 상세 페이지에서 사용)
	private String cd_state_sale	= "";	// 판매 상품 상태
	private int rate_star			= 0;	// 상품 평점 1~5
	private int average_rate		= 0;	// 평점과 개수의 평점 평균
	private int count_stock			= 0;	// 재고
	private String flg_delete		= "";	// 삭제 처리 여부
	private String dt_sale_atart	= "";	// 판매 시작일
	private String dt_sale_end		= "";	// 판매 종료일
	private int discount			= 0;	// 할인율
	private String dt_reg			= "";	// 등록일
	private String dt_upt			= "";	// 수정일
	private int updater				= 0;	// 수정자
	private String flg_best			= "";	// 인기 판매 상품 여부
	private String flg_like			= "";	// 찜 여부
	private String rate_review		= "";	// 상품 리뷰 내용
	private int seq_review			= 0;	// 리뷰 일련번호
	
	
	
	
	
	public String getSle_nm() {
		return sle_nm;
	}
	public void setSle_nm(String sle_nm) {
		this.sle_nm = sle_nm;
	}
	public String getDesces() {
		return desces;
	}
	public void setDesces(String desces) {
		this.desces = desces;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPrice_sale() {
		return price_sale;
	}
	public void setPrice_sale(int price_sale) {
		this.price_sale = price_sale;
	}
	public int getDiscount_sale() {
		return discount_sale;
	}
	public void setDiscount_sale(int discount_sale) {
		this.discount_sale = discount_sale;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getSeq_like() {
		return seq_like;
	}
	public void setSeq_like(int seq_like) {
		this.seq_like = seq_like;
	}
	public String getCd_state_sale() {
		return cd_state_sale;
	}
	public void setCd_state_sale(String cd_state_sale) {
		this.cd_state_sale = cd_state_sale;
	}
	public int getRate_star() {
		return rate_star;
	}
	public void setRate_star(int rate_star) {
		this.rate_star = rate_star;
	}
	public int getAverage_rate() {
		return average_rate;
	}
	public void setAverage_rate(int average_rate) {
		this.average_rate = average_rate;
	}
	public int getCount_stock() {
		return count_stock;
	}
	public void setCount_stock(int count_stock) {
		this.count_stock = count_stock;
	}
	public String getFlg_delete() {
		return flg_delete;
	}
	public void setFlg_delete(String flg_delete) {
		this.flg_delete = flg_delete;
	}
	public String getDt_sale_atart() {
		return dt_sale_atart;
	}
	public void setDt_sale_atart(String dt_sale_atart) {
		this.dt_sale_atart = dt_sale_atart;
	}
	public String getDt_sale_end() {
		return dt_sale_end;
	}
	public void setDt_sale_end(String dt_sale_end) {
		this.dt_sale_end = dt_sale_end;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getDt_reg() {
		return dt_reg;
	}
	public void setDt_reg(String dt_reg) {
		this.dt_reg = dt_reg;
	}
	public String getDt_upt() {
		return dt_upt;
	}
	public void setDt_upt(String dt_upt) {
		this.dt_upt = dt_upt;
	}
	public int getUpdater() {
		return updater;
	}
	public void setUpdater(int updater) {
		this.updater = updater;
	}
	public String getFlg_best() {
		return flg_best;
	}
	public void setFlg_best(String flg_best) {
		this.flg_best = flg_best;
	}
	public String getFlg_like() {
		return flg_like;
	}
	public void setFlg_like(String flg_like) {
		this.flg_like = flg_like;
	}
	public String getRate_review() {
		return rate_review;
	}
	public void setRate_review(String rate_review) {
		this.rate_review = rate_review;
	}
	public int getSeq_review() {
		return seq_review;
	}
	public void setSeq_review(int seq_review) {
		this.seq_review = seq_review;
	}
	public int getTotal_point_sum() {
		return total_point_sum;
	}
	public void setTotal_point_sum(int total_point_sum) {
		this.total_point_sum = total_point_sum;
	}
	public int getSeq_sle_count() {
		return seq_sle_count;
	}
	public void setSeq_sle_count(int seq_sle_count) {
		this.seq_sle_count = seq_sle_count;
	}
	public int getTotal_price_sum() {
		return total_price_sum;
	}
	public void setTotal_price_sum(int total_price_sum) {
		this.total_price_sum = total_price_sum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPoint_value() {
		return point_value;
	}
	public void setPoint_value(int point_value) {
		this.point_value = point_value;
	}
	public String getMbr_nm() {
		return mbr_nm;
	}
	public void setMbr_nm(String mbr_nm) {
		this.mbr_nm = mbr_nm;
	}
	public int getPoint_stack() {
		return point_stack;
	}
	public void setPoint_stack(int point_stack) {
		this.point_stack = point_stack;
	}
	public Integer getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(Integer seq_mbr) {
		this.seq_mbr = seq_mbr;
	}
	public String getCd_ctg_b() {
		return cd_ctg_b;
	}
	public void setCd_ctg_b(String cd_ctg_b) {
		this.cd_ctg_b = cd_ctg_b;
	}
	public int getTotalLine() {
		return totalLine;
	}
	public void setTotalLine(int totalLine) {
		this.totalLine = totalLine;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getLinePerPage() {
		return linePerPage;
	}
	public void setLinePerPage(int linePerPage) {
		this.linePerPage = linePerPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public Integer getCd_bbs_type() {
		return cd_bbs_type;
	}
	public void setCd_bbs_type(Integer cd_bbs_type) {
		this.cd_bbs_type = cd_bbs_type;
	}
	public int getCd_ctg() {
		return cd_ctg;
	}
	public void setCd_ctg(int cd_ctg) {
		this.cd_ctg = cd_ctg;
	}
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public Integer getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(Integer seq_sle) {
		this.seq_sle = seq_sle;
	}
	public String getCd_ctg_m() {
		return cd_ctg_m;
	}
	public void setCd_ctg_m(String cd_ctg_m) {
		this.cd_ctg_m = cd_ctg_m;
	}
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	public String getCorp_nm() {
		return corp_nm;
	}
	public void setCorp_nm(String corp_nm) {
		this.corp_nm = corp_nm;
	}
	public String getPrd_type() {
		return prd_type;
	}
	public void setPrd_type(String prd_type) {
		this.prd_type = prd_type;
	}
}