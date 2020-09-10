package com.collaboration.colla.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.collaboration.colla.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<BoardVO> selectBoardList(String email) {
		return sqlSessionTemplate.selectList("boardlist", email);
	}

	@Override
	public int insertBoard(BoardVO bvo) {
		sqlSessionTemplate.insert("insertboard", bvo);
		int b_fk = bvo.getbFk();
		return b_fk;
	}

	@Override
	public void createNewBoard() {
		sqlSessionTemplate.insert("createnewboard");

	}

	@Override
	public BoardVO selectBoard(int bFk) {
		return sqlSessionTemplate.selectOne("selectboard", bFk);
	}
	
	@Override
	public List<BoardVO> searchBoard(Map<String, String> map) {
		return sqlSessionTemplate.selectList("searchBoard", map);
	}

	@Override
	public void deleteBoard(int bFk) {
		System.out.println("bFk : " + bFk);
		sqlSessionTemplate.delete("deleteBoard", bFk);
	
	}

	@Override
	public String checkLeader(int bFk) {
		return sqlSessionTemplate.selectOne("selectLeader",bFk);
	}

}