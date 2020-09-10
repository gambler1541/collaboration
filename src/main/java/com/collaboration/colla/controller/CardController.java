package com.collaboration.colla.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.collaboration.colla.service.CardService;
import com.collaboration.colla.service.MemberService;
import com.collaboration.colla.service.ReplyService;
import com.collaboration.colla.vo.CardSortableVO;
import com.collaboration.colla.vo.CardVO;
import com.collaboration.colla.vo.ReplyVO;
import com.collaboration.colla.vo.WithMemberVO;

@Controller
@RequestMapping("/card/**")
public class CardController {

	@Autowired
	CardService cservice;
	
	@Autowired
	MemberService mservice;

	@Autowired
	ReplyService rservice;

	@RequestMapping(value="/cardwrite",method=RequestMethod.POST)
	@ResponseBody
	public String cardWrite(CardVO cvo, HttpServletRequest request) {
		
		int card = cservice.cardWrite(cvo);
		
		System.out.println("카드 : " + card );
		String[] cardmember = request.getParameterValues("cardmembers");
		
		if(cardmember!=null) {
		for (int i = 0; i < cardmember.length; i++) {
			WithMemberVO wmvo = new WithMemberVO();
			wmvo.setWithMember(cardmember[i]);
			wmvo.setN(card);
			mservice.cardmemberinsert(wmvo);
		}
		}
		
		return "<script>history.go(-1);</script>";
	}

	@RequestMapping(value = "/cardsortable", method = RequestMethod.GET)
	@ResponseBody
	public void cardSortable(CardSortableVO csvo) throws Exception {

		System.out.println("cardSortable controller in -- ");
		if (csvo.getStartParent() != csvo.getStopParent()) {

			cservice.updatelFkAboutSortable(csvo);
		}

		if (csvo.getBeforecFk() != 0 && csvo.getNextcFk() != 0) {
			cservice.cardSort(csvo);
		} else if (csvo.getBeforecFk() == 0 && csvo.getNextcFk() == 0) {
			cservice.firstIndexSort(csvo);
		} else if (csvo.getBeforecFk() == 0) {
			cservice.beforeZeroSort(csvo);
		} else {
			cservice.nextZeroSort(csvo);
		}

	}
	
	
	
	@RequestMapping(value = "/cardread", method = RequestMethod.GET)
	   @ResponseBody
	   public Map cardRead(@RequestParam int cFk) throws Exception {
	      System.out.println("Card Read In");
	      CardVO cardread = cservice.cardRead(cFk);
	      System.out.println("카드 읽기 : " + cardread);
	      
	      List<ReplyVO> replyread = rservice.getReply(cFk);
	      
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("cardread", cardread);
	      map.put("replyread", replyread);
	      
	      return map;
	   }
	
	@RequestMapping(value = "/updatetitle", method = RequestMethod.POST)
	@ResponseBody
	public void updateTitle(@RequestParam String cTitle, @RequestParam int cFk) throws Exception {
		System.out.println("update title controller in/ cTitle : " + cTitle + "/ cFk : " + cFk);
		CardVO cvo = new CardVO();
		cvo.setcTitle(cTitle);
		cvo.setcFk(cFk);
		
		cservice.updateTitle(cvo);
		
	}

}