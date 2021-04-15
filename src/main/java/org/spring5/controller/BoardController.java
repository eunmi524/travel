package org.spring5.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.PageDTO;
import org.spring5.service.BoardService;
import org.spring5.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/main")
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
	public String remove(Long bno, RedirectAttributes rttr) {
	
		log.info("remove..." + bno);
		
		//파일 삭제 전 첨부파일 목록 생성
		List<BoardAttachVO> attachList = boardService.getAttachList(bno);
		
		//데이터베이스에서 게시물, 첨부파일 정보 삭제
		if(boardService.remove(bno)) {
			
			//첨부파일 삭제
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list";
	}
	
	
	//게시물의 모든 첨부파일을 서버에서 삭제	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList ==  null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach files.............");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try { 
				Path file = Paths.get("C:\\upload\\"
						+attach.getUploadPath()
						+"\\" + attach.getUuid()
						+"_"+ attach.getFileName());
				
				//이미지파일과 일반파일 삭제
				Files.deleteIfExists(file);
				
				//이미지파일인 경우, 섬네일파일 이름 객체 생성 후 , 삭제
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"
					//file = Paths.get("C:\\upload\\"	 //위에걸 이렇게 쓸수도 이음
												+attach.getUploadPath()
												+"\\s_" + attach.getUuid()
												+"_"+attach.getFileName());
				//Files.deleteIfExists(thumbNail);
				Files.delete(thumbNail);
				}
				
			}catch(Exception e) {
			log.error("delete file error" + e.getMessage());
			} //end catch
		});//end foreach
	}
	

	@GetMapping(value="/board/getAttachList", produces= {"application/json; charset=UTF-8"})
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("getAttachList" + bno);
		
		int a;
		a = 1;
		
		List<BoardAttachVO> A;
		A = boardService.getAttachList(bno);
		
		log.info("TTTTTT:"+A);
		
		return new ResponseEntity<>(boardService.getAttachList(bno), HttpStatus.OK);
	}
	
}
