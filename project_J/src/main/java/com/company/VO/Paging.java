package com.company.VO;

public class Paging {
	//한 페이지 당 글 수
	private int pageSize = 10;
	
	//한 블럭 당 페이지 수
	private int blockSize = 5; 
	
	//총 페이지 수
	private int pageCount;
	
	//총 게시글 수
	private int writingCount;
	
	//현재 페이지
	private int thisPage;
	
	//시작 페이지
	private int startPage;
	
	//끝 페이지
	private int endPage;
	
	//이전 페이지
	private int prePage;
	
	//다음 페이지
	private int nextPage;
	
	//페이지 첫 번째 글
	private int startNum;
	
	//페이지 마지막 글
	private int endNum;
	

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getWritingCount() {
		return writingCount;
	}

	public void setWritingCount(int writingCount) {
		this.writingCount = writingCount;
	}

	public int getThisPage() {
		return thisPage;
	}

	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
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

	public int getPrePage() {
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	
	public int getStartNum() {
		return this.startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
	
	//페이지 나타내는 메소드
	public void page(int writingCount, int thisPage) {
		this.writingCount = writingCount;
		this.thisPage = thisPage;
		
		getStartEndPage(writingCount, pageSize);
		getStartEndNum();
		PreNext();
	}
	
	//시작 페이지, 끝 페이지, 총 페이지 구하는 메소드
	public void getStartEndPage(int writingCount, int pageSize) {

		//총 페이지 = 총 게시물 / 페이지 당 글 수
		pageCount = (int)Math.ceil((double)writingCount / pageSize);
		
		//끝 페이지 = (현재 페이지 / 블럭 당 페이지 수 ) * 블럭 당 페이지 수
		endPage = (int)Math.ceil((double)thisPage / blockSize) * blockSize;
		
		//첫 페이지 = 끝 페이지 - 블럭 당 페이지 수 +1 | 1보다 작으면 1
		startPage = endPage - blockSize +1;
		
		if(startPage < 1) {
			startPage = 1;
		}
		
		//끝 페이지가 마지막 페이지보다 크면 마지막 페이지가 끝 페이지
		if(endPage > pageCount) {
			endPage = pageCount;
		}
	}
	
	// 페이지 첫 글, 마지막 글 번호 구하기
	public void getStartEndNum() {
		startNum = (thisPage -1) * pageSize;
		endNum = startNum + pageSize - 1;
	}

	//이전, 다음 페이지
	public void PreNext() {
		prePage = startPage -1;
		nextPage = endPage +1;
	}
}