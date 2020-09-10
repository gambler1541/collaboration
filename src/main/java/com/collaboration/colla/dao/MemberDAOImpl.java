package com.collaboration.colla.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.collaboration.colla.vo.BMemberVO;
import com.collaboration.colla.vo.CMemberVO;
import com.collaboration.colla.vo.MemberVO;
import com.collaboration.colla.vo.WithMemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private SqlSessionTemplate sqlsessionTemplate;

	@Autowired
	public void setSqlsessionTemplate(SqlSessionTemplate sqlsessionTemplate) {
		this.sqlsessionTemplate = sqlsessionTemplate;
	}

	@Override
	public void join(MemberVO vo) {
		sqlsessionTemplate.insert("join", vo);
	}

	@Override
	public MemberVO select(String email) {
		MemberVO vo = (MemberVO) sqlsessionTemplate.selectOne("select", email);
		return vo;
	}

	@Override
	public int emailCheck(String email) {
		return sqlsessionTemplate.selectOne("emailCheck", email);

	}

	@Override
	public List<String> search(String search) {
		return sqlsessionTemplate.selectList("search", search);
		// search 결과가 null일 경우 잡아주기
	}

	@Override
	public void withmemberinsert(WithMemberVO wmvo) {
		sqlsessionTemplate.insert("withmemberinsert", wmvo);

	}

	@Override
	public int memberUpdate(MemberVO vo) {
		int result = sqlsessionTemplate.update("memberUpdate", vo);
		System.out.println("DAO result update : " + result);
		return result;
	}

	@Override
	public List<BMemberVO> getBmemberList(int bFk) {
		return sqlsessionTemplate.selectList("bMemberList", bFk);
	}

	@Override
	public int imgUpload(MemberVO vo) {
		return sqlsessionTemplate.update("imgUpload", vo);
	}

	@Override
	public int passwdUpdate(MemberVO vo) {
		int result1 = sqlsessionTemplate.update("passwdUpdate", vo);
		return result1;
	}

	@Override
	public String getPassword(MemberVO vo) {
		return sqlsessionTemplate.selectOne("getPassword", vo);
	}

	@Override
	public void cardmemberinsert(WithMemberVO wmvo) {
		sqlsessionTemplate.insert("insertcardmember", wmvo);
	}

	@Override
	public List<CMemberVO> getCMember(String email) {
		return sqlsessionTemplate.selectList("getcmember", email);

	}

	@Override
	public void withdrawal(MemberVO vo) {
		sqlsessionTemplate.delete("withdrawal", vo);

	}

}