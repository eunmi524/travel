package org.spring5.service;

import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardPageDTO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.mapper.BoardAttachMapper;
import org.spring5.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardAttachMapper boardAttachMapper;

	@Override
	public void register(BoardVO boardVO) {
		
		log.info("register...."+boardVO);
		boardMapper.insertSelectKey(boardVO);
		log.info("######:" +boardVO);
		
		if(boardVO.getAttachList() == null || boardVO.getAttachList().size() <= 0) {
			return;
		}
		
		boardVO.getAttachList().forEach(attach ->{
			attach.setBno(boardVO.getBno());
			boardAttachMapper.insert(attach);
		});
	}
//	register는 받을게 없으니까 void로 끝내도 가능

	@Override
	public BoardVO get(Long bno) {
		return boardMapper.boardRead(bno);
	}

	@Override
	public int modify(BoardVO boardVO) {
		return boardMapper.boardUpdate(boardVO);
	}

	@Override
	public boolean remove(Long bno) {
		return boardMapper.boardDelete(bno) == 1 ;
	}

//	@Override
//	public List<BoardVO> getList() {
//		
//		return boardMapper.boardGetList();
//	} 

	
	//게시물목록(13장): 페이징처리 고려
	@Override
	public List<BoardVO> getList(Criteria cri){
		log.info("getList with criteria: " + cri);
		
		if(cri.getKeyword()=="") {
			return boardMapper.getListPaging(cri);
		} else {
			return boardMapper.getListPagingWithSearch(cri);
		}
	}
	
	//총 행개수: 페이징처리시 필요
	@Override
	public int getTotal(Criteria cri) {
		log.info("get Total Row Count: " + cri);
		return boardMapper.getTotalCount(cri);
	}

	@Override
	public BoardPageDTO getListPage(Criteria cri) {
		return new BoardPageDTO(boardMapper.getTotalCount(cri), boardMapper.getListPaging(cri));
	}
	
	//특정 게시물의 첨부파일 조회
	@Override
	public List<BoardAttachVO> getAttachList(Long bno){
		log.info("get Attach list by bno" + bno);
		
		return boardAttachMapper.findByBno(bno);
	}


}
