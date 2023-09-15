package com.ssafy.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.board.model.dto.Review;
import com.ssafy.board.model.dto.Video;
import com.ssafy.board.moel.service.ReviewService;
import com.ssafy.board.moel.service.ReviewServiceImpl;

@WebServlet("/main")
public class ReviewController extends HttpServlet {

	List<Video> videosByView = new ArrayList<>();
	List<Video> videosByPart = new ArrayList<>();

	Video video1 = new Video("gMaB-fG4u4g", "전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]", "전신", "ThankyouBUBU",
			"https://www.youtube.com/embed/gMaB-fG4u4g?si=PFmf7UIvsmH7OwPZ");
	Video video2 = new Video("swRNeYw1JkY", "하루 15분! 전신 칼로리 불태우는 다이어트 운동", "전신", "ThankyouBUBU",
			"https://www.youtube.com/embed/swRNeYw1JkY?si=s2kYpUF6PMGRzhft");
	Video video3 = new Video("54tTYO-vU2E", "상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]", "상체", "ThankyouBUBU",
			"https://www.youtube.com/embed/54tTYO-vU2E?si=9VVanQNVQGK-2y9M");
	Video video4 = new Video("QqqZH3j_vH0", "상체비만 다이어트 최고의 운동 [상체 핵매운맛]", "상체", "ThankyouBUBU",
			"https://www.youtube.com/embed/QqqZH3j_vH0?si=_Xj8sU-plIPIMBpQ");
	Video video5 = new Video("tzN6ypk6Sps", "하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]", "하체", "김강민",
			"https://www.youtube.com/embed/tzN6ypk6Sps?si=6zILeoSdkIYidpKH");
	Video video6 = new Video("u5OgcZdNbMo", "저는 하체 식주의자 입니다", "하체", "GYM종국",
			"https://www.youtube.com/embed/u5OgcZdNbMo?si=TWb46jyEENRucNrt");
	Video video7 = new Video("PjGcOP-TQPE", "11자복근 복부 최고의 운동 [복근 핵매운맛]", "복부", "ThankyouBUBU",
			"https://www.youtube.com/embed/PjGcOP-TQPE?si=o8idEtwL0dQzubHZ");
	Video video8 = new Video("7TLk7pscICk", "(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)", "복부", "SomiFit",
			"https://www.youtube.com/embed/7TLk7pscICk?si=KiR-QDGCtJBQyjCN");

	// 의존성 주입
	private ReviewService service = ReviewServiceImpl.getInstance();

	// post 요청시 encoding 변경
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getMethod().equals("POST"))
			request.setCharacterEncoding("UTF-8");

		String act = request.getParameter("act");

		switch (act) {
		case "main":
			doMain(request, response);
			break;
		case "reviewList":
			doReviewList(request, response);
			break;
		case "reviewCreate":
			doCreate(request, response);
			break;
		case "reviewDetail":
			doDetail(request, response);
			break;
		case "reviewUpdate":
			doUpdate(request, response);
			break;
		case "reviewDelete":
			doDelete(request, response);
			break;
		}
	}

	private void doMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (videosByView.size() == 0) {
			videosByView.add(video8);
			videosByView.add(video3);
			videosByView.add(video7);
		}
		if (videosByPart.size() == 0) {
			videosByPart.add(video6);
			videosByPart.add(video5);
			videosByPart.add(video2);
		}

		request.setAttribute("videosByView", videosByView);
		request.setAttribute("videosByPart", videosByPart);
		request.getRequestDispatcher("/board/main.jsp").forward(request, response);
	}

	private void doReviewList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String videoId = (String) request.getAttribute("videoId");
		List<Review> reviewList = service.getList(videoId);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("videoId", videoId);
		request.getRequestDispatcher("/board/reviewList.jsp").forward(request, response);

	}

	private void doCreate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		request.getRequestDispatcher("/board/reviewCreate.jsp").forward(request, response);
	}

	private void doDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		request.setAttribute("title", title);
		request.setAttribute("content", content);
		request.getRequestDispatcher("/board/reviewDetail.jsp").forward(request, response);
	}

	private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		request.getRequestDispatcher("/board/reviewDetail.jsp").forward(request, response);
	}

//	private void doDelete(HttpServletRequest request, HttpServletResponse response) {
//		// TODO Auto-generated method stub
//	}

}
