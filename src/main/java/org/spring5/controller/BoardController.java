package org.spring5.controller;

import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.PageDTO;
import org.spring5.service.BoardService;
import org.spring5.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/index")
	public void test() {	
	}
	
//	@GetMapping("/board/list")
//	public void testList(Model model) {
//		model.addAttribute("list", boardService.getList());
//	}
	

	//목록보기: 페이징고려
	@GetMapping("/board/list")
	public void list(Criteria cri, Model model) {  
		log.info("list 페이징: " + cri);
		model.addAttribute("list", boardService.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));  //paging 관련 데이터 객체 Model에 추가
		
		int total = boardService.getTotal(cri);
		log.info("total: "+ total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/board/read")
	public void boardRead(Long bno, Model model) {
		//boardService.get(bno);
		
		//BoardVO asd = boardService.get(bno);
		//model.addAttribute("board", asd);
		
		model.addAttribute("board", boardService.get(bno));
		model.addAttribute("replyList", replyService.replyList(bno));
	}
	
	@GetMapping("/board/register")
	public void register() {
		
	}
	
	@PostMapping("/board/register")
	public String register(BoardVO boardVO, RedirectAttributes rttr) {
		boardService.register(boardVO);
		rttr.addFlashAttribute("result", boardVO.getBno());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/board/modify")
	public void modify(Long bno, Model model) {
		model.addAttribute("board", boardService.get(bno));
	}
	
	@PostMapping("/board/modify")
	public String modify(BoardVO boardVO, RedirectAttributes rttr) {
		
		log.info("boardVO:" + boardVO);
		
		boardService.modify(boardVO);
		
//		if(boardService.modify(boardVO) == 1) {
//			rttr.addFlashAttribute("result", "success");
//		}
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/board/remove")  // modify.jsp에서 form을 post보냈으니까 postMapping써야함
	public String remove(Long bno) {
	
		log.info("aaaaa" + bno);
		boardService.remove(bno);

		return "redirect:/board/list";
	}
		
	
}
