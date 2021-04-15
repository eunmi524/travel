package org.spring5.service;

import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardPageDTO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO boardVO);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO boardVO);
	
	public boolean remove(Long bno);
	
//	public List<BoardVO> getList();
	
	//게시물목록(13장): 페이징처리 고려
	public List<BoardVO> getList(Criteria cri);
	
	//총 행개수: 페이징처리시 필요
	public int getTotal(Criteria cri);

	BoardPageDTO getListPage(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);

}
