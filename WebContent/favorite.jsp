<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet" href="css/05_css/button.css">

<title>Show Favorite</title>
</head>
<body>
	<div class="site-loader"></div>
	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
	</div>
	<div class="site-section site-section-sm pb-0"
		style="background-color: #333333;">
		<div class="container">
			<div id="favorite" class="row">
				<form class="form-search col-md-12"
					style="background-color: transparent" name="myForm"
					action="<c:url value="favorite" />"></form>
			</div>
			<div class="container" style="background-color: white;">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="card">
							<h3
								class="card-header text-center font-weight-bold text-uppercase py-4">我的最愛</h3>
							<div class="card-body">
								<a class="button" href="css/05_css/addFavoriteButton">加入我的最愛</a>
								<div id="table" class="table-editable">
									<span class="table-add float-right mb-3 mr-2">
									 <a
										href="#!" class="text-success"> <i
											class="fas fa-plus fa-2x" aria-hidden="true"></i>
									</a>
									</span>
									<table id="dt-basic-checkbox" style="text-align: center"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<th class="text-center"><img class="" style="width:100%" src="data:image/jpg;base64,${house.getimg()}" alt="">照片</th>
												<th class="text-center">房屋標題</th>
												<th class="text-center">縣市行政區</th>
												<th class="text-center">鄰近捷運站<th>
												<th class="text-center">單價</th>
												<th class="text-center">上架日期</th>
												<th class="text-center">修改</th>
											</tr>

										</thead>
										<tbody>
											<c:forEach var='favorite' items='favorite' varStatus='vs'>
												<tr>
													<td class="pt-3-half">${favorite.img}</td>
													<td class="pt-3-half">${favorite.title}</td>
													<td class="pt-3-half">${favorite.address}</td>
													<td class="pt-3-half">${favorite.MRT}</td>
													<td class="pt-3-half">${favorite.totalprice}</td>
													<td class="pt-3-half">${favorite.addDate}</td>
													<td><span class="table-remove">
															<button type="button" class="btn btn-danger btn-rounded btn-sm my-0">刪除</button>
													</span></td>
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