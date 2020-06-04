<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<title>隨心居 &mdash; 想住哪就住哪</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script src="<c:url value='/js/jquery-3.4.1.js' />"></script>

<!-- <link rel="stylesheet" href="css/jquery-ui.css"> -->
<!-- <link rel="stylesheet" href="css/mediaelementplayer.css"> -->
<!-- <link rel="stylesheet" href="css/fonts/icomoon/style.css"> -->
<!-- <link rel="stylesheet" href="css/magnific-popup.css"> -->
<!-- <link rel="stylesheet" href="css/bootstrap-datepicker.css"> -->
<!-- <link rel="stylesheet" href="css/fonts/flaticon/font/flaticon.css"> -->
<!-- <link rel="stylesheet" href="css/fl-bigmug-line.css"> -->
<!-- <link rel="stylesheet" href="css/aos.css"> -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/css_13/style_13.css">
<link rel="stylesheet" href="css/css_13/bootstrap.min.css">
<link rel="stylesheet" href="datatable/datatables.css">

</head>

<body>

	<div class="site-loader"></div>

	<div class="site-wrap">

		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<!-- .site-mobile-menu -->

		<div class="site-navbar mt-4">
			<!-- <div  style="background-color: black;"> -->
			<div class="container py-1">
				<div class="row align-items-center">
					<div class="col-8 col-md-8 col-lg-4">
						<h1 class="mb-0">
							<a href="index.html" class="text-white h2 mb-0"><strong>隨心居-想住哪就住哪<span
									class="text-danger">.</span></strong></a>
						</h1>
					</div>
					<div class="col-4 col-md-4 col-lg-8">
						<nav class="site-navigation text-right text-md-right"
							role="navigation">

							<div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
								<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
									class="icon-menu h3"></span></a>
							</div>

							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li><a href="buy.html">買賣房屋</a></li>
								<li><a href="news.html">地方新聞</a></li>
								<li><a href="＃">會員登入</a></li>
								<li><a href="mylove.html">我的收藏</a></li>
							</ul>
						</nav>
					</div>


				</div>
			</div>
		</div>
	</div>



	<div class="site-section site-section-sm pb-0"
		style="background-color: #333333;">
		<div class="container">
			<!-- <div class="container" style="background-color: black;"> -->
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">

					<form class="form-search col-md-12" name="myForm"
						action="<c:url value="/ShowSearchTwoTaipeiPage.do"/>"
						method="POST" style="background-color: #333333;">
						<div class="row  align-items-end">
							<div class="col-md-3">
								<label for="selectcity">選擇縣、市</label>
								<div class="select-wrap">
									<span class="i‵con icon-arrow_drop_down"></span> <select
										name="select_city" id="select_city"
										onChange="renew(this.selectedIndex);"
										class="form-control d-block rounded-0">
										<option value="">請選擇</option>
										<option value="Taipei">台北市</option>
										<option value="NewTaipei">新北市</option>
									</select>
								</div>
							</div>
							<div class="col-md-3">
								<label for="select-city">選擇區域</label>
								<div class="select-wrap">
									<span class="icon icon-arrow_drop_down"></span> <select
										name="selectcity" id="selectcity"
										class="form-control d-block rounded-0">
										<option>請先選擇縣、市</option>
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
			</div>

			<div class="row">
				<div class="col-md-12">
					<form id="totalbought" name="totalbought" action="<c:url value="/TotalBought.do"/>"
						method="POST">
						<span id="districtavg" name="districtavg"></span>&nbsp;目前搜尋範圍&nbsp;
						<select name="select_year" id="select_year"
							class="form-control d-block rounded-0">
							<option value="">請選擇</option>
							<option value="108">108</option>
							<option value="107">107</option>
							<option value="106">106</option>
						</select>&nbsp;年交易
						<c:forEach var='s' items='${lenandprice}' varStatus='vs'>
						<span id="tblength">${s.len}</span>件，平均每坪
						<span id="upricep">${s.price}</span>萬元。
						</c:forEach>
<!-- 					<div style="visibility:hidden" id="searchword" name="searchword"></div> -->
					</form>
					<div
						class="view-options bg-white py-3 px-3 d-md-flex align-items-center">
						<div class="ml-auto d-flex align-items-center">

							<div class="select-wrap">

								<table id="table1" 
									class="table table-striped table-hover table-bordered">
									<thead >
										<tr>
											<th>區</th>
											<th>位置</th>
											<th>總價</th>
											<th>單價</th>
											<th>建坪</th>
											<th>地坪</th>
											<th>交易日</th>
											<!--<th>移轉層次</th> -->
											<!--<th>總樓層數</th> -->
											<th>型態</th>
											<th>建築完成日期</th>
											<th>備註</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var='tp' items='${TwoTaipeiList}' varStatus='vs'>
											<tr>
												<td id=selecteddis>${tp.district}</td>
												<td>${tp.location}</td>
												<td><fmt:formatNumber value="${tp.tprice_s}"
														pattern="###,###.##" /> 萬元</td>
												<td><fmt:formatNumber value="${tp.uprice_p}"
														pattern="###,###.##" /> 萬元</td>
												<td>${tp.farea_p}坪</td>
												<td>${tp.landa_p}坪</td>
												<td>${tp.sdate}</td>
												<%--<td>${tp.sbuild}</td> --%>
												<%--<td>${tp.tbuild}</td> --%>
												<td>${tp.buildtype}</td>
												<td>${tp.fdate}</td>
												<td>${tp.rmnote}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 	<script type="text/javascript">onChange="renewlen()"</script> -->
 


	<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="mb-5">
						<h3 class="footer-heading mb-4">關於隨心居</h3>
						<p></p>
					</div>



				</div>
				<div class="col-lg-4 mb-5 mb-lg-0">
					<div class="row mb-5">
						<div class="col-md-12">
							<h3 class="footer-heading mb-4">Navigations</h3>
						</div>
						<div class="col-md-6 col-lg-6">
							<ul class="list-unstyled">
								<li><a href="#">關於我們</a></li>
								<li><a href="#">隱私條款</a></li>
								<li><a href="#">聯絡我們</a></li>
							</ul>
						</div>
					</div>


				</div>

				<div class="col-lg-4 mb-5 mb-lg-0">
					<h3 class="footer-heading mb-4">關注我們</h3>

					<div>
						<a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
						<a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
						<a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
						<a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
					</div>

				</div>

			</div>
			<div class="row pt-5 mt-5 text-center">
				<div class="col-md-12">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<!-- 						<script data-cfasync="false" -->
						<!-- 							src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script> -->
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart text-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">好家在</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>

			</div>
		</div>
	</footer>


	<!-- Bootstrap -->
<!-- 	<script src="js/bootstrap.min.js" type="text/javascript"></script> -->

	<!-- DATA TABES SCRIPT -->
<!-- 	<script src="js/jquery.dataTables.js" type="text/javascript"></script> -->
<!-- 	<script src="js/dataTables.bootstrap.js" type="text/javascript"></script> -->

	<script src="<c:url value='/js/aos.js' />"></script>
	<script src="<c:url value='/js/circleaudioplayer.js' />"></script>
	<script src="<c:url value='/js/datatableimport.js' />"></script>
	<script src="<c:url value='/js/selection.js' />"></script>
	<script src="<c:url value='/js/selectdis.js' />"></script>
	<script src="<c:url value='/js/main.js' />"></script>
	<script src="<c:url value='/js/jquery-ui.js' />"></script>
	<script src="<c:url value='/js/mediaelement-and-player.min.js' />"></script>
	<script src="<c:url value='/css/css_13/bootstrap.min.js' />"></script>
	<script src="<c:url value='/datatable/datatables.js' />"></script>
	<script src="<c:url value='/js/ajaxads.js' />"></script>
	<script src="<c:url value='/js/searchword.js' />"></script>
<%-- 	<script src="<c:url value='/js/owl.carousel.min.js' />"></script> --%>
<%-- 	<script src="<c:url value='/js/jquery.stellar.min.js' />"></script> --%>
<%-- 	<script src="<c:url value='/js/jquery.countdown.min.js' />"></script> --%>
<%-- 	<script src="<c:url value='/js/jquery.magnific-popup.min.js' />"></script> --%>
<%-- <script src="<c:url value='/js/popper.min.js' />"></script> --%>

</body>

</html>