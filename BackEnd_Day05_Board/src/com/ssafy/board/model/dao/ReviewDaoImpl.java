package com.ssafy.board.model.dao;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.ssafy.board.model.dto.Review;
import com.ssafy.board.model.dto.Video;

public class ReviewDaoImpl implements ReviewDao {

	private static ReviewDao dao = new ReviewDaoImpl();

	private static ArrayList<Review> reviews = new ArrayList<>();

	
	public static ReviewDao getInstance() {
		return dao;		
	}
	
	@Override
	public ArrayList<Review> selectReview(String videoId) {
		ArrayList<Review> result = new ArrayList<>();
		for (int i=0; i<reviews.size(); i++) {
			if (reviews.get(i).getVideoId().equals(videoId)) result.add(reviews.get(i));
		}
		return result;
	}

	@Override
	public void insertReview(Review review) {
		review.setReviewId(reviews.size());
		reviews.add(review);
		return;
	}

	@Override
	public Review selectOne(String videoId, int reviewId) {
		for (int i = 0; i < reviews.size(); i++) {
			if (reviews.get(i).getVideoId().equals(videoId) && reviews.get(i).getReviewId() == reviewId) {
				return reviews.get(i);
			}
		}
		return null;
	}

	@Override
	public void updateReview(String videoId, int reviewId, String newTitle, String newContent) {
		for (int i = 0; i < reviews.size(); i++) {
			if (reviews.get(i).getVideoId().equals(videoId) && reviews.get(i).getReviewId() == reviewId) {
				reviews.get(i).setTitle(newTitle);
				reviews.get(i).setContent(newContent);
				reviews.get(i).setRegDate(new Date().toString());
			}
		}
	}

	@Override
	public void deleteReview(String videoId, int reviewId) {
		for (int i = 0; i < reviews.size(); i++) {
			if (reviews.get(i).getVideoId().equals(videoId) && reviews.get(i).getReviewId() == reviewId)
				reviews.remove(i);
		}
	}
	
	public ArrayList<Review> selectAll() {
		return reviews;
	}

}
