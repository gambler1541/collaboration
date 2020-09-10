package com.collaboration.colla.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.collaboration.colla.dao.BoardDAO;
import com.collaboration.colla.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardDAO boardDAO;

	@Override
	public List<BoardVO> selectBoardList(String email) {
		List<BoardVO> bvo = (List) boardDAO.selectBoardList(email);
		return bvo;
	}

	@Override
	public int insertBoard(BoardVO bvo) throws Exception {
		return boardDAO.insertBoard(bvo);
	}

	@Override
	public void createNewBoard() {
		boardDAO.createNewBoard();

	}

	@Override
	public BoardVO selectBoard(int bFk) {
		return boardDAO.selectBoard(bFk);
	}
	
	@Override
	public List<BoardVO> searchBoard(Map<String, String> map) {
		return boardDAO.searchBoard(map);
	}

	@Override
	public void deleteBoard(int bFk) {
		boardDAO.deleteBoard(bFk);
		
	}

	@Override
	public String checkLeader(int bFk) {
		return boardDAO.checkLeader(bFk);
	}
}