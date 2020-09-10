package com.collaboration.colla.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.collaboration.colla.dao.ListDAO;
import com.collaboration.colla.vo.ListVO;

@Service
public class ListServiceImpl implements ListService {

	@Inject
	ListDAO listDAO;

	@Override
	public List<ListVO> selectList(int bFk) {
		return listDAO.selectList(bFk);

	}

	@Override
	public int addList(ListVO lvo) {
		return listDAO.addList(lvo);
	}

	@Override
	public ListVO selectListObj(int lFk) {
		return listDAO.selectListObj(lFk);
	}

	@Override
	public void updateListTitle(ListVO lvo) {
		listDAO.updateListTitle(lvo);

	}

	@Override
	public void listSort(ListVO lvo) {
		listDAO.listSort(lvo);

	}

	@Override
	public void zeronextlFk(ListVO lvo) {
		listDAO.zeronextlFk(lvo);

	}

	@Override
	public void zerobeforelFk(ListVO lvo) {
		listDAO.zerobeforelFk(lvo);

	}

}