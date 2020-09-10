package com.collaboration.colla.dao;

import java.util.List;

import com.collaboration.colla.vo.BMemberVO;
import com.collaboration.colla.vo.CMemberVO;
import com.collaboration.colla.vo.MemberVO;
import com.collaboration.colla.vo.WithMemberVO;

public interface MemberDAO {

	public void join(MemberVO vo);
	public MemberVO select(String email);
	public int emailCheck(String email);
	public List<String> search(String search);
	public void withmemberinsert(WithMemberVO wmvo);
	public int memberUpdate(MemberVO vo);
	public List<BMemberVO> getBmemberList(int bFk);
	public int imgUpload(MemberVO vo);
	public int passwdUpdate(MemberVO vo);
	public String getPassword(MemberVO vo);
	public void cardmemberinsert(WithMemberVO wmvo);
	public List<CMemberVO> getCMember(String email);
	public void withdrawal(MemberVO vo);
}