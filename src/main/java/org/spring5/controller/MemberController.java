package org.spring5.controller;

import javax.servlet.http.HttpSession;

import org.spring5.domain.MemberVO;
import org.spring5.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/member/insert")
	public void memberInsert() {
		
	}
	
	
	@PostMapping("/member/insert")
	public String memberInsert(MemberVO memberVO, RedirectAttributes rttr) {
		memberService.memberInsert(memberVO);
		
		log.info(memberVO);
		
		rttr.addFlashAttribute("result", memberVO);
		
		return "/member/login";
		
	}
	
	@GetMapping("/member/list")
	public void memberList(Model model) {
		model.addAttribute("memberList", memberService.memberList());
		model.addAttribute("as", memberService.memberList());
		model.addAttribute("sdf", memberService.memberList());
		model.addAttribute("zxc", memberService.memberList());
		
		log.info(model);
	}
	
	@GetMapping("/member/login")
	public void login() {
		
	}
	
	@PostMapping("/member/login")
	public String login(HttpSession session, String memberId, String memberPw) {
		
		memberService.login(memberId, memberPw);
		
		session.setAttribute("memberId", memberId);
		
		String value = (String)session.getAttribute("memberId");
		
		log.info("session: "+value);
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/member/read")
	public void memberRead(String memberId, Model model) {
		
		model.addAttribute("memberRead", memberService.memberRead(memberId));
	}
	
	
	@GetMapping("/member/modify")
	public void memberModify(String memberId, Model model) {
		
		model.addAttribute("memberModify", memberService.memberRead(memberId));
		
	}

	
	@PostMapping("/member/modify")
	public String memberModify(MemberVO memberVO, RedirectAttributes rttr) {
		
		log.info("aaa:"+memberVO);
		memberService.memberModify(memberVO);
		
		log.info("bbb:"+memberVO);

		
		return "redirect:/member/list";
		
	}
	

	@PostMapping("/member/remove")
	public String memberRemove(String memberId) {
		memberService.memberRemove(memberId);
		
		return "redirect:/member/list";
	}
	
	@GetMapping("/member/logout") 
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/list";
		
		
	}
}
