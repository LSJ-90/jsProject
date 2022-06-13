package com.miso.web.util;

public class Pagination {

	private int rowsPerPage = 10;			// 한 페이지당 표시할 데이터의 갯수
	private int pagesPerBlock = 5;			// 한 블록당 표시할 페이지번호 숫자
	private int currentPageNo;				// 현재 페이지번호
	private int totalRecords;				// 총 데이터 갯수
	
	private int totalPages;					// 총 페이지 갯수
	private int totalBlocks;				// 총 페이지블록 갯수
	private int currentBlock;				// 현재 페이지 번호에 해당하는 현재 블록 번호
	private int beginPage;					// 현재 블록번호에 해당하는 시작 페이지 번호
	private int endPage;					// 현재 블록번호에 해당하는 끝 페이지 번호
	private int prevPage;					// 이전 블록의 페이지번호
	private int nextPage;					// 다음 블록의 페이지번호
	private int begin;						// 현재 페이지번호에 해당하는 데이터 조회 시작 순번
	private int end;						// 현재 페이지번호에 해당하는 데이터 조회 끝 순번
	
	public Pagination(String pageNo, int totalRecords) {
		init(pageNo, totalRecords, rowsPerPage);
	}
	
	public Pagination(String pageNo, int totalRecords, int rows) {
		init(pageNo, totalRecords, rows);
	}
	
	private void init(String pageNo, int totalRecords, int rows) {
		this.rowsPerPage = rows;
		totalPages = (int)(Math.ceil((double)totalRecords/rowsPerPage));
		totalBlocks = (int)(Math.ceil((double)totalPages/pagesPerBlock));
		
		currentPageNo = 1;
		try {
			currentPageNo = Integer.parseInt(pageNo);
		} catch (NumberFormatException e) {}
		
		if (currentPageNo <= 0) {			// 숫자로 변환된 현재 페이지번호가 0이거나 0보다 작으면 현재 페이지번호를 1로 설정
			currentPageNo = 1;
		}
		if (currentPageNo > totalPages) {	// 숫자로 변환된 현재 페이지번호가 총 페이지갯수 보다 크면 현재 페이지번호를 totalPages로 설정
			currentPageNo = totalPages;
		}
		
		begin = (currentPageNo - 1)*rowsPerPage + 1;
		end = currentPageNo*rowsPerPage;

		// 현재 페이지번호에 대한 현재 블록번호를 계산해서 멤버변수에 대입
		currentBlock = (int)(Math.ceil((double)currentPageNo/pagesPerBlock));
		
		// 현재 블록 번호에 해당하는 시작페이지번호와 끝페이지번호를 계산해서 멤버변수에 대입
		beginPage = (currentBlock - 1)*pagesPerBlock + 1;
		endPage = currentBlock*pagesPerBlock;
		if (currentBlock == totalBlocks) {
			endPage = totalPages;
		}
		
		// 현재 페이지번호에 대한 이전 블록의 페이지번호를 계산해서 멤버변수에 대입
		if (currentBlock > 1) {
			prevPage = (currentBlock - 1)*pagesPerBlock;
		}
		// 현재 페이지번호에 대한 다음 블록의 페이지번호를 계산해서 멤버변수에 대입
		if (currentBlock < totalBlocks) {
			nextPage = currentBlock*pagesPerBlock + 1;
		}
	}
	
	
	public int getPageNo() {
		return currentPageNo;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getBegin() {
		return begin;
	}
	
	public int getPrevPage() {
		return prevPage;
	}
	
	public boolean isExistPrev() {
		if (totalBlocks == 1) {
			return false;
		}
		return currentBlock > 1;
	}
	
	public boolean isExistNext() {
		if (totalBlocks == 1) {
			return false;
		}
		
		return currentBlock < totalBlocks;
	}
	
	public int getNextPage() {
		return nextPage;
	}

	public int getEnd() {
		return end;
	}
}
