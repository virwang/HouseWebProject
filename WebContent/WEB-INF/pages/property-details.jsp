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
		 data-aos="fade"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row align-items-center justify-content-center text-center">
				<div class="col-md-10">
<!-- 					<span -->
<!-- 						class="d-inline-block text-white px-3 mb-3 property-offer-type rounded">Property -->
<!-- 						Details of</span> -->
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
<!-- 								<a href="images/hero_bg_1.jpg" class="image-popup gal-item"> -->
									<img src="data:image/jpeg;base64,${housedt.base64image1}" alt="Image1" class="img-fluid">
<!-- 								</a> -->
							</div>
							<div>
<!-- 								<a href="images/hero_bg_2.jpg" class="image-popup gal-item"> -->
									<img src="data:image/jpeg;base64,${housedt.base64image2}" alt="Image1" class="img-fluid">
<!-- 								</a> -->
							</div>
							<div>
<!-- 								<a href="images/hero_bg_3.jpg" class="image-popup gal-item"> -->
									<img src="data:image/jpeg;base64,${housedt.base64image3}" alt="Image3" class="img-fluid">
<!-- 								</a> -->
							</div>
						</div>
					</div>
					<div
						class="bg-white property-body border-bottom border-left border-right">
						<div class="row mb-5">
							<div class="col-md-6">
								<strong class="text-success h1 mb-3">${housedt.totalprice}萬</strong>
							</div>
							<div class="col-md-6" style="font-size:30px;">
								<ul class="property-specs-wrap mb-3 mb-lg-0  float-lg-right"  style="text-align:right;">
<!-- 									<li><span class="property-specs">Beds</span> -->
<!-- 									<span class="property-specs-number">2 <sup>+</sup></span></li> -->
									<li><span class="property-specs" style="font-size:18px;">每坪(萬)</span>
									<span class="property-specs-number">${housedt.unitprice}</span></li>
									<c:forEach var="ppath" items="${path}">
											<%-- 								<P>${path[0]}</P> --%>
											<c:if test="${hlist.id == ppath[0]}">
												<i style='font-size: 35px; color: goldenrod;' class='fas'>&#xf521;</i>
											</c:if>
									</c:forEach>
									<li><span class="property-specs" style="font-size:18px;">坪數</span>
									<span class="property-specs-number">${housedt.ping}</span></li>
									<li><span class="property-specs" style="font-size:18px;">觀看次數</span>
									<span class="property-specs-number" id="hcount">${hcount}</span></li>

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
								<strong class="d-block">${housedt.city}${housedt.dist}${housedt.address}</strong>
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
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text">房/廳/衛</span>
								<strong class="d-block">${housedt.room}/${housedt.hall}/${housedt.bath}</strong>
							</div>
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text">臨近捷運站</span>
								<strong class="d-block">${housedt.mrtBean.stationname}站</strong>
							</div>
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text">上架時間</span>
								<strong class="d-block">${housedt.addDate}</strong>
							</div>
							
						</div>
<!-- 						<h2 class="h4 text-black">詳細資訊</h2> -->
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
<!-- 							Assumenda aperiam perferendis deleniti vitae asperiores accusamus -->
<!-- 							tempora facilis sapiente, quas! Quos asperiores alias fugiat sunt -->
<!-- 							tempora molestias quo deserunt similique sequi.</p> -->
<!-- 						<p>Nisi voluptatum error ipsum repudiandae, autem deleniti, -->
<!-- 							velit dolorem enim quaerat rerum incidunt sed, qui ducimus! -->
<!-- 							Tempora architecto non, eligendi vitae dolorem laudantium dolore -->
<!-- 							blanditiis assumenda in eos hic unde.</p> -->
<!-- 						<p>Voluptatum debitis cupiditate vero tempora error fugit -->
<!-- 							aspernatur sint veniam laboriosam eaque eum, et hic odio -->
<!-- 							quibusdam molestias corporis dicta! Beatae id magni, laudantium -->
<!-- 							nulla iure ea sunt aliquam. A.</p> -->
						<h2 class="h4 text-black">地圖</h2><br>
						
						<div id="mapid">
						</div>
						
					</div>
				</div>
				
				<div class="col-lg-4">

					<div class="bg-white widget border rounded">

						<h3 class="h4 text-black widget-title mb-3">預約看房</h3>
						<form method="POST" class="form-contact-agent">
							<div class="form-group">
								<label for="datepicker">日期</label>
								<input type="text" name="date" id="datepicker" class="form-control" autocomplete="off" required>
							</div>
							
							<div class="form-group">
								<label for="time">時段</label><br>
								<input type="radio" name="time" value="08:00-10:00">08:00-10:00<br>
								<input type="radio" name="time" value="10:00-12:00">10:00-12:00<br>
								<input type="radio" name="time" value="14:00-16:00">14:00-16:00<br>
								<input type="radio" name="time" value="16:00-18:00">16:00-18:00<br>
							</div>
							
							<div class="form-group">
								<input type="hidden" id="hid" name="hid" value="${housedt.id}">
								<button type="button" id="send" class="btn btn-primary" onclick="reserv()">提出申請</button>
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>

<!-- 	<div class="site-section site-section-sm bg-light"> -->
<!-- 		<div class="container"> -->

<!-- 			<div class="row"> -->
<!-- 				<div class="col-12"> -->
<!-- 					<div class="site-section-title mb-5"> -->
<!-- 						<h2>更多物件</h2> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="row mb-5"> -->
<!-- 				<div class="col-md-6 col-lg-4 mb-4"> -->
<!-- 					<div class="property-entry h-100"> -->
<!-- 						<a href="property-details.html" class="property-thumbnail"> -->
<!-- 							<div class="offer-type-wrap"> -->
<!-- 								<span class="offer-type bg-danger">Sale</span> <span -->
<!-- 									class="offer-type bg-success">Rent</span> -->
<!-- 							</div> <img src="images/img_1.jpg" alt="Image" class="img-fluid"> -->
<!-- 						</a> -->
<!-- 						<div class="p-4 property-body"> -->
<!-- 							<a href="#" class="property-favorite"><span -->
<!-- 								class="icon-heart-o"></span></a> -->
<!-- 							<h2 class="property-title"> -->
<!-- 								<a href="property-details.html">625 S. Berendo St</a> -->
<!-- 							</h2> -->
<!-- 							<span class="property-location d-block mb-3"><span -->
<!-- 								class="property-icon icon-room"></span> 625 S. Berendo St Unit -->
<!-- 								607 Los Angeles, CA 90005</span> <strong -->
<!-- 								class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong> -->
<!-- 							<ul class="property-specs-wrap mb-3 mb-lg-0"> -->
<!-- 								<li><span class="property-specs">Beds</span> <span -->
<!-- 									class="property-specs-number">2 <sup>+</sup></span></li> -->
<!-- 								<li><span class="property-specs">Baths</span> <span -->
<!-- 									class="property-specs-number">2</span></li> -->
<!-- 								<li><span class="property-specs">SQ FT</span> <span -->
<!-- 									class="property-specs-number">7,000</span></li> -->
<!-- 							</ul> -->

<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="col-md-6 col-lg-4 mb-4"> -->
<!-- 					<div class="property-entry h-100"> -->
<!-- 						<a href="property-details.html" class="property-thumbnail"> -->
<!-- 							<div class="offer-type-wrap"> -->
<!-- 								<span class="offer-type bg-danger">Sale</span> <span -->
<!-- 									class="offer-type bg-success">Rent</span> -->
<!-- 							</div> <img src="images/img_2.jpg" alt="Image" class="img-fluid"> -->
<!-- 						</a> -->
<!-- 						<div class="p-4 property-body"> -->
<!-- 							<a href="#" class="property-favorite active"><span -->
<!-- 								class="icon-heart-o"></span></a> -->
<!-- 							<h2 class="property-title"> -->
<!-- 								<a href="property-details.html">871 Crenshaw Blvd</a> -->
<!-- 							</h2> -->
<!-- 							<span class="property-location d-block mb-3"><span -->
<!-- 								class="property-icon icon-room"></span> 1 New York Ave, Warners -->
<!-- 								Bay, NSW 2282</span> <strong -->
<!-- 								class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong> -->
<!-- 							<ul class="property-specs-wrap mb-3 mb-lg-0"> -->
<!-- 								<li><span class="property-specs">Beds</span> <span -->
<!-- 									class="property-specs-number">2 <sup>+</sup></span></li> -->
<!-- 								<li><span class="property-specs">Baths</span> <span -->
<!-- 									class="property-specs-number">2</span></li> -->
<!-- 								<li><span class="property-specs">SQ FT</span> <span -->
<!-- 									class="property-specs-number">1,620</span></li> -->
<!-- 							</ul> -->

<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="col-md-6 col-lg-4 mb-4"> -->
<!-- 					<div class="property-entry h-100"> -->
<!-- 						<a href="property-details.html" class="property-thumbnail"> -->
<!-- 							<div class="offer-type-wrap"> -->
<!-- 								<span class="offer-type bg-info">Lease</span> -->
<!-- 							</div> <img src="images/img_3.jpg" alt="Image" class="img-fluid"> -->
<!-- 						</a> -->
<!-- 						<div class="p-4 property-body"> -->
<!-- 							<a href="#" class="property-favorite"><span -->
<!-- 								class="icon-heart-o"></span></a> -->
<!-- 							<h2 class="property-title"> -->
<!-- 								<a href="property-details.html">853 S Lucerne Blvd</a> -->
<!-- 							</h2> -->
<!-- 							<span class="property-location d-block mb-3"><span -->
<!-- 								class="property-icon icon-room"></span> 853 S Lucerne Blvd Unit -->
<!-- 								101 Los Angeles, CA 90005</span> <strong -->
<!-- 								class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong> -->
<!-- 							<ul class="property-specs-wrap mb-3 mb-lg-0"> -->
<!-- 								<li><span class="property-specs">Beds</span> <span -->
<!-- 									class="property-specs-number">2 <sup>+</sup></span></li> -->
<!-- 								<li><span class="property-specs">Baths</span> <span -->
<!-- 									class="property-specs-number">2</span></li> -->
<!-- 								<li><span class="property-specs">SQ FT</span> <span -->
<!-- 									class="property-specs-number">5,500</span></li> -->
<!-- 							</ul> -->

<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<jsp:include page="/footer.jsp" />

<!-- 	</div> -->
	
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
<!-- 	<script src="js/map-detail.js"></script> -->
	<script src="js/calender.js"></script>

	<script src="js/main.js"></script>
	
	<script>
	var date = new Date();
	var today = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	$(document).ready(function(){
		let count = ${hcount};
		$.ajax({
		    url: "<c:url value='/counthit'/>",
		    type: 'POST',
		    data: {
		    	"htid" : ${housedt.id},
		    	"count" : count
		    } })
	})
	
	function reserv() {
		<c:if test="${!empty memberBean}">
		let time = document.querySelector('input[name="time"]:checked').value;
		let date = document.getElementById("datepicker");
		let datev = date.value;
		let hid = document.getElementById("hid").value;
		let xhr2 = new XMLHttpRequest();
		xhr2.open("POST","<c:url value='newapplication'/>",true);
		xhr2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr2.send("hid="+hid+"&date="+datev+"&time="+time);
		xhr2.onreadystatechange=function(){
			if(xhr2.readyState==4&&xhr2.status==200){
				let resv =JSON.parse(xhr2.responseText);
				if(resv.status=="success"){
					alert("預約申請成功");
				}else{
					alert("預約申請失敗");
				}
				datev="";
			}
		
		};
		</c:if>
		<c:if test="${empty memberBean}">
			location.href = "<c:url value='login'/>";
		</c:if>
	}

	$('#datepicker').datepicker({
	    "format" : 'yyyy-mm-dd',
	    "startDate" : today,
	    "autoclose" : true
	});

	
	//讀取捷運站點
	window.onload= function(){

		
	var mrtData = [];
	let map = L.map('mapid',{
	    center:[${housedt.lat}, ${housedt.lon}],
	    zoom:14
	});
	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
	    attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	}).addTo(map);
	let marker = L.marker([${housedt.lat},${housedt.lon}]).addTo(map);
	marker.bindPopup("<b>${housedt.title}</b><br>${housedt.city}${housedt.dist}${housedt.address}").openPopup();
	let xhr = new XMLHttpRequest();
	xhr.open("GET","<c:url value='searchmapjson'/>",true);
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4&&xhr.status==200){
			let mrtlist =JSON.parse(xhr.responseText);
			for(let i=0;i<mrtlist.length;i++){
				var mrtpoint = L.circle([mrtlist[i].lat,mrtlist[i].lon], {
				    color: 'white',
				    fillColor: '#f03',
				    fillOpacity: 0.5,
				    radius: 50
				}).addTo(map);
			}

		}
	
	};

	
	//捷運文湖線
	let BRLines = [{
	    "type": "LineString",
	    "coordinates": [
	    [121.57981,24.998282],
	    [121.573418,24.998189],
	    [121.568307,24.998664],
	    [121.557849,24.999349],
	    [121.556875,25.00508],
	    [121.558392,25.018343],
	    [121.552814,25.023746],
	    [121.543613,25.026109],
	    [121.543973,25.033134],
	    [121.543326,25.041492],
	    [121.544295,25.052028],
	    [121.543942,25.060776],
	    [121.551946,25.063194],
	    [121.546619,25.079576],
	    [121.55395,25.084129],
	    [121.567304,25.082017],
	    [121.575516,25.080153],
	    [121.584616,25.078329],
	    [121.594238,25.083787],
	    [121.602626,25.08338],
	    [121.607114,25.072577],
	    [121.611604,25.067167],
	    [121.616061,25.060047],
	    [121.617613,25.055351],
	    ]
	}];
	var BRStyle = {
	    "color": "#9F5000",
	    "weight": 5,
	    "opacity": 0.65
	};
	L.geoJSON(BRLines, {
	    style: BRStyle
	}).addTo(map);

	//捷運淡水信義線
	let RLines = [{
	    "type": "LineString",
	    "coordinates": [
	    [121.57,25.032464],
	    [121.563709,25.032704],
	    [121.551996,25.033037],
	    [121.542337,25.033207],
	    [121.536566,25.033252],
	    [121.529439,25.033693],
	    [121.518085,25.032578],
	    [121.515793,25.040942],
	    [121.517665,25.047068],
	    [121.520266,25.052442],
	    [121.52055,25.057797],
	    [121.519486,25.062635],
	    [121.520064,25.070773],
	    [121.525165,25.083574],
	    [121.526266,25.092369],
	    [121.52263,25.102162],
	    [121.51913,25.109303],
	    [121.515171,25.115006],
	    [121.506413,25.120863],
	    [121.500948,25.126152],
	    [121.498136,25.132122],
	    [121.503383,25.137048],
	    [121.498136,25.132122],
	    [121.485312,25.137682],
	    [121.473239,25.131175],
	    [121.467239,25.125895],
	    [121.4596753,25.13697113],
	    [121.4590104,25.1544886],
	    [121.4455543,25.16823193],
	    ]
	}];

	var RStyle = {
	    "color": "#FF0000",
	    "weight": 5,
	    "opacity": 0.65
	};

	L.geoJSON(RLines, {
	    style: RStyle
	}).addTo(map);

	//捷運松山信義線
	let GLines = [{
	    "type": "LineString",
	    "coordinates": [
	    [121.537768,24.957888],
	    [121.541099,24.967454],
	    [121.543113,24.975013],
	    [121.529914,24.973113],
	    [121.543113,24.975013],
	    [121.541457,24.983615],
	    [121.540663,24.99318],
	    [121.538522,25.002547],
	    [121.534193,25.014575],
	    [121.52769,25.02061],
	    [121.523252,25.02556],
	    [121.518085,25.032578],
	    [121.511048,25.035275],
	    [121.508736,25.041803],
	    [121.510162,25.049556],
	    [121.519382,25.053025],
	    [121.532728,25.052743],
	    [121.544295,25.052028],
	    [121.552505,25.05143],
	    [121.564701,25.051657],
	    [121.577851,25.05054],
	    ]
	}];

	var GStyle = {
	    "color": "	#006000",
	    "weight": 5,
	    "opacity": 0.65
	};

	L.geoJSON(GLines, {
	    style: GStyle
	}).addTo(map);

	//捷運中和新蘆線
	let OLines = [{
	    "type": "LineString",
	    "coordinates": [
	    [121.509743,24.98961],
	    [121.504567,24.993764],
	    [121.510952,25.002364],
	    [121.51549,25.013021],
	    [121.523252,25.02556],
	    [121.529439,25.033693],
	    [121.533119,25.042058],
	    [121.532728,25.052743],
	    [121.532809,25.060515],
	    [121.526854,25.062832],
	    [121.519486,25.062635],
	    [121.513126,25.063229],
	    [121.49685,25.070565],
	    [121.486525,25.077063],
	    [121.479849,25.080471],
	    [121.472667,25.085687],
	    [121.464707,25.091377],
	    [121.472667,25.085687],
	    [121.479849,25.080471],
	    [121.486525,25.077063],
	    [121.49685,25.070565],
	    [121.513126,25.063229],
	    [121.500907,25.06323],
	    [121.49132,25.059574],
	    [121.484491,25.055649],
	    [121.471568,25.046514],
	    [121.460733,25.039628],
	    [121.452492,25.036364],
	    [121.435106,25.032974],
	    [121.42221,25.028961],
	    [121.410871,25.021664],
	    ]
	}];

	var OStyle = {
	    "color": "#FF9224",
	    "weight": 5,
	    "opacity": 0.65
	};

	L.geoJSON(OLines, {
	    style: OStyle
	}).addTo(map);

	//捷運板南線
	let BLLines = [{
	    "type": "LineString",
	    "coordinates": [
	    [121.419574,24.959567],
	    [121.43559,24.96609],
	    [121.443752,24.972786],
	    [121.4494847,24.98661959],
	    [121.452955,24.999374],
	    [121.458555,25.008034],
	    [121.462264,25.013961],
	    [121.46813,25.024205],
	    [121.472211,25.029575],
	    [121.499448,25.035885],
	    [121.508736,25.041803],
	    [121.517665,25.047068],
	    [121.523519,25.044597],
	    [121.533119,25.042058],
	    [121.544952,25.041776],
	    [121.551692,25.041298],
	    [121.55786,25.041159],
	    [121.564775,25.040956],
	    [121.576494,25.041025],
	    [121.583029,25.045311],
	    [121.593766,25.050616],
	    [121.606488,25.051872],
	    [121.616822,25.054875],
	    ]
	}];

	var BLStyle = {
	    "color": "#005AB5",
	    "weight": 5,
	    "opacity": 0.65
	};

	L.geoJSON(BLLines, {
	    style: BLStyle
	}).addTo(map);

	//捷運環狀線
	let YLines = [{
	    "type": "LineString",
	    "coordinates": [
	    [121.541457,24.983615],
	    [121.5276,24.984655],
	    [121.524837,24.990645],
	    [121.515774,24.991998],
	    [121.504567,24.993764],
	    [121.49651,25.002227],
	    [121.49035,25.004828],
	    [121.484147,25.008386],
	    [121.472455,25.01424],
	    [121.464812,25.015233],
	    [121.466946,25.025862],
	    [121.460507,25.039866],
	    [121.460254,25.049945],
	    [121.459606,25.061494],
	    ]
	}];

	var YStyle = {
	    "color": "#F2FF00",
	    "weight": 5,
	    "opacity": 0.65
	};

	L.geoJSON(YLines, {
	    style: YStyle
	}).addTo(map);
	};

    </script>

</body>
</html>