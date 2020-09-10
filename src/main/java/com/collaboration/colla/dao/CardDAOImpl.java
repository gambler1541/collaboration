package com.collaboration.colla.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.collaboration.colla.vo.CardSortableVO;
import com.collaboration.colla.vo.CardVO;

@Repository // DAO라는 것을 알려주기 위한 어노테이션
public class CardDAOImpl implements CardDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	
	@Override
	public List<CardVO> getCard(int bFk) {
		return sqlSessionTemplate.selectList("getCard", bFk);
	}

	@Override
	public int cardWrite(CardVO cvo) {
		sqlSessionTemplate.insert("cardwrite",cvo);
		int result = cvo.getcFk();
		return  result;
	}

	@Override
	public void updatelFkAboutSortable(CardSortableVO csvo) {
		sqlSessionTemplate.update("updatelFkaboutsortable", csvo);

	}

	@Override
	public void cardSort(CardSortableVO csvo) {
		sqlSessionTemplate.update("cardsort", csvo);

	}

	@Override
	public void firstIndexSort(CardSortableVO csvo) {
		sqlSessionTemplate.update("firstindexsort", csvo);

	}

	@Override
	public void nextZeroSort(CardSortableVO csvo) {
		sqlSessionTemplate.update("nextzerosort", csvo);

	}

	@Override
	public void beforeZeroSort(CardSortableVO csvo) {
		sqlSessionTemplate.update("beforezerosort", csvo);

	}

	@Override
	public List<CardVO> forPush(int[] cFkArr) {
		
		List<CardVO> list = new ArrayList<CardVO>();
		System.out.println("dao cFkArr size : " + cFkArr.length);
		
		for (int i = 0; i < cFkArr.length; i++) {
			int cFk = cFkArr[i];
			CardVO vo =  sqlSessionTemplate.selectOne("forpush",cFk);
			list.add(vo);
		}
		System.out.println("dao list size : " + list.size());
		return list;
	}
	
	@Override
	public CardVO cardRead(int cFk) {
		return sqlSessionTemplate.selectOne("cardread", cFk);
	}

	@Override
	public void updateTitle(CardVO cvo) {
		sqlSessionTemplate.update("updatetitle",cvo);
		
	}
}