
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
	
	private int totalLine		= 0;	// 전체 라인(행) 수
	private int totalPage		= 0;	// 전체 페이지 수 = 전체 라인(행) 수 / 페이징할 라인수
	private int linePerPage		= 12;	// 페이징할 라인수
	private int currentPage		= 1;	// 현재 페이지
	
	private String searchKey	= "";	// 검색키(예: 타이틀, 내용, 타이틀+내용)
	private String searchWord	= "";	// 검색어
	
	private int cd_bbs_type		= 0;	// [게시판] 공지사항(1), 자주 찾는 질문(2), 질의 응답(3)
	private int cd_ctg			= 0;	// [게시판] 자주 찾는 질문의 카테고리
	private int register		= 0;	// [등록자]
	
	
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
	public int getCd_bbs_type() {
		return cd_bbs_type;
	}
	public void setCd_bbs_type(int cd_bbs_type) {
		this.cd_bbs_type = cd_bbs_type;
	}
}