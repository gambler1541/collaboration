package com.collaboration.colla.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.collaboration.colla.dao.ReplyDAO;
import com.collaboration.colla.vo.ReplyVO;

@Service
@RequestMapping("/reply/*")
public class ReplyServiceImpl implements ReplyService {

   @Inject
   ReplyDAO replyDAO;
   
   @Override
   public List<ReplyVO> getReply(int cFk) {
      return replyDAO.getReply(cFk);
   }

   @Override
   public void replyWrite(ReplyVO rvo) {
      replyDAO.replyWrite(rvo);
   }

}