package com.collaboration.colla.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.collaboration.colla.dao.MemberDAO;
import com.collaboration.colla.vo.BMemberVO;
import com.collaboration.colla.vo.CMemberVO;
import com.collaboration.colla.vo.MemberVO;
import com.collaboration.colla.vo.WithMemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDAO;

	@Override
	public void join(MemberVO vo) {
		memberDAO.join(vo);

	}

	@Override
	public MemberVO select(String email) {
		return (MemberVO) memberDAO.select(email);

	}

	@Override
	public int emailCheck(String email) {
		int str = memberDAO.emailCheck(email);
		System.out.println(str);
		return str;

	}

	@Override
	public List<String> search(String search) {

		return memberDAO.search(search);
	}

	@Override
	public void withmemberinsert(WithMemberVO wmvo) {
		memberDAO.withmemberinsert(wmvo);

	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return memberDAO.memberUpdate(vo);

	}

	@Override
	public List<MemberVO> getBmemberList(int bFk) {
		MemberVO vo;
		List<BMemberVO> blist = memberDAO.getBmemberList(bFk);
		List<MemberVO> mlist = new ArrayList<MemberVO>();

		for (int i = 0; i < blist.size(); i++) {
			BMemberVO bmv = blist.get(i);
			vo = memberDAO.select(bmv.getbMember());
			mlist.add(vo);
		}

		return mlist;
	}

	@Override
	public int imgUpload(MemberVO vo) {
		return memberDAO.imgUpload(vo);
	}

	@Override
	public int passwdUpdate(MemberVO vo) {
		return memberDAO.passwdUpdate(vo);
	}

	@Override
	public String getPassword(MemberVO vo) {
		return memberDAO.getPassword(vo);
	}
	
	
	@Override
	public void cardmemberinsert(WithMemberVO wmvo) {
		memberDAO.cardmemberinsert(wmvo);
	}

	@Override
	public List<CMemberVO> getCMember(String email) {
		return memberDAO.getCMember(email);
	}

	   @Override
	   public void withdrawal(MemberVO vo) {
	      memberDAO.withdrawal(vo);
	      
	   }
	
}