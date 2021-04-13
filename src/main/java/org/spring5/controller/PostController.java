package org.spring5.controller;

import org.spring5.domain.PostVO;
import org.spring5.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class PostController {
	
	@Autowired
	private PostService postService; 
	
	@GetMapping("/post/list")
	public void postList(Model model) {
		model.addAttribute("postList", postService.postList());
	}
	
	@GetMapping("/post/insert")
	public void postInsert() {
		
	}
	
	@PostMapping("/post/insert")
	public String postInsert(PostVO postVO) {
		
		log.info("aaa:"+postVO);
		
		postService.postInsert(postVO);
		
		log.info("bbb:"+postVO);
		
		return "redirect:/post/list";
	}
	
	@GetMapping("/post/modify")
	public void postModify(Long postBno, Model model) {
		model.addAttribute("postModify", postService.postRead(postBno));

	}
	
	@PostMapping("/post/modify")
	public String postModify(PostVO postVO, RedirectAttributes rttr) {
		
		int yyy = postService.postModify(postVO);
		
		if (yyy==1) {
			rttr.addFlashAttribute("postModify", postService.postRead(postVO.getPostBno()));
			log.info("수정성공");
			
		} else {
			log.info("수정실패");
		}
		
		//rttr.addFlashAttribute("postModify", postVO);
			
		return "redirect:/post/read?postBno="+postVO.getPostBno();
	}
	
	@GetMapping("/post/read")
	public void postRead(Long postBno, Model model) {
		
		log.info("aaa:"+postBno);
		model.addAttribute("postRead", postService.postRead(postBno));
		
	}
	
	
}
