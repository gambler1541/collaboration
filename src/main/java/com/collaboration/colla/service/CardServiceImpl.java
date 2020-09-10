package com.collaboration.colla.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.collaboration.colla.dao.CardDAO;
import com.collaboration.colla.vo.CardSortableVO;
import com.collaboration.colla.vo.CardVO;

@Service
@RequestMapping("/card/*")
public class CardServiceImpl implements CardService {
	@Inject
	CardDAO cardDAO;

	@Override
	public List<CardVO> getCard(int bFk) {

		return cardDAO.getCard(bFk);
	}

	@Override
	public int cardWrite(CardVO cvo) {
		return cardDAO.cardWrite(cvo);

	}

	@Override
	public void updatelFkAboutSortable(CardSortableVO csvo) {
		cardDAO.updatelFkAboutSortable(csvo);

	}

	@Override
	public void cardSort(CardSortableVO csvo) {
		cardDAO.cardSort(csvo);

	}

	@Override
	public void firstIndexSort(CardSortableVO csvo) {
		cardDAO.firstIndexSort(csvo);

	}

	@Override
	public void nextZeroSort(CardSortableVO csvo) {
		cardDAO.nextZeroSort(csvo);

	}

	@Override
	public void beforeZeroSort(CardSortableVO csvo) {
		cardDAO.beforeZeroSort(csvo);

	}

	@Override
	public List<CardVO> forPush(int[] cFkArr) {
		return cardDAO.forPush(cFkArr);
		
	}
	
	@Override
	public CardVO cardRead(int cFk) {
		return cardDAO.cardRead(cFk);
	}

	@Override
	public void updateTitle(CardVO cvo) {
		cardDAO.updateTitle(cvo);
		
	}
}