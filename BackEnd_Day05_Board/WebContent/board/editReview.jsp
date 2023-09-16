<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        <div class=" shadow pt-5 pb-5 m-5 bg-light rounded" style="width: 80%;">
            <form class="reviewform" method="post" action="main" style="width: 80%; margin: auto;">
                <input type="hidden" name="act" value="doReviewUpdate">
				<input type="hidden" name="videoId" value="${videoId }">
				<input type="hidden" name="url" value="${url }">
				<input type="hidden" name="reviewId" value="${review.reviewId }">
                <div class="text-center">
                    <span class="material-symbols-outlined">dialogs</span>
                    <h2 class="d-inline mb-3 fs-4 fw-semibold">운동영상 리뷰 수정</h2>
                    <span class="material-symbols-outlined">dialogs</span>
                </div>
                <hr class="mb-3">
    
                <div class="mb-3">
                    <label for="inputTitle" class="col-form-label">제목</label>
                    <input type="text" class="form-control" id="inputEmail3" name="title" value="${review.title }">
                </div>
    
                <div class="mb-4">
                    <label for="inputContent" class="col-form-label">수정할 내용</label>
                    <textarea class="form-control" type="text" name="content" rows="3">${review.content }</textarea>
                </div>
    
                <button type="submit" class="w-20 me-2 btn btn-outline-primary">수정</button>
                <button type="button" onclick="location.href='./main?act=reviewList&videoId=${videoId}&url=${url }'" class="w-20 btn btn-outline-danger">취소</button>
            
            </form>
        </div>
    </div>

</body>
</html>