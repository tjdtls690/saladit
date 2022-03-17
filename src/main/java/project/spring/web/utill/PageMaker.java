package project.spring.web.utill;

public class PageMaker {
	
	private Criteria cri;
	private int totalCount;	// 총 게시글 수
	private int startPage;	// 화면에 보여질 첫번째 페이지 번호, 시작 페이지 번호
	private int endPage;	// 화면에 보여질 마지막 페이지 번호(=끝 페이지 번호)
	private boolean prev;	// 이전 버튼 생성 여부
	private boolean next;	// 다음 버튼 생성 여부
	private int displayPageNum = 5;	// 화면 하단에 보여지는 페이지의 버튼 수
	private int item_code;
	
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData(); // 총 개시글 수를 셋팅할때 calcData()메서드로 페이징 관련 버튼 계산을 함.
	}
	
	private void calcData() {	// 페이징 버튼들을 생성하는 계산식
								// 끝페이지 번호, 시작페이지 번호, 이전, 다음 버튼들을 구한다
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum)*displayPageNum);
	//  끝 페이지 번호 = ( 현재 페이지 번호 / 화면에 보여질 페이지 번호의 갯수)* 화면에 보여질 페이지 번호의 갯수
		startPage = (endPage - displayPageNum)+1;
	//	시작 페이지 번호 = ( 끝페이지 번호 - 화면에 보여질 페이지 번호의 갯수) + 1
		if(startPage <= 0) startPage =1;
		
		int tempEndPage = (int) (Math.ceil(totalCount/(double)cri.getPerPageNum()));
	//  마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의 수
		if(endPage > tempEndPage) {							
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
	//	이전 버튼은 시작 페이지 번호가 1이 아니면 생기게 된다.
		next = endPage * cri.getPerPageNum() < totalCount ? true : false;
		
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	
	
	
	
	
		
}
