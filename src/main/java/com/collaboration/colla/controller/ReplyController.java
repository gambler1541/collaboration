package com.collaboration.colla.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.collaboration.colla.service.MemberService;
import com.collaboration.colla.service.ReplyService;
import com.collaboration.colla.vo.ReplyVO;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
   @Autowired
   ReplyService rservice;
   
   @Autowired
   MemberService mservice;
   
   @RequestMapping(value = "/replySend", method = RequestMethod.POST)
   @ResponseBody
   public String replySend(ReplyVO rvo, HttpSession session) {
      rservice.replyWrite(rvo);
      
      int cfk = rvo.getcFk();
      
      return "<script>history.go(-1);</script>";
   }
}