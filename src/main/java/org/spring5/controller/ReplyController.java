package org.spring5.controller;

import java.util.List;

import org.spring5.domain.ReplyVO;
import org.spring5.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ReplyController {
	
	@Autowired
	ReplyService replyService;
	
	@GetMapping(value="/reply/list")
	public void replyList(Long bno, Model model) {
		
		//log.info("bno:" +bno);
		model.addAttribute("replyList", replyService.replyList(bno));
		
		List<ReplyVO> asd = replyService.replyList(bno);
		
		log.info("aaaaaaaa" +asd.get(0).toString());
	}
	
	@GetMapping(value="/reply/insert")
	public void replyInsert(Long bno, String memberId, Model model) {
		log.info(memberId);
		model.addAttribute("replyInsert", bno);
		model.addAttribute("replyMemberId", memberId);
		
	}
	
	@PostMapping(value="/reply/insert")
	public String replyInsert(ReplyVO replyVO) {
		replyService.replyInsert(replyVO);
		
		return "redirect:/board/read?bno="+replyVO.getBno();
	}
	
	@GetMapping(value="/reply/modify")
	public void replyModify(ReplyVO replyVO, Model model) {
		log.info(replyVO);
		model.addAttribute("replyModify", replyVO);
		
	}
	
	@PostMapping(value="/reply/modify")
	public String replyModify(ReplyVO replyVO) {
		
		log.info("qqq:"+replyVO);
		
		replyService.replyModify(replyVO);
		
		log.info("aaa:"+replyVO);
		return "redirect:/board/read?bno="+replyVO.getBno();
	}
	
	@GetMapping(value="reply/remove")
	public String replyDelete(ReplyVO replyVO) {
		
		log.info("aaa:"+replyVO);
		
		replyService.replyDelete(replyVO.getRno());
		
		log.info("bbb:"+replyVO);
		
		return "redirect:/board/read?bno="+replyVO.getBno();
	}
	
//	@GetMapping(value="/reply/list") //url 주소
//	public void replyList(Long bno, Model model) {
//	
//		model.addAttribute("replyList", replyService.replyList(bno));
//		 //model.addAttribute("replyList", bno);
//		
//		int a1 = sum(1,2);
//		
//		int a = sum1(1,2);
//		
//		//return "/reply/list"; jsp의 경로
//		
//	}
	
//	private void sum(int a, int b) {
//		
//		int result = a + b;
//		
//		log.info(result);
//	}
//	
//	private int sum1(int a, int b) {
//		
//		int result = a + b;
//		
//		log.info(result);
//		
//		return result;
//	}
}
