package org.spring5.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberPhoneNumber;
	private Timestamp joinDate;

}
