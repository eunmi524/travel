package org.spring5.mapper;

import java.util.List;

import org.spring5.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	//게시물 등록 시 첨부파일 정보 DB저장
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	//특정 게시물의 첨부파일 정보 조회
	public List<BoardAttachVO> findByBno(Long bno);
	
	//특정 게시물의 모든 첨부파일 삭제
	public void deleteAll(Long bno);
	
	//실행되는 시점 기준으로 하루전 날짜까지의 모든 첨부파일 정보를 조회 
	public List<BoardAttachVO> selectAttachFilesBeforeOneDay();
	
}
