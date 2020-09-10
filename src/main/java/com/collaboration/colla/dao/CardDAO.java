package com.collaboration.colla.dao;

import java.util.List;

import com.collaboration.colla.vo.CardSortableVO;
import com.collaboration.colla.vo.CardVO;

public interface CardDAO {

	public List<CardVO> getCard(int bFk);

	public int cardWrite(CardVO cvo);

	public void updatelFkAboutSortable(CardSortableVO csvo);

	public void cardSort(CardSortableVO csvo);

	public void firstIndexSort(CardSortableVO csvo);

	public void nextZeroSort(CardSortableVO csvo);

	public void beforeZeroSort(CardSortableVO csvo);

	public List<CardVO> forPush(int[] cFkArr);
	
	 public CardVO cardRead(int cFk);

	public void updateTitle(CardVO cvo);

}