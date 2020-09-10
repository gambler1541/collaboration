package com.collaboration.colla.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.collaboration.colla.service.BoardService;
import com.collaboration.colla.service.CardService;
import com.collaboration.colla.service.ListService;
import com.collaboration.colla.service.MemberService;
import com.collaboration.colla.vo.BoardVO;
import com.collaboration.colla.vo.CardVO;
import com.collaboration.colla.vo.ListVO;
import com.collaboration.colla.vo.MemberVO;

@Controller
@RequestMapping(value="/list/*")
public class ListController {

    @Autowired
      ListService lservice;
      @Autowired
      CardService cservice;
      @Autowired
      BoardService bservice;
      @Autowired
      MemberService mservice;
   
   

   @RequestMapping(value="/list", method = RequestMethod.GET)
   public String getList(@RequestParam int bFk, Model model, HttpSession session) throws Exception {
        
      System.out.println("/list/list controller in ");
         session.setAttribute("bFk", bFk);
         
         List<MemberVO> memberlist = mservice.getBmemberList(bFk);
         model.addAttribute("mlist", memberlist);
         
         BoardVO board = bservice.selectBoard(bFk);
         List<ListVO> llist = lservice.selectList(bFk);
         System.out.println("llist" + llist);
        
         List<CardVO> clist = cservice.getCard(bFk);
         System.out.println("---------- return cardlist.size() : " + clist.size());
         
         model.addAttribute("board", board);
         
         if(llist.size() != 0) {
            model.addAttribute("listList", llist);
            if(clist.size() != 0) {
               model.addAttribute("cardList", clist);
            }
         }
         return "/list";
   }

    @RequestMapping(value="/addlist", method = RequestMethod.GET) 
     @ResponseBody
     public ListVO addList(Model model,HttpSession session) throws Exception {
     
     int bFk = (int)session.getAttribute("bFk");
     ListVO lvo = new ListVO();
     lvo.setbFk(bFk);
     System.out.println("addList controller in !! - 현재 session 에 들어온 b_fk 값은 : " + session.getAttribute("bFk")); 
     int lFk = lservice.addList(lvo); 
     System.out.println("insert 한 list 의 lFk -------------- " + lFk);
     lvo = lservice.selectListObj(lFk);
     System.out.println("selectListObj 의 return된 lvo.getlTitle : " + lvo.getlTitle());
     return lvo; 
     
     }
    
    
    @RequestMapping(value="/updateListTitle", method=RequestMethod.POST)
    @ResponseBody
    public String updateListTitle(ListVO lvo) throws Exception {
      
       System.out.println("lvo print : " + lvo.getbFk() + "," + lvo.getlFk() + "," + lvo.getlTitle());
       if (lvo.getlTitle() == null && lvo.getlTitle() == " ") {
         lvo.setlTitle("Please Create Title");
      }
       lservice.updateListTitle(lvo);
       
       return "<script>history.go(-1);</script>";
    }
    
    
    
    
   
     @RequestMapping(value="/listsort",method=RequestMethod.GET) 
     @ResponseBody
     public void listSort(@RequestParam int beforelFk, @RequestParam int lFk, @RequestParam int nextlFk) throws
     Exception { System.out.println("listSort Controller in ~ ");
     System.out.println("beforelFk : " + beforelFk + "/ nextlFk : " + nextlFk + " / lFk : " + lFk);

     ListVO lvo = new ListVO();
     
     if(nextlFk==0) {
        lvo.setBeforelFk(beforelFk);
        lvo.setlFk(lFk);
        lservice.zeronextlFk(lvo);
     }
     else if(beforelFk==0) {
        lvo.setNextlFk(nextlFk);
        lvo.setlFk(lFk);
        lservice.zerobeforelFk(lvo);
     }else {
     lvo.setBeforelFk(beforelFk);
     lvo.setNextlFk(nextlFk);
     lvo.setlFk(lFk);
     
     lservice.listSort(lvo);
     }
     
     }
    
}