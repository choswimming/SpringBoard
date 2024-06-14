package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.BoardVO;
import com.itwillbs.service.BoardService;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// 서비스객체 주입
	@Inject
	private BoardService bService;
	
	//http://localhost:8088/controller/board/regist
	// 게시판 글쓰기 - GET
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public void registGET() throws Exception {
		logger.debug(" 게시판 글쓰기 GET - 사용자의 정보 입력");
		logger.debug(" 연결된 view페이지 이동");
	}

	// 게시판 글쓰기 - POST
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registPOST(BoardVO vo,RedirectAttributes rttr) throws Exception {
		logger.debug(" 게시판 글쓰기 POST - 입력된 데이터 처리");
		// 한글 인코딩(필터 처리)
		// 전달정보 저장
		logger.debug(" vo : "+vo);
		logger.debug(" vo : {} ",vo);
		
		// 서비스 -> DAO에 동작 호출
		bService.regist(vo);
		
		// 페이지 이동
		
		// 글쓰기 성공정보 전달
		rttr.addFlashAttribute("msg","createOK");
		
		logger.debug(" 연결된 view페이지 이동");
//		return "redirect:/board/listALL?msg=createOk";
		return "redirect:/board/listALL";
	}
	
	// * 정보조회 동작, 사용자 정보 입력 => GET 방식
	// * 정보를 처리하는 동작(UPDATE,DELETE,INSERT) => POST 방식
	
	
	// 게시판 글목록 조회 - GET
	@GetMapping(value="/listALL")
	public String listALLGET(Model model) throws Exception{
		logger.debug(" listALLGET() 실행");
		
		// 서비스 -> DB의 정보를 가져오기
		List<BoardVO> boardList = bService.listALL();
		logger.debug(" size : "+boardList.size());
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("boardList", boardList);
		
		return "/board/list";
	}
	
	
	
	
	
	
}
