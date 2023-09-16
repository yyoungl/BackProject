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
	crossorigin="anonymous"></script>
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
	<header>
        <nav class="navbar shadow navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <a class="navbar-brand" id="page-name" href="./main?act=main">SSAFIT</a>
              <div class="justify-end d-flex" id="navbarScroll">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/main/main.html">HOME</a>
                  </li>
    
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      사용자
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="/user/likeList.html">찜</a></li>
                      <li><a class="dropdown-item" href="/user/follow.html">팔로우</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/user/login.html">로그아웃</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
    </header>

	<div class="container">
		<div class="shadow pt-5 pb-5 m-5 bg-light rounded" style="width: 80%;">
			<form class="reviewform" style="width: 80%; margin: auto;">

				<div class="text-center">
					<span class="material-symbols-outlined">dialogs</span>
					<h2 class="d-inline mb-3 fs-4 fw-semibold">운동영상 리뷰 목록</h2>
					<span class="material-symbols-outlined">dialogs</span>
				</div>

				<hr class="mb-3">
				<div class="text-center">
					<iframe width="560" height="315"
						src="${url}"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen></iframe>
				</div>

				<hr class="mb-3">

				<div class="d-flex justify-content-between">
					<button type="button"
						onclick="location.href='./main?act=goReviewCreate&videoId=${videoId}&url=${url}'"
						class="w-20 me-2 btn btn-outline-primary">글 작성</button>
					<div style="border-bottom: solid gray 1px;"
						class="d-flex align-items-center">
						<span class="material-symbols-outlined align-items-center">search</span>

						<input style="border: none; background-color: transparent;"
							placeholder="제목,내용으로 검색">

					</div>
				</div>

				<hr class="mb-3">

				<div class="d-flex justify-content-center">
					<table style="width: 95%;">
						<tr>
							<th class="border-bottom p-3">번호</th>
							<th class="border-bottom p-3">제목</th>
							<th class="border-bottom p-3">작성자</th>
							<th class="border-bottom p-3">조회수</th>
							<th class="border-bottom p-3">작성시간</th>
						</tr>
						<c:forEach items="${reviewList}" var="review">
							<tr onclick="location.href='./main?act=reviewDetail&videoId=${videoId}&url=${url }&reviewId=${review.reviewId }'"
								style="cursor: pointer; text-decoration: underline;"
								class="link-dark link-offset-2 link-underline-opacity-0 link-underline-opacity-100-hover">
								<td class="p-3">${review.reviewId }</td>
								<td class="p-3">${review.title }</td>
								<td class="p-3">${review.writer }</td>
								<td class="p-3">${review.viewCnt }</td>
								<td class="p-3">${review.regDate }</td>
							</tr>
						</c:forEach>
					</table>

				</div>
			</form>
		</div>
	</div>

</body>
</html>