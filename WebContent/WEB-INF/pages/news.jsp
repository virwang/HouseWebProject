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
<style>
	.text1:hover{
		color:#6A6AFF;
		text-shadow: 0 0 0.2em #F87, 0 0 0.2em #F87;
		font-size: 8mm; }
	.r1{
 		font-size: 5mm; 
		}

  	body{
  		font-family: 微軟正黑體;
  	}

</style>
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
			<form class="r1" action="newsSearch" method="GET">
				<br> <label class="form-check-label "> 臺北市 </label><br> 
				<input type="radio" name="area" value="北投區">北投區 
				<input type="radio" name="area" value="士林區">士林區 
				<input type="radio" name="area" value="中山區">中山區 
				<input type="radio" name="area" value="內湖區">內湖區
				<input type="radio" name="area" value="大同區">大同區
				<input type="radio" name="area" value="松山區">松山區 
				<input type="radio" name="area" value="萬華區">萬華區 
				<input type="radio" name="area" value="中正區">中正區 
				<input type="radio" name="area" value="大安區">大安區 
				<input type="radio" name="area" value="信義區">信義區 
				<input type="radio" name="area" value="南港區">南港區 
				<input type="radio" name="area" value="文山區">文山區
				<hr>
				<label class="form-check-label "> 新北市 </label><br>
				<input type="radio" name="area" value="板橋區">板橋區 
				<input type="radio" name="area" value="中和區">中和區
				<input type="radio" name="area" value="新莊區">新莊區 
				<input type="radio" name="area" value="土城區">土城區 
				<input type="radio" name="area" value="汐止區">汐止區 
				<input type="radio" name="area" value="鶯歌區">鶯歌區
				<input type="radio" name="area" value="淡水區">淡水區 
				<input type="radio" name="area" value="五股區">五股區 
				<input type="radio" name="area" value="林口區">林口區 
				<input type="radio" name="area" value="深坑區">深坑區
				<input type="radio" name="area" value="坪林區">坪林區
				<input type="radio" name="area" value="石門區">石門區 <br>
				<input type="radio" name="area" value="萬里區">萬里區
				<input type="radio" name="area" value="雙溪區">雙溪區
				<input type="radio" name="area" value="烏來區">烏來區
				<input type="radio" name="area" value="三重區">三重區
				<input type="radio" name="area" value="永和區">永和區
				<input type="radio" name="area" value="新店區">新店區
				<input type="radio" name="area" value="蘆洲區">蘆洲區
				<input type="radio" name="area" value="樹林區">樹林區
				<input type="radio" name="area" value="三峽區">三峽區
				<input type="radio" name="area" value="瑞芳區">瑞芳區
				<input type="radio" name="area" value="泰山區">泰山區
				<input type="radio" name="area" value="八里區">八里區<br>
				<input type="radio" name="area" value="石碇區">石碇區
				<input type="radio" name="area" value="三芝區">三芝區
				<input type="radio" name="area" value="金山區">金山區
				<input type="radio" name="area" value="平溪區">平溪區
				<input type="radio" name="area" value="貢寮區">貢寮區 <br><br>
				<input type="submit" value="搜尋" class="btn btn-outline-primary rounded-0 py-2 px-5">
				<input type="reset" value="重選" class="btn btn-outline-primary rounded-0 py-2 px-5">
				<hr>
			</form>
		</div>




		<div class="site-section">
			<div class="container">
				<div class="row dnew1">


					<c:forEach var="nlist" items="${NewsList}">
						<div class="col-md-6 col-lg-4 mb-4 " data-aos="fade-up"
							data-aos-delay="100">
							<!-- <a href="#"><img src="images/img_4.jpg" alt="Image" class="img-fluid"></a> -->
							<div class="p-4 dnew2">
<!-- 								<span class="d-block text-secondary small text-uppercase">Jan -->
<!-- 									20th, 2019</span> -->
								<h2 class="h5  mb-3 ">
									<a class="text1" href='<c:url value="newsShow?NEWSID=${nlist.newsnum}"/>'>${nlist.newstitle}</a>
								</h2>
								<p class="text2">${nlist.newscontent.substring(0, 31)}...</p>
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