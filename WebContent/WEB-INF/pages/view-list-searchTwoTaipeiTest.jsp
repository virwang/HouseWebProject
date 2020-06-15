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
<link rel="stylesheet"
	href="<c:url value='/css/css_13/jquery-ui-1.12.1/jquery-ui.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/css_13/jquery-ui-1.12.1/jquery-ui.theme.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/mediaelementplayer.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/fonts/icomoon/style.css' />">
<link rel="stylesheet" href="<c:url value='/css/magnific-popup.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/bootstrap-datepicker.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/fonts/flaticon/font/flaticon.css' />">
<link rel="stylesheet" href="<c:url value='/css/fl-bigmug-line.css' />">
<link rel="stylesheet" href="<c:url value='/css/aos.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/owl.carousel.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/owl.theme.default.min.css' />">
<link rel="stylesheet" href="<c:url value='/css/css_13/style_13.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/css_13/popuptext.css' />">
<link rel="stylesheet"
	href="<c:url value='/css/css_13/bootstrap.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/datatable/datatables.css' />">
	<script type='text/javascript'
	src='//cdn.jsdelivr.net/jquery.marquee/1.4.0/jquery.marquee.min.js'></script>

</head>

<body>

	<div class="site-loader"></div>
	<div id="dialog">
		<div id="fade" class="black_overlay"></div>
	</div>
	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
	</div>

	<div id='houseloanlist'></div>

	<div class="site-section site-section-sm pb-0"
		style="background-color: #333333;">
		<div class="container">

			<div id="linebot">
				<span>加入LINE</span> <img
					src=<c:url value='css/css_13/pics_13_/line-meBW.png' />>
			</div>

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
					<div id="totalbought">
						<span id="districtavg"></span>&nbsp;目前搜尋範圍&nbsp; <select
							name="select_year" id="select_year"
							class="form-control d-block rounded-0" onchange="year();">
							<option value="">請選擇</option>
							<option value="109">109年</option>
							<option value="108">108年</option>
							<option value="107">107年</option>
							<option value="106">106年</option>
						</select>&nbsp;年

						<div id="searchblock" class="searchblock">
							<span id="tblength1"></span>
						</div>

						<span style="display: none" id="searchword"></span>
					</div>

					<div
						class="view-options bg-white py-3 px-3 d-md-flex align-items-center">
						<div class="ml-auto d-flex align-items-center">

							<div class="select-wrap">

								<div id="light" class="white_content">

									<div id="light1">
										<iframe id=map> </iframe>
									</div>

									<div id="light2">This is the ligh2tbox content.</div>

								</div>

								<table id="table1"
									class="table table-striped table-hover table-bordered">
									<thead>
										<tr>
											<th style="display: none">ID</th>
											<th>區</th>
											<th>位置</th>
											<th>總價（萬）</th>
											<th>單價（萬）</th>
											<th>建坪</th>
											<th>地坪</th>
											<th style="display: none">交易日</th>
											<!--<th>移轉層次</th>
											<th>總樓層數</th> -->
											<!--<th>型態</th>
											<!--<th>建築完成日期</th>
											<th>備註</th>-->
										</tr>
									</thead>
									<tbody>
										<c:forEach var='tp' items='${TwoTaipeiList}' varStatus='vs'>
											<tr>
												<td id="td0" style="display: none">${tp.id}</td>
												<td id="td1">${tp.district}</td>
												<td id="td8">${tp.location}</td>
												<td id="td2"><fmt:formatNumber type="currency"
														value=" ${tp.tprice_s}" pattern="###,###.#" /></td>
												<td id="td3"><fmt:formatNumber type="currency"
														value="${tp.uprice_p}" pattern="###,###.#" /></td>
												<td id="td4">${tp.farea_p}</td>
												<td id="td5">${tp.landa_p}</td>
												<td id="td7" style="display: none">${tp.sdate}</td>
												<%--<td>${tp.sbuild}</td>
												<td>${tp.tbuild}</td>--%>
												<%--<td>${tp.buildtype}</td>--%>
												<%--<td>${tp.fdate}</td>
												<td>${tp.rmnote}</td>--%>
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
		function showhouseloanlist() {
			$.ajax({
				url : "<c:url value='/ShowHouseLoanList.do'/>",
				type : "GET",
				dataType : "json",
				success : function(data) {

					var jsonstr = JSON.stringify(data);
					var prtyjson = JSON.parse(jsonstr);

					for (n = 0; n <= prtyjson.data.length; n++) {

						var str1 = prtyjson.data[n].bank_LINKS;
						var str = str1.substring(0, str1.length - 1);
						var str2 = "https://pip.moi.gov.tw";
						var src = str2 + str

						var details = '<ul id="marquee3">' + prtyjson.data[n].bank_NAME
								+ '<li> <a href=' + src + '>'
								+ prtyjson.data[n].project_NAME
								+ '</a> </li> <li>首期利率：'
								+ prtyjson.data[n].firstRate + '%</li><li>寬限期：'
								+ prtyjson.data[n].grace_MONTH + '個月</li></ul>'

						$("#houseloanlist").append(details);

					}

				},
				error : function() {
					console.log('FAIL！！！！');
				}
			})
		}
	</script>

<!-- 	<script> -->
// 		$('#houseloanlist').marquee({
// 			direction : 'up',
// 			speed : 15
// 		});
<!-- 	</script> -->

	<script>
		function year() {
			var districtavg = $("#districtavg").text();
			var select_year = $("#select_year").val();
			var searchword = $("#searchword").text();
			$.ajax({
				url : "<c:url value='/TotalBought.do'/>",
				type : "GET",
				data : {
					districtavg : districtavg,
					select_year : select_year,
					searchword : searchword,
				},
				dataType : "json",
				success : function(data) {
					$(".searchblock").empty().append(
							$("<span></span>").html(
									"交易" + data.TwoTaipeiListSize + "件，平均每坪"
											+ data.TwoTaipeiListAvgUprice
											+ "萬元"));
				},
				error : function() {
					$(".searchblock").empty().append(
							$("<span></span>").html("無交易紀錄"));
				}
			})

		}
	</script>

	<script>
		function showyear(select_year) {
			if (select_year != '') {
				$("#table1").dataTable().fnDestroy();
				var districtavg = $("#districtavg").text();
				var select_year = $("#select_year").val();
				console.log("GET select_year=" + select_year);
				console.log("GET districtavg=" + districtavg);
				$('#table1').dataTable(
						{
							"iDisplayLength" : 10,
							"aLengthMenu" : [ [ 10, 25, 50, 100, -1 ],
									[ 10, 25, 50, 100, "全部" ] ],

							"ajax" : {
								"url" : "<c:url value='/ShowYear.do'/>",
								"type" : "GET",
								"dataType" : "json",
								"data" : function(d) {
									d.select_year = $("#select_year").val();
									d.districtavg = $("#districtavg").text();
								},
							},
							"columns" : [ {
								"data" : "id"
							}, {
								"data" : "district"
							}, {
								"data" : "location"
							}, {
								"data" : "tprice_s"
							}, {
								"data" : "uprice_p"
							}, {
								"data" : "farea_p"
							}, {
								"data" : "landa_p"
							}, {
								"data" : "sdate"
							} ],
							"createdRow" : function(row, data, index) {
								$('td', row).eq(0).attr('id', 'td0');
								$('td', row).eq(1).attr('id', 'td1');
								$('td', row).eq(7).attr('id', 'td7');
							}
						});
			}
			enterword();
			console.log("ENTERWORD")
		}
	</script>

	<script>
		function showhousedetail(id) {
			$.ajax({
				url : "<c:url value='/HouseDetail.do'/>",
				type : "GET",
				data : {
					id : id,
				},
				dataType : "json",
				success : function(data) {
					$.each(data, function(index, element) {
						$("#light2").empty().append(
								$('<p id="321">')
										.html("區域：" + element.district),
								$('<p>', {
									text : "位置：" + element.location
								}), $('<p>', {
									text : "地坪：" + element.landa_p
								}), $('<p>', {
									text : "交易日期：" + element.sdate
								}), $('<p>', {
									text : "移轉樓層：" + element.sbuild
								}), $('<p>', {
									text : "總樓層：" + element.tbuild
								}), $('<p>', {
									text : "建築型態：" + element.buildtype
								}), $('<p>', {
									text : "建築完成日期：" + element.fdate
								}), $('<p>', {
									text : "建坪：" + element.farea_p
								}), $('<p>', {
									text : "總價（萬）：" + element.tprice_s
								}), $('<p>', {
									text : "單價（萬）：" + element.uprice_p
								}), $('<p>', {
									text : "備註：" + element.rmnote
								}));
						var loc = element.location;
						map(loc);
					});
				},
				error : function() {
					console.log("回到ajax，data==null");
				}
			})
		}
	</script>


	<script src="<c:url value='/js/aos.js' />"></script>
	<script src="<c:url value='/js/circleaudioplayer.js' />"></script>
	<script src="<c:url value='/js/datatableimport.js' />"></script>
	<script src="<c:url value='/js/main.js' />"></script>
	<script
		src="<c:url value='/css/css_13/jquery-ui-1.12.1/jquery-ui.js' />"></script>
	<script src="<c:url value='/js/mediaelement-and-player.min.js' />"></script>
	<script src="<c:url value='/css/css_13/bootstrap.min.js' />"></script>
	<script src="<c:url value='/datatable/datatables.js' />"></script>
	<script src="<c:url value='/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/js/jquery.stellar.min.js' />"></script>
	<script src="<c:url value='/js/jquery.countdown.min.js' />"></script>
	<script src="<c:url value='/js/jquery.magnific-popup.min.js' />"></script>
	<script src="<c:url value='/js/popper.min.js' />"></script>
	<script src="<c:url value='/js/searchword.js' />"></script>
	<script src="<c:url value='/js/selectdis.js' />"></script>
	<script src="<c:url value='/js/selection.js' />"></script>
	<script src="<c:url value='/js/ajaxads.js' />"></script>


</body>

</html>