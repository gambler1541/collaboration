package com.collaboration.colla.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.collaboration.colla.vo.ListVO;

@Repository
public class ListDAOImpl implements ListDAO {

   @Autowired
   SqlSessionTemplate sqlSessionTemplate;

   @Override
   public List<ListVO> selectList(int bFk) {
      return sqlSessionTemplate.selectList("getList", bFk);
   }

   @Override
   public int addList(ListVO lvo) {
      sqlSessionTemplate.insert("addList", lvo);
      int lFk = lvo.getlFk();
      System.out.println("ListDAO 에 반환된 selectKey = " + lFk);
      return lFk;
   }

   @Override
   public ListVO selectListObj(int lFk) {
      return sqlSessionTemplate.selectOne("selectlistobj", lFk);
   }

@Override
public void updateListTitle(ListVO lvo) {
   sqlSessionTemplate.update("updateListTitle",lvo);
   
}


@Override
public void listSort(ListVO lvo) {
   sqlSessionTemplate.update("listsort",lvo);
   
}

@Override
public void zeronextlFk(ListVO lvo) {
   sqlSessionTemplate.update("zeronextlfk",lvo);
   
}

@Override
public void zerobeforelFk(ListVO lvo) {
   sqlSessionTemplate.update("zerobeforelfk", lvo);
   
}
}