package com.ssafy.board.moel.service;

import java.util.List;

import com.ssafy.board.model.dto.Board;

public interface BoardService {
	
	List<Board> getList();
	void writeBoard(Board board);
	Board getBoard(int id);
	void modifyBoard(Board board);
	void removeBoard(int id);
	
}
