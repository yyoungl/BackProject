package com.ssafy.board.moel.service;

import java.util.List;

import com.ssafy.board.model.dto.Review;

public interface ReviewService {

	List<Review> getList(String videoId);

	void writeReview(Review review);

	Review getReview(String videoId, int reviewId);

	void modifyReview(String videoId, int reviewId, String newTitle, String newContent);

	void removeReview(String videoId, int reviewId);

}
