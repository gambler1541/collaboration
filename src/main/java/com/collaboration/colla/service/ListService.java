package com.collaboration.colla.service;

import java.util.List;

import com.collaboration.colla.vo.ListVO;

public interface ListService {
	public List<ListVO> selectList(int bFk);

	public int addList(ListVO lvo);

	public ListVO selectListObj(int lFk);

	public void updateListTitle(ListVO lvo);

	public void listSort(ListVO lvo);

	public void zeronextlFk(ListVO lvo);

	public void zerobeforelFk(ListVO lvo);

}