package com.collaboration.colla.dao;

import java.util.List;

import com.collaboration.colla.vo.ReplyVO;

public interface ReplyDAO {
   public List<ReplyVO> getReply(int cFk);
   
   public void replyWrite(ReplyVO rvo);
}