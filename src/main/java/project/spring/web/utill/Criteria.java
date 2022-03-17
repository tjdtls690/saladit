package project.spring.web.utill;

//게시글 조회 쿼리에 전달될 파라미터를 담게될 클래스 (==VO라고 생각해도됨)
public class Criteria { // 페이지 조회 클래스
	private int page;	// 현재 페이지 번호
	private int perPageNum;	// 한페이지당 보여줄 게시글의 갯수
	private int item_code;
	
	private int getPageStart() {	// 특정 페이지의 게시글 시작번호(게시글 시작행)
		return (this.page-1)*perPageNum;
	}
	
	public Criteria() {
		this.page = 1;
		this.perPageNum= 5;
		this.item_code = 14;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <=0) {
			this.page =1;
		}else {
			this.page=page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if(pageCount !=cnt) {
			this.perPageNum = cnt;
		}else {
			this.perPageNum = pageCount;
		}
	}

	
	
	public int getItem_code() {
		return item_code;
	}

	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	
	
	
	
	
	

}
