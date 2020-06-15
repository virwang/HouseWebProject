<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Homeland &mdash; Colorlib Website Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500">
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

<style>
body {
	font-family: 微軟正黑體;
}
</style>
</head>

<body>

	<div class="site-loader"></div>


	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
	</div>

	<div class="slide-one-item home-slider owl-carousel">

		<div class="site-blocks-cover overlay" style="background-image: url(images/hero_bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
			<div class="container">
				<!-- <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-10">
              <span class="d-inline-block bg-success text-white px-3 mb-3 property-offer-type rounded">For Rent</span>
              <h1 class="mb-2">871 Crenshaw Blvd</h1>
              <p class="mb-5"><strong class="h2 text-success font-weight-bold">$2,250,500</strong></p>
              <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">See Details</a></p>
            </div>
          </div> -->
			</div>
		</div>



	</div>


	<div class="site-section site-section-sm pb-0">
		<div class="container">
			<div class="row">
				<form class="form-search col-md-12" style="margin-top: -100px;" method="post" action="<c:url value='searchhouse'/>">
					<div class="row  align-items-end">
						<div class="col-md-3">
							<label for="city">市</label>
							<div class="select-wrap">
								<span class="icon icon-arrow_drop_down"></span>
								<select name="city" id="city" class="form-control d-block rounded-0" onChange="clickcity(this)">
									<option selected hidden>請選擇市</option>
									<option value="台北市">台北市</option>
									<option value="新北市">新北市</option>
								</select>
							</div>
						</div>
						<div class="col-md-3">
							<label for="dist">區</label>
							<div class="select-wrap">
								<span class="icon icon-arrow_drop_down"></span>
								<select name="dist" id="dist" class="form-control d-block rounded-0">
									<option selected hidden>請先選擇市</option>
								</select>
							</div>
						</div>
						<div class="col-md-3">
							<label for="addr">地址</label>
							<div class="select-wrap">
								<input type="text" name="addr" id="addr" class="form-control d-block rounded-0" placeholder="請輸入詳細地址">
							</div>
						</div>
						<div class="col-md-3">
							<div class="select-wrap">
								<input type="submit" class="btn btn-success text-white btn-block rounded-0 " value="查詢">
							</div>
						</div>
					</div>
					<!-- 					<div class="row  align-items-end"> -->
					<!-- 						<div class="col-md-3"> -->
					<!-- 							<label for="amount">價錢範圍:</label> -->
					<!-- 							<input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold; background-color: transparent;"> -->
					<!-- 							<div id="slider-range"></div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
				</form>

			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="view-options bg-white py-3 px-3 d-md-flex align-items-center">
						<div class="mr-auto">
							<a href="houselist" class="view-list px-3 border-right active">All</a>
							<!-- <a href="view-list.html" class="icon-view view-list"><span class="icon-view_list"></span></a> -->

						</div>
						<!-- 						<div class="ml-auto d-flex align-items-center"> -->
						<!-- 							<div> -->
						<%--  								<a href="<c:url value='newhouse'/>" class="view-list px-3 border-right">新增物件</a> --%>
						<!-- 								<a href="buy.jsp" class="view-list px-3 border-right active">All</a> -->
						<!--                  			<a href="#" class="view-list px-3">Sale</a> -->
						<!-- 							</div> -->


						<!-- <div class="select-wrap">
                  <span class="icon icon-arrow_drop_down"></span>
                  <select class="form-control form-control-sm d-block rounded-0">
                    <option value="">Sort by</option>
                    <option value="">Price Ascending</option>
                    <option value="">Price Descending</option>
                  </select>
                </div> -->

						<!-- 						</div> -->
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="site-section site-section-sm bg-light">
		<div class="container">


			<div class="row mb-5">
				<c:forEach var="hlist" items="${houselist}">

					<div class="col-md-6 col-lg-4 mb-4">
						<div class="property-entry h-100">
							<a href="housedetail?HOUSEID=${hlist.id}" class="property-thumbnail">
								<div class="offer-type-wrap">
									<span class="offer-type bg-danger">Sale</span>
								</div>
								<img src="data:image/jpeg;base64,${hlist.base64image1}" alt="Image" class="img-fluid">
							</a>

							<div class="p-4 property-body">
								<c:if test="${!empty memberBean}">
									<c:set var="activeStatus" value="" />
									<c:forEach var="f" items="${fh}">
										<c:if test="${hlist.id == f.houseBean.id}">
											<c:set var="activeStatus" value="active" />
										</c:if>
									</c:forEach>
									<a type="button" class="property-favorite fah ${activeStatus}" id="${hlist.id}">
										<span class="icon-heart-o"></span>
									</a>

								</c:if>
								<a href="housedetail?HOUSEID=${hlist.id}">
									<h2 class="property-title">${hlist.title}
										<c:forEach var="ppath" items="${path}">
											<%-- 								<P>${path[0]}</P> --%>
											<c:if test="${hlist.id == ppath[0]}">
												<i style='font-size: 35px; color: goldenrod;' class='fas'>&#xf521;</i>
											</c:if>
										</c:forEach>
									</h2>
								</a>
								<span class="property-location d-block mb-3">
									<span class="property-icon icon-room"></span>${hlist.city}${hlist.dist}${hlist.address}</span>
								<strong class="property-price text-primary mb-3 d-block text-success">${hlist.totalprice}萬 </strong>
						
								<ul class="property-specs-wrap mb-3 mb-lg-0">
									<li>
										<span class="property-specs">坪數</span>
										<span class="property-specs-number">${hlist.ping}</span>
									</li>
									<li>
										<span class="property-specs">每坪(萬)</span>
										<span class="property-specs-number">${hlist.unitprice}</span>
									</li>

								</ul>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>



			<!--         <div class="row"> -->
			<!--           <div class="col-md-12 text-center"> -->
			<!--             <div class="site-pagination"> -->
			<!--               <a href="#" class="active">1</a> -->
			<!--               <a href="#">2</a> -->
			<!--               <a href="#">3</a> -->
			<!--               <a href="#">4</a> -->
			<!--               <a href="#">5</a> -->
			<!--               <span>...</span> -->
			<!--               <a href="#">10</a> -->
			<!--             </div> -->
			<!--           </div>   -->
			<!--         </div> -->

		</div>
	</div>


	<jsp:include page="/footer.jsp" />



	</div>

	<script>
		function clickcity(clicked) {
			let ctvl = clicked.value;
			let dist = document.getElementById("dist");
			let tpdt = [ "全區", "北投區", "士林區", "內湖區", "中山區", "松山區", "大同區", "萬華區",
					"中正區", "大安區", "信義區", "南港區", "文山區" ];
			let ntpdt = [ "全區", "板橋區", "中和區", "新莊區", "土城區", "汐止區", "鶯歌區",
					"淡水區", "五股區", "林口區", "深坑區", "坪林區", "石門區", "萬里區", "雙溪區",
					"烏來區", "三重區", "永和區", "新店區", "蘆洲區", "樹林區", "三峽區", "瑞芳區",
					"泰山區", "八里區", "石碇區", "三芝區", "金山區", "平溪區", "貢寮區" ];
			if (ctvl == "台北市") {
				dist.options.length = 0;
				for (let x = 0; x < tpdt.length; x++) {
					dist.add(new Option(tpdt[x], tpdt[x]));
				}
			}
			if (ctvl == "新北市") {
				dist.options.length = 0;
				for (let y = 0; y < ntpdt.length; y++) {
					dist.add(new Option(ntpdt[y], ntpdt[y]));
				}
			}
		}
	</script>
	<script>
		function search() {
			let city = document.getElementById("city").value;
			let dist = document.getElementById("dist").value;
			console.log(city);
			console.log(dist);

			let xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='searchhouse'/>" + "?city=" + city
					+ "&dist=" + dist, true);
			xhr.send();
			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {

				}
			}
		}
	</script>



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
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<script>
		$(".fah").click(function() {
			console.log(this.id);
			var hid = this.id;

			$.ajax({
				method : "Get",
				dataType : "json",
				url : "<c:url value='/houselist.do' />",
				data : {
					"houseId" : hid
				},
				success : function(res) {
					if (res.success != null) {
						$('#' + hid).addClass("active");
						alert("新增成功");
					} else if (res.error != null) {
						alert("已收藏不可重複");
					}
				},
				error : function(ex) {
					alert("錯誤")
				}
			})

		})
	</script>
	<script>
		$(function() {
			$("#slider-range").slider(
					{
						range : true,
						min : 1000,
						max : 15000,
						values : [ 1000, 1000 ],
						slide : function(event, ui) {
							$("#amount").val(
									ui.values[0] + "萬" + " - " + ui.values[1]
											+ "萬");
						}
					});
			$("#amount").val(
					$("#slider-range").slider("values", 0) + "萬" + " - "
							+ $("#slider-range").slider("values", 1) + "萬");
		});
	</script>

</body>
</html>