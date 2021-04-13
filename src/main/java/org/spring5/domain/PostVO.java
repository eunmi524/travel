package org.spring5.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PostVO {
	
	private Long postBno;
	private String postTitle;
	private String postContent;
	private String memberId;
	private Timestamp postRegDate;
	private Timestamp postUpdateDate;
	

}
