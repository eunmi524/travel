package org.spring5.service;

import java.util.List;

import org.spring5.domain.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> replyList(Long bno);
	
	public void replyInsert(ReplyVO replyVO);

	public void replyModify(ReplyVO replyVO);
	
	public void replyDelete(Long rno);

}
