package org.spring5.service;

import java.util.List;

import org.spring5.domain.MemberVO;

public interface MemberService {
	
	public void memberInsert (MemberVO memberVO);
	
	public List<MemberVO> memberList();
	
	public MemberVO login(String memberId, String memberPw);
	
	public MemberVO memberRead(String memberId);
	
	public void memberModify(MemberVO memberVO);
	
	public void memberRemove(String memberId);



}
