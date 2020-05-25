<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Homeland &mdash; Colorlib Website Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/mediaelementplayer.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/fl-bigmug-line.css">


<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet" href="leaflet/leaflet.css" />
<script src="leaflet/leaflet.js"></script>

<style>
	#mapid{
		height:250px;
	}
</style>

</head>
<body>

	<div class="site-loader"></div>

	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
	</div>
	
	<div class="site-blocks-cover inner-page-cover overlay"
		 data-aos="fade"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row align-items-center justify-content-center text-center">
				<div class="col-md-10">
					<span
						class="d-inline-block text-white px-3 mb-3 property-offer-type rounded">Property
						Details of</span>
					<h1 class="mb-2">${housedt.title}</h1>
<!-- 					<p class="mb-5"> -->
<%-- 						<strong class="h2 text-success font-weight-bold">${housedt.totalprice}萬</strong> --%>
<!-- 					</p> -->
				</div>
			</div>
		</div>
	</div>

	<div class="site-section site-section-sm">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div>
						<div class="slide-one-item home-slider owl-carousel">
							<div>
								<img src="images/hero_bg_1.jpg" alt="Image" class="img-fluid">
							</div>
							<div>
								<img src="images/hero_bg_2.jpg" alt="Image" class="img-fluid">
							</div>
							<div>
								<img src="images/hero_bg_3.jpg" alt="Image" class="img-fluid">
							</div>
						</div>
					</div>
					<div
						class="bg-white property-body border-bottom border-left border-right">
						<div class="row mb-5">
							<div class="col-md-6">
								<strong class="text-success h1 mb-3">${housedt.totalprice}萬</strong>
							</div>
							<div class="col-md-6">
								<ul class="property-specs-wrap mb-3 mb-lg-0  float-lg-right">
<!-- 									<li><span class="property-specs">Beds</span> -->
<!-- 									<span class="property-specs-number">2 <sup>+</sup></span></li> -->
									<li><span class="property-specs">每坪(萬)</span>
									<span class="property-specs-number">${housedt.unitprice}</span></li>
									<li><span class="property-specs">坪數</span>
									<span class="property-specs-number">${housedt.ping}</span></li>

								</ul>
							</div>
						</div>
						<div class="row mb-5">
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text">社區</span>
								<strong class="d-block">${housedt.apartment}</strong>
							</div>
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text">地址</span>
								<strong class="d-block">${housedt.address}</strong>
							</div>
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text">擁有者</span>
								<strong class="d-block">${housedt.memberBean.name}(${housedt.memberBean.account})</strong>
							</div>
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text">連絡電話</span>
								<strong class="d-block">${housedt.memberBean.tel}</strong>
							</div>
							
						</div>
						<h2 class="h4 text-black">詳細資訊</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Assumenda aperiam perferendis deleniti vitae asperiores accusamus
							tempora facilis sapiente, quas! Quos asperiores alias fugiat sunt
							tempora molestias quo deserunt similique sequi.</p>
						<p>Nisi voluptatum error ipsum repudiandae, autem deleniti,
							velit dolorem enim quaerat rerum incidunt sed, qui ducimus!
							Tempora architecto non, eligendi vitae dolorem laudantium dolore
							blanditiis assumenda in eos hic unde.</p>
						<p>Voluptatum debitis cupiditate vero tempora error fugit
							aspernatur sint veniam laboriosam eaque eum, et hic odio
							quibusdam molestias corporis dicta! Beatae id magni, laudantium
							nulla iure ea sunt aliquam. A.</p>
						<h2 class="h4 text-black">地圖</h2><br>
						<div id="mapid">
						
						</div>
						<div class="row no-gutters mt-5">
							<div class="col-12">
								<h2 class="h4 text-black mb-3">圖片</h2>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_1.jpg" class="image-popup gal-item"><img
									src="images/img_1.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_2.jpg" class="image-popup gal-item"><img
									src="images/img_2.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_3.jpg" class="image-popup gal-item"><img
									src="images/img_3.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_4.jpg" class="image-popup gal-item"><img
									src="images/img_4.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_5.jpg" class="image-popup gal-item"><img
									src="images/img_5.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_6.jpg" class="image-popup gal-item"><img
									src="images/img_6.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_7.jpg" class="image-popup gal-item"><img
									src="images/img_7.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_8.jpg" class="image-popup gal-item"><img
									src="images/img_8.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_1.jpg" class="image-popup gal-item"><img
									src="images/img_1.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_2.jpg" class="image-popup gal-item"><img
									src="images/img_2.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_3.jpg" class="image-popup gal-item"><img
									src="images/img_3.jpg" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/img_4.jpg" class="image-popup gal-item"><img
									src="images/img_4.jpg" alt="Image" class="img-fluid"></a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4">

					<div class="bg-white widget border rounded">

						<h3 class="h4 text-black widget-title mb-3">預約看房</h3>
						<form action="" class="form-contact-agent">
							<div class="form-group">
								<label for="datepicker">日期</label>
								<input type="text" id="datepicker" class="form-control">
							</div>
							
							<div class="form-group">
								<label for="email">時段</label><br>
								<input type="radio" name="time" value="btd">08:00~10:00<br>
								<input type="radio" name="time" value="btd">10:00~12:00<br>
								<input type="radio" name="time" value="btd">14:00~16:00<br>
								<input type="radio" name="time" value="btd">16:00~18:00<br>
							</div>
							
							<div class="form-group">
								<input type="submit" id="send" class="btn btn-primary"
									value="提出申請">
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>

	<div class="site-section site-section-sm bg-light">
		<div class="container">

			<div class="row">
				<div class="col-12">
					<div class="site-section-title mb-5">
						<h2>更多物件</h2>
					</div>
				</div>
			</div>

			<div class="row mb-5">
				<div class="col-md-6 col-lg-4 mb-4">
					<div class="property-entry h-100">
						<a href="property-details.html" class="property-thumbnail">
							<div class="offer-type-wrap">
								<span class="offer-type bg-danger">Sale</span> <span
									class="offer-type bg-success">Rent</span>
							</div> <img src="images/img_1.jpg" alt="Image" class="img-fluid">
						</a>
						<div class="p-4 property-body">
							<a href="#" class="property-favorite"><span
								class="icon-heart-o"></span></a>
							<h2 class="property-title">
								<a href="property-details.html">625 S. Berendo St</a>
							</h2>
							<span class="property-location d-block mb-3"><span
								class="property-icon icon-room"></span> 625 S. Berendo St Unit
								607 Los Angeles, CA 90005</span> <strong
								class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
							<ul class="property-specs-wrap mb-3 mb-lg-0">
								<li><span class="property-specs">Beds</span> <span
									class="property-specs-number">2 <sup>+</sup></span></li>
								<li><span class="property-specs">Baths</span> <span
									class="property-specs-number">2</span></li>
								<li><span class="property-specs">SQ FT</span> <span
									class="property-specs-number">7,000</span></li>
							</ul>

						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-4 mb-4">
					<div class="property-entry h-100">
						<a href="property-details.html" class="property-thumbnail">
							<div class="offer-type-wrap">
								<span class="offer-type bg-danger">Sale</span> <span
									class="offer-type bg-success">Rent</span>
							</div> <img src="images/img_2.jpg" alt="Image" class="img-fluid">
						</a>
						<div class="p-4 property-body">
							<a href="#" class="property-favorite active"><span
								class="icon-heart-o"></span></a>
							<h2 class="property-title">
								<a href="property-details.html">871 Crenshaw Blvd</a>
							</h2>
							<span class="property-location d-block mb-3"><span
								class="property-icon icon-room"></span> 1 New York Ave, Warners
								Bay, NSW 2282</span> <strong
								class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
							<ul class="property-specs-wrap mb-3 mb-lg-0">
								<li><span class="property-specs">Beds</span> <span
									class="property-specs-number">2 <sup>+</sup></span></li>
								<li><span class="property-specs">Baths</span> <span
									class="property-specs-number">2</span></li>
								<li><span class="property-specs">SQ FT</span> <span
									class="property-specs-number">1,620</span></li>
							</ul>

						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-4 mb-4">
					<div class="property-entry h-100">
						<a href="property-details.html" class="property-thumbnail">
							<div class="offer-type-wrap">
								<span class="offer-type bg-info">Lease</span>
							</div> <img src="images/img_3.jpg" alt="Image" class="img-fluid">
						</a>
						<div class="p-4 property-body">
							<a href="#" class="property-favorite"><span
								class="icon-heart-o"></span></a>
							<h2 class="property-title">
								<a href="property-details.html">853 S Lucerne Blvd</a>
							</h2>
							<span class="property-location d-block mb-3"><span
								class="property-icon icon-room"></span> 853 S Lucerne Blvd Unit
								101 Los Angeles, CA 90005</span> <strong
								class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
							<ul class="property-specs-wrap mb-3 mb-lg-0">
								<li><span class="property-specs">Beds</span> <span
									class="property-specs-number">2 <sup>+</sup></span></li>
								<li><span class="property-specs">Baths</span> <span
									class="property-specs-number">2</span></li>
								<li><span class="property-specs">SQ FT</span> <span
									class="property-specs-number">5,500</span></li>
							</ul>

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
	<script src="js/circleaudioplayer.js"></script>
	<script src="js/house-detail.js"></script>

	<script src="js/main.js"></script>

</body>
</html>