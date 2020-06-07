<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/05_css/style.css">
<link rel="stylesheet" href="css/05_css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/05_css/magnific-popup.css">
<link rel="stylesheet" href="css/05_css/jquery-ui.css">
<link rel="stylesheet" href="css/05_css/owl.carousel.min.css">
<link rel="stylesheet" href="css/05_css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/05_css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/05_css/mediaelementplayer.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/05_css/fl-bigmug-line.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/05_css/style.css">
<link rel="stylesheet" href="css/05_css/button.css">
<link rel="stylesheet" href="css/05_css/addFavoriteButton.css">
<link rel="stylesheet" href="css/05_css/table.css">


<title>Show Favorite</title>
</head>
<body style="font-family: Microsoft JhengHei;">
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
			<div class="container" style="background-color: white; width: 100%">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="card">
							<h3
								class="card-header text-center font-weight-bold text-uppercase py-4">
								<a style="color: #A52A2A;">${memberBean.name}</a>的收藏
							</h3>
							<div class="card-body">
								<a type="button" class="button"
									onclick="javascript:location.href='houselist'"
									style="font-family: Microsoft JhengHei; color: #FFFAF0;">新增收藏</a>
								<form class="example" style="float:right;">
									<input type="text" id="input" placeholder="Search.." name="search">
									<button type="submit">
										<i class="fa fa-search"></i>
									</button>
								</form>
								<div id="fhouse">
									<div id="table">
										<span class="table-add float-right mb-3 mr-2"> <a
											href="#!" class="text-success"> </a>
										</span>
										<table style="text-align: center"
											class="table table-striped table-bordered" id="ctable">
											<thead id="fth">
												<tr>
													<th class="text-center" id="thimg">照片</th>
													<th class="text-center" id="thtitle">房屋</th>
													<th class="text-center" id="thcity">市/區</th>
													<th class="text-center" id="thlocat">詳細位置</th>
													<th class="text-center" id="thtp">總價(萬元)</th>
													<th class="text-center" id="thping">坪數</th>
													<th class="text-center" id="thmrt">捷運站</th>
													<th class="text-center" id="thdate">上架日期</th>
													<th class="text-center" id="thc">實價登錄比較</th>
													<th class="text-center">刪除</th>
												</tr>
											</thead>
											<tbody id="tr1">
												<c:forEach var='favorite' items='${fh}' varStatus='vs'>
													<tr id="ftr${favorite.fid}">
														<td class="pt-3-half" id="tdimg"><a
															href="<c:url value='housedetail?HOUSEID=${favorite.houseBean.id}'/>">
																<img
																src="data:image/jpeg;base64,${favorite.houseBean.base64image1}"
																alt="Image" class="img-fluid">
														</a></td>
														<c:set var="string1" value="${favorite.houseBean.title}" />
														<c:set var="string2" value="${fn:substring(string1,0,3)}" />
														<td class="pt-3-half" id="tdtitile"><a
															href="<c:url value='housedetail?HOUSEID=${favorite.houseBean.id}'/>">${string2}</a></td>
														<td class="pt-3-half" id="tdcity">${favorite.houseBean.city}/${favorite.houseBean.dist}</td>
														<td class="pt-3-half" id="tdaddr">${favorite.houseBean.address}</td>
														<td class="pt-3-half" id="tdtp">${favorite.houseBean.totalprice}</td>
														<td class="pt-3-half" id="tdping">${favorite.houseBean.ping}</td>
														<td class="pt-3-half" id="tdmrt">${favorite.houseBean.mrtBean.stationname}</td>
														<c:set var="adddate1"
															value="${favorite.houseBean.addDate}" />
														<c:set var="adddate2"
															value="${fn:substring(adddate1,0,11)}" />
														<td class="pt-3-half" id="tddate">${adddate2}</td>
														<td class="pt-3-half" id="tdc">${favorite.taipei.tprice}</td>
														<td class="pt-3-half">
															<button class="btn de"
																style="font-family: Microsoft JhengHei; padding: 2px 2px white;"
																id="fv${favorite.fid}" value="${favorite.fid}">
																<i class="fa fa-trash"
																	style="color: #DC143C; border: 1px color:white; padding: 1px color:white; margin: 1px color:white; background-color: white"></i>
															</button>
														</td>

													</tr>
												</c:forEach>
											</tbody>
										</table>
										<p id="count" style="text-align: left;"></p>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/footer.jsp" />
	<script src="js/popper.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#table').DataTable();
		});
	</script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<!-- 	<script src="js/jquery-ui.js"></script> -->

	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/mediaelement-and-player.min.js"></script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- 	<script src="js/jquery.stellar.min.js"></script> -->
	<!-- 	<script src="js/jquery.countdown.min.js"></script> -->
	<!-- 	<script src="js/jquery.magnific-popup.min.js"></script> -->
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>
	<!-- 	<script src="js/jquery-3.4.1.js"></script> -->
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<!-- 	<script src="js/jquery.min.js"></script> -->
	<script>
		$(".de").click(function() {
			var id = this.value;
			var test = this;
			console.log(test);
			// 	alert(id);
			$.ajax({
				method : "Post",
				url : "<c:url value='/deletefavorite.do' /> ",
				data : {
					"deletefid" : id
				},
				dataType : 'text',
				success : function(res) {
					//         console.log('a1'+res);
					//         console.log('a2'+res.val());
					//         console.log('a3'+res[0]);
					//         console.log('a4'+res[0].val());
					//     	alert('ajax back '+res);
					if (res == 'deOK') {
						//         	$('#tr1').empty();
						console.log(this);
						console.log('ftr' + id);
						console.log($('#ftr' + id));
						// 		console.log('abc'+$(this).id);
						// 		console.log('abc'+$(this).parent('tr'));

						$('#ftr' + id).remove();
						alert("刪除資料");
					}
					if (res == 'deNO') {
						//         	$('#tr1').remove;
						alert("NO");
					}
					//         $('#tr1').remove
					// 		console.log("Y");
					//         }
				},
				error : function() {
					alert("失敗")
				}
			})
		})
	</script>
	<script>
		var rows = document.getElementById("ctable").rows.length;
		var row = rows - 1;
		var str = "<p>共" + row + "筆收藏</p>"
		console.log(rows - 1);
		document.getElementById("count").innerHTML = str;
	</script>


</body>
</html>

