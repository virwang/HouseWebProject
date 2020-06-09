<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="css/05_css/animate.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/05_css/fl-bigmug-line.css">
<link rel="stylesheet" href="css/05_css/aos.css">
<link rel="stylesheet" href="css/05_css/style.css">
<link rel="stylesheet" href="css/05_css/button.css">
<link rel="stylesheet" href="css/05_css/addFavoriteButton.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<title>compare</title>
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

			<div class="container" style="background-color: white;">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="card">
							<h3
								class="card-header text-center font-weight-bold text-uppercase py-4">
								房屋比較</h3>
							<div class="card-body">
								<button id="compare"
									style="float: right; top: 50%; font-size: 24px; font-family: Microsoft JhengHei; border-radius: 10px; background-color: #F5DEB3; color: 00008B; width: 20px 10px;"
									onclick="javascript:location.href='houselist'">
									<i class="material-icons"></i> 新增比較
								</button>

								<table style="text-align: center"
									class="table table-striped table-bordered" id="ctable">
									<thead id="fth">
										<tr>
											<th
												style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">照片</th>
											<th class="text-center"
												style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">標題<i
												class='fas fa-arrows-alt-v' id="compare"></i></th>
											<th class="text-center"
												style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">市/區<i
												class='fas fa-arrows-alt-v' id="compare"></i></th>
											<th class="text-center"
												style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">總價<i
												class='fas fa-arrows-alt-v' id="compare"></i></th>
											<th class="text-center"
												style="font-size: 20px; float: center; font-family: Microsoft JhengHei;"
												data-type="num">單價<i class='fas fa-arrows-alt-v'
												id="compare"></i></th>
											<th class="text-center"
												style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">坪數<i
												class='fas fa-arrows-alt-v' id="compare"></i></th>
											<th class="text-center"
												style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">捷運<i
												class='fas fa-arrows-alt-v' id="compare"></i></th>
											<th class="text-center" id="onmktdate"
												style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">上架日期<i
												class='fas fa-arrows-alt-v' id="compare"></i></th>
											<th class="text-center"
												style="font-size: 20px; float: center; font-family: Microsoft JhengHei;"></th>
										</tr>
									</thead>
									<tbody id="tr1">
										<c:forEach var='favorite' items='${com}' varStatus='vs'>
											<tr id="">
												<td class="pt-3-half"><a
													href="<c:url value='housedetail?HOUSEID=${houseBean.id}'/>">
														<img
														src="data:image/jpeg;base64,${houseBean.base64image1}"
														alt="Image" class="img-fluid">
												</a></td>
												<c:set var="string1" value="${houseBean.title}" />
												<c:set var="string2" value="${fn:substring(string1,0,9)}" />
												<td class="pt-3-half"><a
													href="<c:url value='housedetail?HOUSEID=${houseBean.id}'/>">${string2}</a></td>
												<td class="pt-3-half">${houseBean.city}/${houseBean.dist}</td>
												<td class="pt-3-half">${houseBean.totalprice}</td>
												<td class="pt-3-half">${houseBean.uintprice}</td>
												<td class="pt-3-half">${houseBean.ping}</td>
												<td class="pt-3-half"><a
													href="<c:url value='searchhousemap?mrtpk=${houseBean.mrtBean.pk}'/>">${houseBean.mrtBean.stationname}</a></td>
												<td class="pt-3-half"></td>
												<td class="pt-3-half">
													<button class="btn de"
														style="font-family: Microsoft JhengHei; padding: 10px 10px white; background-color: transparent;"
														id="" value="">
														<i class="fa fa-trash"
															style="color: #DC143C; border: 20px color:white; padding: 20px color:white; margin: 20px 20px color:white; background-color: transparent;"></i>
													</button>
												</td>

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
	<jsp:include page="/footer.jsp" />
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
					if (res == 'deOK') {
						//         	$('#tr1').empty();
						console.log(this);

						console.log($('#ftr' + id));
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
	<script>
		$("#ctable").tablesorter({
			// 		console.log("hi, here")
			theme : 'blue',
			widgets : [ 'zebra', 'staticRow' ]

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

</body>
</html>