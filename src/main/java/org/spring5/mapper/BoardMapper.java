package org.spring5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;

public interface BoardMapper {
	
	//@Select("select * from travel.board where bno > 0")
//	public List<BoardVO> boardGetList();
	
	//오라클 11g 페이징 쿼리
	public List<BoardVO> getListPaging(Criteria cri);
	
	//오라클 11g 페이징 쿼리(검색고려)
	public List<BoardVO> getListPagingWithSearch(Criteria cri);
	
	public void boardInsert(BoardVO boardVO); 
	
	public Integer insertSelectKey(BoardVO boardVO);
	
	public BoardVO boardRead(Long bno);

	public int boardDelete(Long bno);
	
	public int boardUpdate(BoardVO boardVO);
	
	//페이징시 전체 글개수
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, 
							   @Param("amount") int amount); //amount: 댓글 입력 시 1, 댓글 삭제 시 -1
}
