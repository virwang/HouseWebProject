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

<script src="<c:url value='js/jquery-3.4.1.js' />"></script>
<script src="<c:url value='js/popper.min.js' />"></script>
<link href="css/datatables.css" rel="stylesheet">
<link rel="stylesheet" href="css/css_13/style_13.css">
<link rel="stylesheet" href="css/css_13/bootstrap.min.css">
<link rel="stylesheet" href="css/fonts/icomoon/style.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/mediaelementplayer.css">
<link rel="stylesheet" href="css/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/fl-bigmug-line.css">
<link rel="stylesheet" href="css/aos.css">
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
									<span class="icon icon-arrow_drop_down"></span> <select
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

<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-12"> -->
<!-- 					<div id="totalbought" -->
<%-- 						action="<c:url value="/TotalBought.do"/>" --%>
<!-- 						method="POST"> -->
<!-- 						<span>XX區，近X年交易XX件，平均每坪XX萬元。</span> -->
<!-- 					</div> -->
<!-- 					<div -->
<!-- 						class="view-options bg-white py-3 px-3 d-md-flex align-items-center"> -->
<!-- 						<div class="ml-auto d-flex align-items-center"> -->

<!-- 							<div class="select-wrap"> -->

<!-- 								<table border="1" id="table1" -->
<!-- 									class="table table-bordered table-striped"> -->
<!-- 									<thead> -->
<!-- 										<tr> -->
<!-- 											<th>區</th> -->
<!-- 											<th>位置</th> -->
<!-- 											<th>總價</th> -->
<!-- 											<th>單價</th> -->
<!-- 											<th>建坪</th> -->
<!-- 											<th>地坪</th> -->
<!-- 											<th>交易日</th> -->
<!-- 											<th>移轉層次</th> -->
<!-- 											<th>總樓層數</th> -->
<!-- 											<th>型態</th> -->
<!-- 											<th>建築完成日期</th> -->
<!-- 											<th>備註</th> -->
<!-- 										</tr> -->
<!-- 									</thead> -->
<!-- 									<tbody> -->
<%-- 										<c:forEach var='tp' items='${TwoTaipeiList}' varStatus='vs'> --%>
<!-- 											<tr> -->
<%-- 												<td>${tp.district}</td> --%>
<%-- 												<td>${tp.location}</td> --%>
<%-- 												<td><fmt:formatNumber value="${tp.tprice_s}" --%>
<%-- 														pattern="###,###.##" /> 萬元</td> --%>
<%-- 												<td><fmt:formatNumber value="${tp.uprice_p}" --%>
<%-- 														pattern="###,###.##" /> 萬元</td> --%>
<%-- 												<td>${tp.farea_p}坪</td> --%>
<%-- 												<td>${tp.landa_p}坪</td> --%>
<%-- 												<td>${tp.sdate}</td> --%>
<%-- 												<td>${tp.sbuild}</td> --%>
<%-- 												<td>${tp.tbuild}</td> --%>
<%-- 												<td>${tp.buildtype}</td> --%>
<%-- 												<td>${tp.fdate}</td> --%>
<%-- 												<td>${tp.rmnote}</td> --%>
<!-- 											</tr> -->
<%-- 										</c:forEach> --%>
<!-- 									</tbody> -->
<!-- 								</table> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</div>



	<jsp:include page="/footer.jsp" />

	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>

	<!-- DATA TABES SCRIPT -->
	<script src="js/jquery.dataTables.js" type="text/javascript"></script>
	<script src="js/dataTables.bootstrap.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$("#table1").dataTable(
					{
						"iDisplayLength" : 10,
						"aLengthMenu" : [ [ 10, 25, 50, 100, -1 ],
								[ 10, 25, 50, 100, "All" ] ]
					});
		});
	</script>

	<%-- 	<script src="<c:url value='js/jquery-migrate-3.0.1.min.js' />"></script> --%>
	<script src="<c:url value='js/jquery-ui.js' />"></script>
	<script src="<c:url value='js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='js/mediaelement-and-player.min.js' />"></script>
	<script src="<c:url value='js/jquery.stellar.min.js' />"></script>
	<script src="<c:url value='js/jquery.countdown.min.js' />"></script>
	<script src="<c:url value='js/jquery.magnific-popup.min.js' />"></script>
	<script src="<c:url value='js/aos.js' />"></script>
	<script src="<c:url value='js/circleaudioplayer.js' />"></script>
	<script src="<c:url value='js/selection.js' />"></script>
	<script src="<c:url value='js/main.js' />"></script>

	<!-- 	<script src="js/jquery.tablesorter.widgets.min.js"></script> -->
	<!-- 	<script src="js/jquery-3.4.1.js"></script> -->
	<!-- 	<script src="js/jquery-migrate-3.0.1.min.js"></script> -->
	<!-- 	<script src="js/jquery-ui.js"></script> -->
	<!-- 	<script src="js/popper.min.js"></script> -->
	<!-- 	<script src="js/bootstrap.min.js"></script> -->
	<!-- 	<script src="js/owl.carousel.min.js"></script> -->
	<!-- 	<script src="js/mediaelement-and-player.min.js"></script> -->
	<!-- 	<script src="js/jquery.stellar.min.js"></script> -->
	<!-- 	<script src="js/jquery.countdown.min.js"></script> -->
	<!-- 	<script src="js/jquery.magnific-popup.min.js"></script> -->
	<!-- 	<script src="js/bootstrap-datepicker.min.js"></script> -->
	<!-- 	<script src="js/aos.js"></script> -->
	<!-- 	<script src="js/circleaudioplayer.js"></script> -->
	<!-- 	<script src="js/selection.js"></script> -->
	<!-- 	<script src="js/main.js"></script> -->

</body>

