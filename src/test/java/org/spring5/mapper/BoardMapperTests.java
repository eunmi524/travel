package org.spring5.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring5.domain.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
//	
//	@Test
//	public void testGetList() {
//		boardMapper.boardGetList().forEach(boardVO -> log.info(boardVO));
//	}
	
//	@Test
//	public void testInsert() {
//		BoardVO boardVO = new BoardVO();
//		boardVO.setTitle("새로 작성하는 글");
//		boardVO.setContent("새로 작성하는 내용");
//		boardVO.setMemberId("newbie");
//		
//		boardMapper.boardInsert(boardVO);
//		
//		log.info(boardVO);
//	}
//	
	@Test
	public void testRead() {
		BoardVO boardVO = boardMapper.boardRead(5L);
		log.info(boardVO);
	}
	
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: " + boardMapper.boardDelete(4L));
//	}
	
//	@Test
//	public void testUpdate() {
//		BoardVO boardVO = new BoardVO();
//		boardVO.setBno(5L);
//		boardVO.setTitle("수정된 제목");
//		boardVO.setContent("수정된 내용");
//		boardVO.setMemberId("user00");
//		
//		int count = boardMapper.boardUpdate(boardVO);
//		log.info("UPDATE COUNT: " + count);
//	}
}
