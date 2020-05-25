<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>好家在</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/07_css/bootstrap.min.css">
<link rel="stylesheet" href="css/07_css/magnific-popup.css">
<link rel="stylesheet" href="css/07_css/jquery-ui.css">
<link rel="stylesheet" href="css/07_css/owl.carousel.min.css">
<link rel="stylesheet" href="css/07_css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/07_css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/07_css/mediaelementplayer.css">
<link rel="stylesheet" href="css/07_css/animate.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/07_css/fl-bigmug-line.css">


<link rel="stylesheet" href="css/07_css/aos.css">

<link rel="stylesheet" href="css/07_css/style.css">

</head>

<body>

	<div class="site-loader"></div>


	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
    </div>

		<div class="site-blocks-cover inner-page-cover overlay"
			data-aos="fade" data-stellar-background-ratio="0.5">
			<div class="container">
				<div
					class="row align-items-center justify-content-center text-center">
					<div class="col-md-10">
						<h1 class="mb-2">新聞</h1>
					</div>
				</div>
			</div>
		</div>


		<div class="site-section">
			<div class="container">
				<div class="row">
						<div class="row mb-5 justify-content-center" data-aos="fade-up">
							<div class="col-md-7">
								<div class="site-section-title text-center">
									<h2>${selectnews.newstitle}</h2>
									<p>${selectnews.newscontent}</p>
									<a href="javascript:history.back(-1)">返回上一頁</a>
								</div>
							</div>
						</div>

						

					</div>
				</div>


				<jsp:include page="/footer.jsp" />

			</div>
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/jquery-migrate-3.0.1.min.js"></script>
		<script src="js/jquery-ui.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/mediaelement-and-player.min.js"></script>
		<script src="js/jquery.stellar.min.js"></script>
		<script src="js/jquery.countdown.min.js"></script>
		<script src="js/jquery.magnific-popup.min.js"></script>
		<script src="js/bootstrap-datepicker.min.js"></script>
		<script src="js/aos.js"></script>

		<script src="js/main.js"></script>
</body>

</html>