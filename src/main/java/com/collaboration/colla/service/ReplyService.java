package com.collaboration.colla.service;

import java.util.List;

import com.collaboration.colla.vo.ReplyVO;

public interface ReplyService {
   public List<ReplyVO> getReply(int cFk);
   
   public void replyWrite(ReplyVO rvo);
}