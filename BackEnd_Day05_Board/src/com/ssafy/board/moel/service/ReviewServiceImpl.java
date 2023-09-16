package com.ssafy.board.moel.service;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.board.model.dao.ReviewDao;
import com.ssafy.board.model.dao.ReviewDaoImpl;
import com.ssafy.board.model.dto.Review;

public class ReviewServiceImpl implements ReviewService {
	
	private static ReviewService service = new ReviewServiceImpl();
	
	private ReviewDao dao = ReviewDaoImpl.getInstance();
	
	private ReviewServiceImpl() {}
	
	public static ReviewService getInstance() {
		return service;
	}

	
	@Override
	public void writeReview(Review review) {
		dao.insertReview(review);
	}

	@Override
	public Review getReview(String videoId, int reviewId) {
		return dao.selectOne(videoId, reviewId);
	}

	@Override
	public void modifyReview(String videoId, int reviewId, String newTitle, String newContent) {
		dao.updateReview(videoId, reviewId, newTitle, newContent);
	}

	@Override
	public void removeReview(String videoId, int reviewId) {
		dao.deleteReview(videoId, reviewId);
	}

	@Override
	public List<Review> getList(String videoId) {
		return dao.selectReview(videoId);
	}

}
