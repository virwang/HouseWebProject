<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<title>隨心居 &mdash;想住哪就住哪</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="css/05_css/style.css">
<link rel="stylesheet" href="css/05_css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/05_css/magnific-popup.css">
<link rel="stylesheet" href="css/05_css/jquery-ui.css">
<link rel="stylesheet" href="css/05_css/owl.carousel.min.css">
<link rel="stylesheet" href="css/05_css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/05_css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/05_css/mediaelementplayer.css">
<link rel="stylesheet" href="css/05_css/animate.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/05_css/fl-bigmug-line.css">
<link rel="stylesheet" href="css/05_css/aos.css">
<link rel="stylesheet" href="css/05_css/style.css">
</head>

<body>

	<div class="site-loader"></div>


	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
	</div>

	<div class="site-section site-section-sm pb-0"
		style="background-color: #333333;">
		<div class="container">
			<!-- <div class="container" style="background-color: black;"> -->
			<div class="row">
				<form class="form-search col-md-12" name="myForm"
					action="<c:url value="ntpSearch.do"/>" method="POST"
					style="background-color: #333333;">
					<div class="row  align-items-end">
						<div class="col-md-3">
							<label for="selectcity">選擇縣、市</label>
							<div class="select-wrap">
								<span class="icon icon-arrow_drop_down"></span> <select
									name="select_city" id="select-city"
									onChange="renew(this.selectedIndex);"
									class="form-control d-block rounded-0">
									<option value="">請選擇</option>
									<option value="台北市">台北市</option>
									<option value="新北市">新北市</option>
								</select>
							</div>
						</div>

						<div class="col-md-3">
							<label for="select-city">選擇區域</label>
							<div class="select-wrap">
								<span class="icon icon-arrow_drop_down"></span> <select
									name="selectcity" id="select-city"
									class="form-control d-block rounded-0">
									<option value="">請先選擇縣、市</option>
								</select>
							</div>
						</div>

						<div class="col-md-3">
							<!-- search按鍵 -->
							<input type="submit"
								class="btn btn-success text-white btn-block rounded-0"
								value="搜尋">
						</div>

					</div>
				</form>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div
						class="view-options bg-white py-3 px-3 d-md-flex align-items-center">
						<div class="ml-auto d-flex align-items-center">

							<div class="select-wrap">
								<span class="icon icon-arrow_drop_down"></span>
								<table border="1" class="table table-striped">
									<thead>
										<tr>
											<th>行政區</th>
											<th>位置</th>
											<th>總價（元）</th>
											<th>每坪價格</th>
											<th>用途</th>
											<th>坪數</th>
											<th>車位</th>
											<th>建材</th>
											<th>建造完成日期</th>
										</tr>
									</thead>
									<c:forEach var='house' items='${ntp}' varStatus='vs'>
										<tr>
											<td>${house.district}</td>
											<td>${house.location}</td>
											<td>${house.tprice}</td>
											<td>${house.uprice*0.3025}</td>
											<td>${house.using}</td>
											<td>${house.square*0.3025}</td>
											<td>${house.parking}</td>
											<td>${house.constructor}</td>
											<td>${house.fdate}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
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
	<script src="js/circleaudioplayer.js"></script>
	<script src="js/selection.js"></script>
	<script src="js/main.js"></script>

</body>

</html>