package com.collaboration.colla.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.collaboration.colla.service.MemberService;
import com.collaboration.colla.vo.MemberVO;

@Controller
@RequestMapping("/security/*")
public class SecurityController {
	@Autowired
	MemberService service;

	@RequestMapping(value = "/failure", method = RequestMethod.GET)
	@ResponseBody
	public String failure() throws Exception {
		return "<script>" + " alert('Membership information is not correct');" + " history.go(-1);" + " </script>";

	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied() throws Exception {
		return "<script>" + " alert('접근 권한이 없습니다.');" + " history.go(-1);" + " </script>";
	}

	@RequestMapping(value = "/authentication", method = RequestMethod.GET)
	public String authentication(HttpServletRequest request) throws Exception {
		System.out.println("authentidcation in");
		Authentication principal = SecurityContextHolder.getContext().getAuthentication();
		String username = principal.getName();
		MemberVO vo = (MemberVO) service.select(username);
		HttpSession session = request.getSession();
		session.setAttribute("memberVO", vo);

		return "redirect:/board/boardlist";
	}
}
