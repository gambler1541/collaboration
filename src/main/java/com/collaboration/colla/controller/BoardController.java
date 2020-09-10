package com.collaboration.colla.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.collaboration.colla.service.BoardService;
import com.collaboration.colla.service.MemberService;
import com.collaboration.colla.vo.BMemberVO;
import com.collaboration.colla.vo.BoardVO;
import com.collaboration.colla.vo.MemberVO;
import com.collaboration.colla.vo.WithMemberVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService service;

	@Autowired
	MemberService mservice;

	@RequestMapping(value = "/boardlist", method = RequestMethod.GET)
	public String boardList(@RequestParam(value = "keyword", required = false) String keyword, Model model,
			HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		MemberVO memberVo = (MemberVO) session.getAttribute("memberVO");
		System.out.println("jsp -> controller keyword : " + keyword);
		if (keyword != null) {
			map.put("keyword", keyword);
			map.put("email", memberVo.getEmail());
		}

		String email = memberVo.getEmail();

		if (keyword == null) {
			List<BoardVO> list = (List<BoardVO>) service.selectBoardList(email);
			if (list.size() != 0) {
				System.out.println("리스트가 있음");
				model.addAttribute("boardList", list);
			}
		} else {
			List<BoardVO> list = (List<BoardVO>) service.searchBoard(map);
			if (list.size() != 0) {
				model.addAttribute("boardList", list);
			}
		}
		return "/boardList";
	}

	@RequestMapping(value = "/addboard", method = RequestMethod.POST)
	public String addBoard(BoardVO bvo, HttpServletRequest request) throws Exception {
		System.out.println("addBoard controller in ~~~~");

		int n = service.insertBoard(bvo);

		String[] arrParam = request.getParameterValues("withmember");

		for (int i = 0; i < arrParam.length; i++) {
			System.out.println("같이 함께할 멤버의 수는 : " + arrParam.length);
			System.out.println("for 문에서 현재 insert 되는 member 는 : " + arrParam[i]);
			System.out.println("for 문에서 현재 insert 되는 b_fk 은 : " + n);
			WithMemberVO wmvo = new WithMemberVO();
			wmvo.setWithMember(arrParam[i]);
			wmvo.setN(n);
			mservice.withmemberinsert(wmvo);
		}

		return "redirect:/board/boardlist";
	}
	
	
	 @RequestMapping(value = "/deleteboard", method = RequestMethod.POST)
	 @ResponseBody
	   public String deleteBoard(@RequestParam int bFk, HttpSession session) throws Exception {
	      System.out.println("deleteBoard controller in ~~~~");
	      
	         MemberVO mvo = (MemberVO)session.getAttribute("memberVO");
	         String user = mvo.getEmail();
	         
	         BoardVO bvo = new BoardVO();
	         bvo.setbFk(bFk);
	         bvo.setbLeader(user);
	         
	         String leader = service.checkLeader(bFk);
	         System.out.println("user: " + user);
	         System.out.println("checkLeader result : " + leader);
	         
	         if (!(leader.equals(user))) {
	        	 System.out.println("---------------not equals");
	        	 	return "NotLeader";
	         }
	         else {
	        	 System.out.println("--------------- equals");
	        	 service.deleteBoard(bFk);
	        	 System.out.println("dao success");
	        	 return "Leader";
	         }
	      
	   }

	

	// boardList에서 board로 가기 위한 테스트
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board() {
		return "/board";
	}

}