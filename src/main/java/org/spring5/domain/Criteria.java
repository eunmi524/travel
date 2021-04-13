package org.spring5.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;


@Data
public class Criteria {
	
	private int pageNum;
	private int amount;

	//검색 범위와 검색 키워드
	private String type; //검색범위(searchScope : C:content, T:title, W:writer) 
	private String keyword; //검색 키워드
	
	//예, type 필드의 TCW 값을 ["T", "C", "W"] 배열로 반환하는 메소드  
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
	
	//Making URI
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			.queryParam("pageNum", this.pageNum)
			.queryParam("amount", this.getAmount())
			.queryParam("type", this.getType())
			.queryParam("keyword", this.getKeyword());
				
		return builder.toUriString();
						
	}
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {

		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
	
	
	
}
