package org.spring5.service;

import java.util.List;

import org.spring5.domain.MemberVO;
import org.spring5.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void memberInsert(MemberVO memberVO) {
		memberMapper.memberInsert(memberVO);
		log.info(memberVO);
	}

	@Override
	public List<MemberVO> memberList() {
		return memberMapper.memberList();

	}

	@Override
	public MemberVO login(String memberId, String memberPw) {
		return memberMapper.login(memberId, memberPw);
	}

	@Override
	public MemberVO memberRead(String memberId) {
		return memberMapper.memberRead(memberId);
		
	}

	@Override
	public void memberModify(MemberVO memberVO) {
		memberMapper.memberModify(memberVO);
	}

	@Override
	public void memberRemove(String memberId) {
		memberMapper.memberRemove(memberId);
		
	}
	
	

}
