<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/05_css/style.css">
<link rel="stylesheet" href="css/05_css/button.css">
<link rel="stylesheet" href="css/05_css/addFavoriteButton.css">
<link rel="stylesheet" href="css/05_css/table.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.30.5/css/theme.blue.min.css" />

<style>
#ctable {
	moz-user-select: -moz-none;
	-moz-user-select: none;
	-o-user-select: none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border-collapse: collapse;
	border-spacing: 0;
	margin: 0;
	padding: 0;
	width: 100%;
	/* 	text-align: center; */
	margin: 15px 0;
}

#ctable th {
	cursor: pointer;
}

#ctable tr:nth-child(even) {
	background: #f9f9f9
}

#ctableth, #ctable td {
	padding: 10px;
	border: 1px solid #ccc;
}
</style>

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
								<form class="example" style="float: right;">
									<input type="text" id="input" placeholder="Search.."
										name="search">
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
													<th
														style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">照片</th>
													<th class="text-center"
														style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">標題<i
														class='fas fa-arrows-alt-v' id="compare"></i></th>
													<th class="text-center"
														style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">市/區<i
														class='fas fa-arrows-alt-v' id="compare"></i></th>
													<th class="text-center"
														style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">位置<i
														class='fas fa-arrows-alt-v' id="compare"></i></th>
													<th class="text-center"
														style="font-size: 20px; float: center; font-family: Microsoft JhengHei;"
														data-type="num">總價<i class='fas fa-arrows-alt-v'
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
														style="font-size: 20px; float: center; font-family: Microsoft JhengHei;">刪除</th>
												</tr>
											</thead>
											<tbody id="tr1">
												<c:forEach var='favorite' items='${fh}' varStatus='vs'>
													<tr id="ftr${favorite.fid}">
														<td class="pt-3-half"><a
															href="<c:url value='housedetail?HOUSEID=${favorite.houseBean.id}'/>">
																<img
																src="data:image/jpeg;base64,${favorite.houseBean.base64image1}"
																alt="Image" class="img-fluid">
														</a></td>
														<c:set var="string1" value="${favorite.houseBean.title}" />
														<c:set var="string2" value="${fn:substring(string1,0,3)}" />
														<td class="pt-3-half"><a
															href="<c:url value='housedetail?HOUSEID=${favorite.houseBean.id}'/>">${string2}</a></td>
														<td class="pt-3-half">${favorite.houseBean.city}/${favorite.houseBean.dist}</td>
														<td class="pt-3-half">${favorite.houseBean.address}</td>
														<td class="pt-3-half">${favorite.houseBean.totalprice}</td>
														<td class="pt-3-half">${favorite.houseBean.ping}</td>
														<td class="pt-3-half">${favorite.houseBean.mrtBean.stationname}</td>
														<td class="pt-3-half"><fmt:formatDate value="${favorite.houseBean.addDate}" pattern="yyyy/MM/dd"/></td>
														<td class="pt-3-half">
															<button class="btn de"
																style="font-family: Microsoft JhengHei; padding: 2px 2px white; background-color: transparent;"
																id="fv${favorite.fid}" value="${favorite.fid}">
																<i class="fa fa-trash"
																	style="color: #DC143C; border: 5px color:white; padding: 10px color:white; margin: 10px 10px color:white; background-color: white"></i>
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
	<!-- 	<script src="js/popper.min.js"></script> -->
	<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script> -->

	<!-- <!-- 	<script> -->

	<!-- // 		; -->
	<!-- // 		(function() { -->
	<!-- // 			var tbody = document.querySelector('#ctable').tBodies[0]; -->
	<!-- // 			var th = document.querySelector('#ctable').tHead.rows[0].cells; -->
	<!-- // 			var td = tbody.rows; -->
	<!-- // 			for (var i = 0; i < th.length; i) { -->
	<!-- // 				th[i].flag = 1; -->
	<!-- // 				document.getElementById("compare").onclick = function() { -->
	<!-- // 					sort(this.getAttribute('data-type'), this.flag, -->
	<!-- // 							this.cellIndex); -->
	<!-- // 					this.flag = -this.flag; -->
	<!-- // 				}; -->
	<!-- // 			} -->
	<!-- // 			; -->
	<!-- // 			//save in DOM -->
	<!-- // 			function sort(string, flag, n) { -->
	<!-- // 				var arr = []; -->
	<!-- // 				for (var i = 0; i < td.length; i++) { -->
	<!-- // 					arr.push(td[i]); -->
	<!-- // 				} -->
	<!-- // 				; -->
	<!-- // 				//排序 -->
	<!-- // 				arr.sort(function(a, b) { -->
	<!-- // 					return method(string, a.cells[n].innerHTML, -->
	<!-- // 							b.cells[n].innerHTML) -->
	<!-- // 							* flag; -->

	<!-- // 				}); -->
	<!-- // 				//新增 -->
	<!-- // 				for (var i = 0; i < arr.length; i++) { -->
	<!-- // 					tbody.appendChild(arr[i]); -->
	<!-- // 				} -->
	<!-- // 				; -->
	<!-- // 				// 			tbody.appendChild(arr[i]); -->
	<!-- // 			} -->
	<!-- // 			; -->
	<!-- // 			//排序方法 -->
	<!-- // 			function method(str, a, b) { -->
	<!-- // 				switch (str) { -->
	<!-- // 				//數字排序 -->
	<!-- // 				case 'num': -->
	<!-- // 					return a - b; -->
	<!-- // 					break; -->
	<!-- // 				//字串排序 -->
	<!-- // 				case 'string': -->
	<!-- // 					return a.localeCompare(b); -->
	<!-- // 					break; -->
	<!-- // 				default: //日期排序，IE8下'2012-12-12'這種格式無法設定時間，替換成'/' -->
	<!-- // 					return new Date(a.split('-').join('/')) -->
	<!-- // 							- new Date(b.split('-').join('/')); -->
	<!-- // 				} -->
	<!-- // 				; -->
	<!-- // 			} -->
	<!-- // 			; -->
	<!-- 		})(); -->
	<!-- 	</script> -->
	
	<script src="js/mediaelement-and-player.min.js"></script>
	<script src="js/jquery-3.4.1.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>
	<!-- 	<script src="js/tablesort.js"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.min.js"></script>
	<!-- 	<script src="https://raw.githubusercontent.com/ascii-soup/Tablesorter-Static-Row-Plugin/master/jquery.tablesorter.staticrow.js"></script> -->
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
						// 						console.log('ftr' + id);
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
		theme: 'blue',
		widgets: ['zebra', 'staticRow']
  	
	})
	ts.addParser({
 		id:"onmktdate",
 		is: function(s) {
 			return/d{1,4}-d{1,2}-d{1,2} d{1,2}:d{1,2}:d{1,2}.d+/.test(s);
 		 },
 		format: function(s) {
 		 s = s.replace(/-/g,"");
//  		 s = s.replace(/:/g,"");
//  		 s = s.replace(/./g,"");
 		 	s = s.split("");
 		 return $.tablesorter.formatFloat(new Date(s[0], s[1]-1, s[2], s[3], s[4], s[5]).getTime()+parseInt(s[6]));
 		 },
 		 type:"numeric"
 		});
// 	$(function() {
// 		 $("#ctable").tablesorter({
// 		 headers: {
// 		 7: { sorter:'onmktdate' }
// 		 }
// 		 });
 	</script>


</body>
</html>

