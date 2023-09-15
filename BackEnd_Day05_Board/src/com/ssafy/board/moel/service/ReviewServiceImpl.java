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

	ArrayList<Review> reviews = dao.selectAll();
	
	@Override
	public void writeReview(Review review) {
		reviews.add(review);
	}

	@Override
	public Review getReview(int id) {
		for (int i=0; i<reviews.size(); i++) {
			if (reviews.get(i).getReviewId() == id) return reviews.get(i);
		}
		return null;
	}

	@Override
	public void modifyReview(Review review) {
		for (int i=0; i<reviews.size(); i++) {
			if (reviews.get(i).getReviewId() == review.getReviewId()) {
				Review re = reviews.get(i);
				reviews.set(i, review);
			}
		}
	}

	@Override
	public void removeReview(int id) {
		for (int i=0; i<reviews.size(); i++) {
			if (reviews.get(i).getReviewId() == id) reviews.remove(i);
		}
	}

	@Override
	public List<Review> getList() {
		return reviews;
	}

}
