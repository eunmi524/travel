package org.spring5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.spring5.domain.MemberVO;

public interface MemberMapper {
	
	public void memberInsert(MemberVO memberVO);
	
	public List<MemberVO> memberList();
	
	public MemberVO login(@Param("memberId") String memberId, @Param("memberPw") String memberPw);
	
	public MemberVO memberRead(String memberId);
	
	public void memberModify(MemberVO memberVO);
	
	public void memberRemove(String memberId);
}
