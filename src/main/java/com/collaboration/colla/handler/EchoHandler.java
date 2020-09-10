package com.collaboration.colla.handler;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.collaboration.colla.service.MemberService;
import com.collaboration.colla.vo.MemberVO;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	MemberService mservice;
	
	

   private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();


   @RequestMapping(value = "/chat", method = RequestMethod.GET)
   public String goChat() { 

      return "/chat";
   }
   // 클라이언트가 연결 되었을때 실행 되는 메서드
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {

      sessionList.add(session);
      System.out.println("연결");
   }

   // 클라이언트가 웹소켓 서버로 메시지를 전송했을때 실행되는 메서드
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      

      for(WebSocketSession sess : sessionList) {
    	  
    	  MemberVO vo = mservice.select(session.getPrincipal().getName());
         sess.sendMessage(new TextMessage(vo.getImg() + "*" + vo.getName() +" : " + message.getPayload()));
      }


   }

   // 클라이언트 연결을 끊었을 때 실행되는 메서드
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      sessionList.remove(session);
      System.out.println("연결이 끊김");
   }
}