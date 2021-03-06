package org.spring5.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String memberId;
	private Timestamp regDate;
	private Timestamp updateDate;
	
	private List<BoardAttachVO> attachList;

}
