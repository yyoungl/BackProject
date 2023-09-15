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
	public Review getReview(int id) {
		return dao.selectOne(id);
	}

	@Override
	public void modifyReview(Review review) {
		dao.updateReview(review);
	}

	@Override
	public void removeReview(int id) {
		dao.deleteReview(id);
	}

	@Override
	public List<Review> getList(String videoId) {
		return dao.selectReview(videoId);
	}

}
