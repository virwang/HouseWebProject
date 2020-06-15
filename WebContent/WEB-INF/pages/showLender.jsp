<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css//bootstrap.min.css">
<link rel="stylesheet" href="css/_08_css/jquery.dataTables.min.css">

<title>房貸專員</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
<style>
body {
	font-family:微軟正黑體;

}
</style>
</head>
<body>
	<div class="site-loader"></div>
	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
	</div>
	<div class="site-blocks-cover inner-page-cover overlay"
		style="background-image: url(css/_08_css/images/businessman.jpg);"
		fade" data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row align-items-center justify-content-center text-center">
				<div class="col-md-10">
					<h1 class="mb-2">房貸專員</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="site-section">
		<div class="container">
			<div class="row">
				<div id="allLender">
					<table id="example" class="dataTable display" style="width: 100%">
						<thead>
							<tr>
								<th>專員編號</th>
								<th>專員姓名</th>
								<th>專員銀行</th>
								<th>連絡電話</th>
								<th>銀行地址</th>

							</tr>
						</thead>
						<tbody>
							<%-- 						<c:forEach var="llist" items="${lenderlist}"> --%>
							<!-- 							<tr> -->
							<%-- 								<td>${llist.memberBean.name}</td> --%>
							<%-- 								<td>${llist.bankTest.bankName}</td> --%>
							<%-- 								<td>${llist.memberBean.tel}</td> --%>
							<%-- 								<td>${llist.bankTest.bankAddr}</td> --%>

							<!-- 							</tr> -->
							<%-- 						</c:forEach>			 --%>
						</tbody>
					</table>
				</div>
				<!-- 				<div id="oneLender"> -->
				<%-- 					<span>專員姓名:${onelender.memberBean.name}</span> <span>專員銀行:${onelender.bankTest.bankName}</span> --%>

				<!-- 				</div> -->
			</div>

		</div>
	</div>
	<jsp:include page="/footer.jsp" />
	<script>
	$(document).ready(function() {

    	$('#example').DataTable( {
        	"ajax":{
				"url":"<c:url value='allAjaxLender'/>",
				"type":"GET",
				"datatype":"json"
        	},
			"columns":[
				{"data":"pkId"},
				{"data":"memberBean.name"},
				{"data":"bankTest.bankName"},
				{"data":"memberBean.tel"},
				{"data":"bankTest.bankAddr"}
			],
			"columnDefs": [
			    { "visible": false, "targets": 0 }
			  ]
			
    	});
	})
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

	<script src="<c:url value='/datatable/datatables.js' />"></script>
</body>
</html>