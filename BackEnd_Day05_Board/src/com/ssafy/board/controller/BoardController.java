package com.ssafy.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.board.moel.service.BoardService;
import com.ssafy.board.moel.service.BoardServiceImpl;

@WebServlet("/board")
public class BoardController extends HttpServlet {
	
	// 의존성 주입
	private BoardService service = BoardServiceImpl.getInstance();
	
	// post 요청시 encoding 변경
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getMethod().equals("POST"))
			request.setCharacterEncoding("UTF-8");
		
		String act = request.getParameter("act");
		
		switch (act) {
		case "list":
			doList(request, response);
			break;
		
		
		}
		
	}

	private void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("list", service.getList());
		request.getRequestDispatcher("/board/list.jsp").forward(request, response);
	}
}
