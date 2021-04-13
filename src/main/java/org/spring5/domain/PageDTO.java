package org.spring5.domain;

import lombok.Data;

@Data
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	
	private int pagingNumCnt;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		//this.pagingNumCnt = pagingNumCnt;
		this.pagingNumCnt = 10;  //이렇게 하면 여기만 바꿔서 한페이징에 표시되는 행을 조절할 수 있다.
		
		System.out.println("cri: " + cri.toString());
		
		//this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10; //교재코드
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (this.pagingNumCnt * 1.0))) * this.pagingNumCnt;  //실수로 만들어 주려고 *1.0했음
		System.out.println("endPage: " + this.endPage);
		
		
		//this.startPage = this.endPage - 9;  //교재코드
		this.startPage = this.endPage - (this.pagingNumCnt - 1 );
		System.out.println("startPage: " + this.startPage);
		
		//전체 행 개수를 고려한 총 페이지 갯수(-->실제 마지막 페이지 번호)
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		System.out.println("total: " + total);
		System.out.println("realEnd: " + realEnd);
		
		//계산된 끝 페이징 번호가 실제 마지막 페이지 번호보다 크면, endPage 값을 realEnd로 대체
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
