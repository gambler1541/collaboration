package com.collaboration.colla.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.collaboration.colla.service.MemberService;
import com.collaboration.colla.util.UploadFileUtils;
import com.collaboration.colla.vo.MemberVO;
import com.collaboration.colla.vo.WithMemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	MemberService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String getJoin() throws Exception {
		return "/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postJoin(MemberVO vo) throws Exception {

		service.join(vo);
		System.out.println("join success.");
		return "redirect:/member/login";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin() throws Exception {
		return "/login";
	}

	@RequestMapping(value = "/emailcheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheck(@RequestParam String email) throws Exception {

		String str = service.emailCheck(email) + "";
		return str;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public List<String> search(@RequestParam String search) throws Exception {

		List<String> list = service.search(search);
		return list;

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@ResponseBody
	public String memberModify(MemberVO vo, HttpSession session) throws Exception {

		int result = service.memberUpdate(vo);
		MemberVO member = (MemberVO) session.getAttribute("memberVO");

		if (result == 1) {
			member.setName(vo.getName());

		}
		return "<script>history.go(-1)</script>";
	}

	@RequestMapping(value = "/changePasswd", method = RequestMethod.GET)
	public String getChangePasswd() throws Exception {
		return "/changePasswd";
	}

	@RequestMapping(value = "/changePasswd", method = RequestMethod.POST)
	@ResponseBody
	public String postChangePasswd(@RequestParam String newpassword, MemberVO vo, HttpSession session,
			HttpServletRequest request) throws Exception {
		// 가입할 때 적은 비밀번호와 내가 적은 비밀번호가 일치하는 지 보고 그 다음에
		// 바꿀 비밀번호와 비밀번호 확인란에 적은 값이 같은지 비교한 다음
		// 모두 같다면 비밀번호를 내가 새로 적은 비밀번호로 바꿔야함
		String oripassword = service.getPassword(vo);
		System.out.println("====================================================");
		
		System.out.println("new : " + newpassword);
		System.out.println("orig : " + vo.getPassword());
		
		if (oripassword.equals(vo.getPassword())) {
			vo.setPassword(newpassword);
			service.passwdUpdate(vo);
		}else {
			
			return "<script>alert('original password do not match.'); history.go(-1);</script>";
		}

		return "<script>window.close();</script>";
	}

	@RequestMapping(value = "/imgupload", method = RequestMethod.POST)
	@ResponseBody
	public String imgUpload(HttpSession session, MultipartFile file, MemberVO vo) throws Exception {
		// Multipartfile 객체로 업로드 하려는 file
		System.out.println("file : " + file);

		// servlet-context에 미리 지정해둔 uploadpath(resources\imgUplaod file에 이미지가 업로드 됨)
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		// calcPath : 년/월/일 의 경로를 만듬
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		// 업로드된 file이 있다면 파일 이름을 만들어서(중복방지) sfileName에 저장
		fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		vo.setImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		MemberVO member = (MemberVO) session.getAttribute("memberVO");
		int result = service.imgUpload(vo);
		// 실제로 MemberVO.img에 저장되는 파일이름은 resources 이후의 \imgUpload\yy\mm\dd\만들어진 filename
		// memberVO.getImg(); 만으로도 src 경로를 찾아가서 이미지 보여주기가 가능
		if (result == 1) {
			member.setImg(vo.getImg());

		}

		return "<script>history.go(-1)</script>";
	}

	@RequestMapping(value = "/boardChat", method = RequestMethod.GET)
	public String getBoardChat() throws Exception {
		return "/boardChat";
	}

	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public String getWithdrawal() throws Exception {
		return "/withdrawal";
	}

	@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
	@ResponseBody
	public String postWithdrawal(HttpSession session, MemberVO vo) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("memberVO");
		String email = member.getEmail();
		String oldPass = member.getPassword();
		String newPass = vo.getPassword();
		vo.setEmail(email);

		if (!(oldPass.equals(newPass))) {

			return "NotPassword";

		} else {
			service.withdrawal(vo);
			session.invalidate();
			return "Password";
		}

	}

	@RequestMapping(value = "/addBoardMember", method = RequestMethod.POST)
	@ResponseBody
	public String addBoardMember(WithMemberVO wmvo) {

		System.out.println(wmvo.getN());
		System.out.println(wmvo.getWithMember());
		service.withmemberinsert(wmvo);
		return "<script>history.go(-1);</script>";
	}

}