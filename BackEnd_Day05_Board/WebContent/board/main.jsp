<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFIT</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous">
	
</script>
<script>
	function redirectToReviewList(videoId, url) {
		// 선택한 비디오의 정보를 Controller로 전송
		console.log(videoId, url);
		window.location.href = './main?act=reviewList&videoId=' + videoId
				+ '&url=' + url;
	}
</script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	list-style: none;
}

a {
	text-decoration: none !important;
}

.container {
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
	left: 0;
	right: 0;
	margin: auto;
	margin-top: 100px;
	margin-bottom: 200px;
	width: 1400px;
}

.container-fluid {
	padding: 0 20px 0 20px !important;
}

#page-name {
	font-weight: bold;
	font-size: 2rem;
}

.main-image {
	width: 100%;
	height: 200px;
}

.search-box {
	width: 100%;
	padding: 10px;
}

input {
	width: 100%;
}

.video-list img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.video-box {
	width: 100%;
}
</style>
</head>
<body>
	<a href="./main?act=reviewList"></a>
	<header>
		<nav class="navbar shadow navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand" id="page-name" href="./main?act=main">SSAFIT</a>
				<div class="justify-end d-flex" id="navbarScroll">
					<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
						style="-bs-scroll-height: 100px;">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="./main?act=main">HOME</a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 사용자 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/user/likeList.html">찜</a></li>
								<li><a class="dropdown-item" href="/user/follow.html">팔로우</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link"
							href="/user/login.html">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="main-image-container">
			<img class="main-image object-fit-cover"
				src="https://watermark.lovepik.com/photo/20211126/large/lovepik-gym-picture_501088658.jpg"
				alt="main image">
		</div>
	</header>

	<div class="container">
		<div style="width: 100%; padding: 10px;"
			class="d-flex align-items-center shadow-sm mb-4"
			style="border-radius: 8px; ">
			<span class="material-symbols-outlined">search</span>
			<div style="flex-grow: 1; margin-left: 10px;">
				<input
					style="width: 100%; border: none; background-color: transparent; margin: 6px 2px 6px 2px; padding: 2px;"
					list="datalistOptions" placeholder="운동 제목 검색">

			</div>
			<datalist id="datalistOptions">
				<option value="상체">
				<option value="하체">
				<option value="어깨">
				<option value="가슴">
				<option value="삼두">
			</datalist>
		</div>
		<div class=" video-box">
			<div>
				<p class="fw-bold text-left fs-4">최근 가장 많이 본 영상</p>
			</div>
			<div
				class="shadow pe-3 ps-3 pt-4 pb-4 d-flex video-list w-100 justify-content-around">
				<c:forEach items="${videosByView }" var="video">
					<div
						onclick="redirectToReviewList('${video.videoId}', '${video.url}')"
						style="cursor: pointer; width: 30%;">
						<div class="text-wrap fw-bold">
							<div class="text-center">
								<iframe width="100%" height="auto" src="${video.url}"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
									allowfullscreen></iframe>
							</div>
							<div class="mt-1 mb-1 d-flex text-wrap">${video.title }</div>
							<div class="justify-content-between d-flex">
								<span
									class="p-1 rounded-pill fw-bold bg-primary w-auto text-white">
									${video.fitPartName } </span> <span
									class="fw-normal text-body-secondary">${video.channelName }</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class=" mt-5 video-box">
			<div>
				<p class="fw-bold text-left fs-4">최근 가장 많이 본 영상</p>
			</div>
			<div
				class="shadow pe-3 ps-3 pt-4 pb-4 d-flex video-list w-100 justify-content-around">
				<c:forEach items="${videosByPart }" var="video">
					<div
						onclick="redirectToReviewList('${video.videoId}', '${video.url}')"
						style="cursor: pointer; width: 30%;">
						<div class="text-wrap fw-bold">
							<div class="text-center">
								<iframe width="100%" height="auto" src="${video.url}"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
									allowfullscreen></iframe>
							</div>
							<div class="mt-1 mb-1 d-flex text-wrap">${video.title }</div>
							<div class="justify-content-between d-flex">
								<span
									class="p-1 rounded-pill fw-bold bg-primary w-auto text-white">
									${video.fitPartName } </span> <span
									class="fw-normal text-body-secondary">${video.channelName }</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	</div>
</body>
</html>