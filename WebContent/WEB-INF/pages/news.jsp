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


		<div class="row mb-5 justify-content-center" data-aos="fade-up"
			data-aos-delay="100" class="text">
			<form action="newsSearch" method="GET">
				<br> <label class="form-check-label"> 臺北市 </label><br> 
				<input type="radio" name="area" value="btd">北投區 
				<input type="radio" name="area" value="sld">士林區 
				<input type="radio" name="area" value="zsd">中山區 
				<input type="radio" name="area" value="nhd">內湖區
				<input type="radio" name="area" value="dtd">大同區
				<input type="radio" name="area" value="ssd">松山區 
				<input type="radio" name="area" value="whd">萬華區 
				<input type="radio" name="area" value="zzd">中正區 
				<input type="radio" name="area" value="dad">大安區 
				<input type="radio" name="area" value="xyd">信義區 
				<input type="radio" name="area" value="ngd">南港區 
				<input type="radio" name="area" value="wsd">文山區
				<hr>
				<label class="form-check-label"> 新北市 </label><br>
				<input type="radio" name="area" value="banqiao">板橋區 
				<input type="radio" name="area" value="zhonghe">中和區
				<input type="radio" name="area" value="xinzhuang">新莊區 
				<input type="radio" name="area" value="tucheng">土城區 
				<input type="radio" name="area" value="xizhi">汐止區 
				<input type="radio" name="area" value="yingge">鶯歌區
				<input type="radio" name="area" value="tamsui">淡水區 
				<input type="radio" name="area" value="wugu">五股區 
				<input type="radio" name="area" value="linkou">林口區 
				<input type="radio" name="area" value="shenkeng">深坑區
				<input type="radio" name="area" value="pinglin">坪林區
				<input type="radio" name="area" value="shimen">石門區 <br>
				<input type="radio" name="area" value="wanli">萬里區
				<input type="radio" name="area" value="shuangxi">雙溪區
				<input type="radio" name="area" value="wulai">烏來區
				<input type="radio" name="area" value="sanchong">三重區
				<input type="radio" name="area" value="yonghe">永和區
				<input type="radio" name="area" value="xindian">新店區
				<input type="radio" name="area" value="luzhou">蘆洲區
				<input type="radio" name="area" value="shulin">樹林區
				<input type="radio" name="area" value="sanxia">三峽區
				<input type="radio" name="area" value="ruifang">瑞芳區
				<input type="radio" name="area" value="taishan">泰山區
				<input type="radio" name="area" value="bali">八里區<br>
				<input type="radio" name="area" value="shiding">石碇區
				<input type="radio" name="area" value="sanzhi">三芝區
				<input type="radio" name="area" value="jinshan">金山區
				<input type="radio" name="area" value="pingxi">平溪區
				<input type="radio" name="area" value="gongliao">貢寮區 <br><br>
				<input type="submit" value="搜尋" class="btn btn-outline-primary rounded-0 py-2 px-5">
				<input type="reset" value="重選" class="btn btn-outline-primary rounded-0 py-2 px-5">
				<hr>
			</form>
		</div>




		<div class="site-section">
			<div class="container">
				<div class="row">


					<c:forEach var="nlist" items="${NewsList}">
						<div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up"
							data-aos-delay="100">
							<!-- <a href="#"><img src="images/img_4.jpg" alt="Image" class="img-fluid"></a> -->
							<div class="p-4 bg-white">
<!-- 								<span class="d-block text-secondary small text-uppercase">Jan -->
<!-- 									20th, 2019</span> -->
								<h2 class="h5 text-black mb-3">
									<a href='<c:url value="newsShow?NEWSID=${nlist.newsnum}"/>'>${nlist.newstitle}</a>
								</h2>
								<p>${nlist.newscontent.substring(0, 31)}...</p>
							</div>
						</div>
					</c:forEach>


				</div>


<!--                 頁籤 -->
<!-- 				<div class="row" data-aos="fade-up"> -->
<!-- 					<div class="col-md-12 text-center"> -->
<!-- 						<div class="site-pagination"> -->
<!-- 							<a href="#">1</a> -->
<!-- 							<a href="#">2</a> -->
<!-- 							<a href="#">3</a> -->
<!-- 							<a href="#">4</a> -->
<!-- 							<a href="#">5</a> -->
<!-- 							<span>...</span> -->
<!-- 							<a href="#">10</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				頁籤 -->

			</div>
		</div>


		<jsp:include page="/footer.jsp" />



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