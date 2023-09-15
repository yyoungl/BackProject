package com.ssafy.board.model.dto;

import java.util.Date;

public class Video {
	private String videoId;
	private String title;
	private String fitPartName;
	private String channelName;
	private int viewCnt;
	public Video() {
		
	}
	public Video(String videoId, String title, String fitPartName, String channelName, int viewCnt) {
		super();
		this.videoId = videoId;
		this.title = title;
		this.fitPartName = fitPartName;
		this.channelName = channelName;
		this.viewCnt = viewCnt;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFitPartName() {
		return fitPartName;
	}
	public void setFitPartName(String fitPartName) {
		this.fitPartName = fitPartName;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	
}
