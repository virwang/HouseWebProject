<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/05_css/style.css">
<link rel="stylesheet" href="css/05_css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
<link rel="stylesheet" href="css/05_css/button.css">
<link rel="stylesheet" href="css/05_css/addFavoriteButton.css">



<title>Show Favorite</title>
</head>
<body style="font-family: Microsoft JhengHei;">
	<div class="site-loader"></div>
	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
	</div>
	<div class="site-section site-section-sm pb-0" style="background-color: #333333;">
		<div class="container">
			<div id="favorite" class="row">
				<form class="form-search col-md-12" style="background-color: transparent" name="myForm" action="<c:url value="favorite" />"></form>
			</div>
			<div class="container" style="background-color: white;">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="card">
							<h3 class="card-header text-center font-weight-bold text-uppercase py-4">
								<a style="color: #A52A2A;" href="<c:url value='showMemberData?=${favorite.memberBean.pk}'/>">${memberBean.name}</a> 的收藏
							</h3>
							<div class="card-body" style="text-align: center">
								<p style="color: #A52A2A; font-family: Microsoft JhengHei; font-size: 40px">${memberBean.name}你還沒有收藏<i class='fas fa-heart-broken' style="font-size: 48px; color: red;"> </i> <br>
									<%-- 									<img src="${pageContext.request.contextPath}/images/test.jpg" alt="imges"/> --%>
									<!-- 								<a class="button" onclick="javascript:location.href='houselist'" -->
									<!-- 									style="font-family: Microsoft JhengHei; color: #FFFAF0;">新增我的最愛</a> -->
									<button class="button" style='font-family: Microsoft JhengHei; color: #FFFAF0; font-size: 24px' onclick="javascript:location.href='houselist'">新增我的最愛</button>
<!-- 									<button style='font-size: 24px; font-family: Microsoft JhengHei; float: right; background-color: orange; border: 2px none;' id="showsexy">顯示熱門收藏</button> -->
<!-- 								<div id="sexy" style="display: none;"> -->
<!-- 									<p style="text-align: center; font-size: 30px; dispaly: none;" id="hot">熱門收藏排名</p> -->
<!-- 									<table style="text-align: center" class="table table-striped table-bordered"> -->
<!-- 										<thead> -->
<!-- 											<tr> -->
<!-- 												<th>排名</th> -->
<!-- 												<th>標題</th> -->
<!-- 												<th>行政區</th> -->
<!-- 												<th>位置</th> -->
<!-- 												<th>總價</th> -->
<!-- 											</tr> -->
<!-- 										</thead> -->
<!-- 										<tbody> -->
<!-- 											<tr> -->
<!-- 												<td>1</td> -->
<%-- 												<td>${path[0][2]}</td> --%>
<%-- 												<td>${path[0][4]}</td> --%>
<%-- 												<td>${path[0][5]}</td> --%>
<%-- 												<td>${path[0][3]}</td> --%>
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td>2</td> -->
<%-- 												<td>${path[1][2]}</td> --%>
<%-- 												<td>${path[1][4]}</td> --%>
<%-- 												<td>${path[1][5]}</td> --%>
<%-- 												<td>${path[1][3]}</td> --%>
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td>3</td> -->
<%-- 												<td>${path[2][2]}</td> --%>
<%-- 												<td>${path[2][4]}</td> --%>
<%-- 												<td>${path[2][5]}</td> --%>
<%-- 												<td>${path[2][3]}</td> --%>
<!-- 											</tr> -->
<!-- 										</tbody> -->
<!-- 									</table> -->
<!-- 								</div> -->
							</div>


							<!-- 							<div id="sexy" style="display: none;"> -->
							<!-- 								<p style="text-align: center; font-size: 30px; dispaly: none;" id="hot">熱門收藏排名</p> -->
							<!-- 								<table style="text-align: center" class="table table-striped table-bordered" id="thot"> -->
							<!-- 									<thead> -->
							<!-- 										<tr> -->
							<!-- 											<th>排名</th> -->
							<!-- 											<th>標題</th> -->
							<!-- 											<th>行政區</th> -->
							<!-- 											<th>位置</th> -->
							<!-- 											<th>總價</th> -->
							<!-- 										</tr> -->
							<!-- 									</thead> -->
							<!-- 									<tbody> -->
							<!-- 										<tr> -->
							<!-- 											<td>1</td> -->
							<%-- 											<td>${path[0][2]}</td> --%>
							<%-- 											<td>${path[0][4]}</td> --%>
							<%-- 											<td>${path[0][5]}</td> --%>
							<%-- 											<td>${path[0][3]}</td> --%>
							<!-- 										</tr> -->
							<!-- 										<tr> -->
							<!-- 											<td>2</td> -->
							<%-- 											<td>${path[1][2]}</td> --%>
							<%-- 											<td>${path[1][4]}</td> --%>
							<%-- 											<td>${path[1][5]}</td> --%>
							<%-- 											<td>${path[1][3]}</td> --%>
							<!-- 										</tr> -->
							<!-- 										<tr> -->
							<!-- 											<td>3</td> -->
							<%-- 											<td>${path[2][2]}</td> --%>
							<%-- 											<td>${path[2][4]}</td> --%>
							<%-- 											<td>${path[2][5]}</td> --%>
							<%-- 											<td>${path[2][3]}</td> --%>
							<!-- 										</tr> -->
							<!-- 									</tbody> -->
							<!-- 								</table> -->
							<!-- 							</div> -->
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
	<script src="js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</body>
</html>