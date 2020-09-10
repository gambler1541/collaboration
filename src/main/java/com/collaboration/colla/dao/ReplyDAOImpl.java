package com.collaboration.colla.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.collaboration.colla.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

   @Inject SqlSessionTemplate sqlSessionTemplate;
   
   @Override
   public List<ReplyVO> getReply(int cFk) {
      return sqlSessionTemplate.selectList("getReply", cFk);
   }

   @Override
   public void replyWrite(ReplyVO rvo) {
      sqlSessionTemplate.insert("replywrite", rvo);
   }
}