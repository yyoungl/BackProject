package com.ssafy.board.moel.service;

import java.util.List;

import com.ssafy.board.model.dto.Review;


public interface ReviewService {
	
	List<Review> getList();
	void writeReview(Review review);
	Review getReview(int id);
	void modifyReview(Review review);
	void removeReview(int reviewId);
	
}
