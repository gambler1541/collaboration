package com.collaboration.colla.service;

import java.util.List;
import java.util.Map;

import com.collaboration.colla.vo.BoardVO;

public interface BoardService {
   // 보드 생성(보드의 타이틀을 적도록 함)
   public int insertBoard(BoardVO bvo) throws Exception;
   public List<BoardVO> selectBoardList(String email);
   public void createNewBoard();
   public BoardVO selectBoard(int bFk);
   public List<BoardVO> searchBoard(Map<String, String> map);
   public void deleteBoard(int bFk);
   public String checkLeader(int bFk);
}