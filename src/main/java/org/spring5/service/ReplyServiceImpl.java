package org.spring5.service;

import java.util.List;

import org.spring5.domain.ReplyVO;
import org.spring5.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper replyMapper;

	@Override
	public List<ReplyVO> replyList(Long bno) {
		log.info(bno);
		return replyMapper.replyList(bno);
	}
	
	@Override
	public void replyInsert(ReplyVO replyVO) {
		
		replyMapper.replyInsert(replyVO);
	}
	
	@Override
	public void replyModify(ReplyVO replyVO) {
	
		replyMapper.replyModify(replyVO);
	}

	@Override
	public void replyDelete(Long rno) {
		replyMapper.replyDelete(rno);
		
	}
	
	


//	@Override
//	public List<replyVO> replyList(Long bno) {
//		replyMapper.replyList(bno);
//		
//	}
}
