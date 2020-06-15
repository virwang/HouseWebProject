<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="../../css/05_css/jquery.dataTables.min.css">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/05_css/style05.css"></link>

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
								<a style="color: #A52A2A;"
									href="<c:url value='showMemberData?=${favorite.memberBean.pk}'/>">${memberBean.name}</a>
								的收藏
							</h3>
							<div class="card-body">
								<div class="form-group">
									<a class="button" href='houselist'
										style="font-family: Microsoft JhengHei; color: #FFFAF0;">新增收藏</a>
									<button
										style='font-size: 24px; font-family: Microsoft JhengHei; float: right; background-color: orange; border: 2px none;'
										id="showsexy">顯示熱門收藏</button>
									<!-- 									<button style='font-size: 24px; font-family: Microsoft JhengHei; float: rigth;' id="hide"> -->
									<!-- 										<i class='fas fa-caret-square-up'></i> -->
									<!-- 										隱藏熱門收藏 -->
									<!-- 									</button> -->
									<div id="sexy" style="display: none;">
										<p style="text-align: center; font-size: 25px; dispaly: none;color: #A52A2A;"
											id="hot">熱門收藏排名</p>
										<table style="text-align: center; font-size: 20px;"
											class="table table-striped table-bordered" id="thot">
											<thead>
												<tr>
													<th>排名</th>
													<th>標題</th>
													<th>行政區</th>
													<th>位置</th>
													<th>總價(萬元)</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td><a
														href="<c:url value='housedetail?HOUSEID=${path[0][0]}'/>">${path[0][2]}</a></td>
													<td>${path[0][4]}</td>
													<td>${path[0][5]}</td>
													<td>${path[0][3]}</td>
												</tr>
												<tr>
													<td>2</td>
													<td><a
														href="<c:url value='housedetail?HOUSEID=${path[1][0]}'/>">${path[1][2]}</a></td>
													<td>${path[1][4]}</td>
													<td>${path[1][5]}</td>
													<td>${path[1][3]}</td>
												</tr>
												<tr>
													<td>3</td>
													<td><a
														href="<c:url value='housedetail?HOUSEID=${path[2][0]}'/>">${path[2][2]}</a></td>
													<td>${path[2][4]}</td>
													<td>${path[2][5]}</td>
													<td>${path[2][3]}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!--		Show Numbers Of Rows 		-->
									<!-- 									<select class="form-control" name="state" id="maxRows" -->
									<!-- 										style="width: 25%; float: right; margin-top: 2px;"> -->
									<!-- 										<option value="100">顯示全部</option> -->
									<!-- 										<option value="5">5</option> -->
									<!-- 										<option value="10">10</option> -->
									<!-- 										<option value="15">15</option> -->
									<!-- 									</select> -->
									<!-- 								</div> -->
								</div>
								<div id="fhouse">
									<div id="table">
										<span class="table-add float-right mb-3 mr-2"> <a
											href="#!" class="text-success"> </a>
										</span>
										<table style="text-align: center; font-size: 20px;"
											class="table table-striped table-bordered" id="ctable">
											<thead id="fth">
												<tr>
													<th
														style="font-size: 25px; float: center; font-family: Microsoft JhengHei;">照片</th>
													<th class="text-center"
														style="font-size: 25px; float: center; font-family: Microsoft JhengHei;"
														id="compare">標題</th>
													<th class="text-center"
														style="font-size: 25px; float: center; font-family: Microsoft JhengHei;"
														id="compare">市/區</th>
													<th class="text-center"
														style="font-size: 25px; float: center; font-family: Microsoft JhengHei;"
														id="compare">位置</th>
													<th class="text-center"
														style="font-size: 25px; float: center; font-family: Microsoft JhengHei;"
														data-type="num" id="compare">總價</th>
													<th class="text-center"
														style="font-size: 25px; float: center; font-family: Microsoft JhengHei;"
														id="compare">坪數</th>
													<th class="text-center"
														style="font-size: 25px; float: center; font-family: Microsoft JhengHei;"
														id="compare">捷運</th>
													<th class="text-center" id="onmktdate"
														style="font-size: 25px; float: center; font-family: Microsoft JhengHei;"
														id="compare">上架日期</th>
													<th class="text-center"
														style="font-size: 10px; float: center; font-family: Microsoft JhengHei;"></th>
												</tr>
											</thead>
											<tbody id="tr1">
												<c:forEach var='favorite' items='${fh}' varStatus='vs'>
													<tr id="ftr${favorite.fid}">
														<td class="pt-3-half"><a
															href="<c:url value='housedetail?HOUSEID=${favorite.houseBean.id}'/>">
																<img
																src="data:image/jpeg;base64,${favorite.houseBean.base64image1}"
																alt="Image" class="img-fluid" width="250px, 200px;">
														</a></td>
														<c:set var="string1" value="${favorite.houseBean.title}" />
														<c:set var="string2" value="${fn:substring(string1,0,10)}" />
														<td class="pt-3-half"><a
															href="<c:url value='housedetail?HOUSEID=${favorite.houseBean.id}'/>">${string2}</a></td>
														<td class="pt-3-half">${favorite.houseBean.city}/${favorite.houseBean.dist}</td>
														<td class="pt-3-half">${favorite.houseBean.address}</td>
														<td class="pt-3-half">${favorite.houseBean.totalprice}</td>
														<td class="pt-3-half">${favorite.houseBean.ping}</td>
														<td class="pt-3-half"><a
															href="<c:url value='searchhousemap?mrtpk=${favorite.houseBean.mrtBean.pk}'/>">${favorite.houseBean.mrtBean.stationname}</a></td>
														<td class="pt-3-half"><fmt:formatDate
																value="${favorite.houseBean.addDate}"
																pattern="yyyy/MM/dd" /></td>
														<td class="pt-3-half">
															<button class="btn de"
																style="font-family: Microsoft JhengHei; padding: 10px 10px white; background-color: transparent;"
																id="fv${favorite.fid}" value="${favorite.fid}">
																<i class="fa fa-trash"
																	style="color: #DC143C; border: 1px color:white; padding: 1px color:white; margin: 1px 1px color:white; background-color: transparent; font-size: 20px"></i>
															</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div class="col-md-12 text-center" style="text-align: right;">
											<div class="row mt-5">
												<div class="col-md-12 text-center">
													<p id="count" style="text-align: center; font-size: 30px;"></p>
													<!-- 												<div class='pagination-container' id="table-id"> -->
													<!-- 													<nav> -->
													<!-- 														<ul class="pagination"> -->
													<!-- 															<li data-page="prev"><span> < <span -->
													<!-- 																	class="sr-only">(current)</span></span></li> -->

													<!-- 															<li data-page="next" id="prev"><span> > <span -->
													<!-- 																	class="sr-only">(current)</span></span></li> -->
													<!-- 														</ul> -->
													<!-- 													</nav> -->
													<!-- 												</div> -->

												</div>
											</div>
										</div>

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

	<script src="js/mediaelement-and-player.min.js"></script>
	<script src="js/jquery-3.4.1.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.min.js"></script>
	<script src="js/pagination.js"></script>
	<script src="js/pagination.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
						var rows = document.getElementById("ctable").rows.length;
						var row = rows - 1;
						console.log("row="+row);
						if(row==0){
							location.href="<c:url value='favorite'/>";
						}
						var str = "<p>共" + row + "筆收藏</p>"
						console.log(rows - 1);
						document.getElementById("count").innerHTML = str;
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
	<script>
		//分頁
		$(document).ready(function() {
			$('#pagination').DataTable({
				"pagingType" : "full_numbers"
			});
		});
	</script>
	<script>
		//顯示隱藏熱搜
        $(document).ready(function () {
            $("#showsexy").click(function () {
                $("#sexy").toggle();            
          		if($('#sexy').is(":visible"))
              		{
						$("#showsexy").html('隱藏熱門收藏')
              		}
          		else{
					$("#showsexy").html('顯示熱門收藏')
              		}
            });

        });
    </script>
	<script>
					getPagination('#table-id');
					//getPagination('.table-class');
					//getPagination('table');
	</script>
	<script>
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
	<script>
	function getPagination(table) {
  var lastPage = 1;

  $('#maxRows')
    .on('change', function(evt) {
      //$('.paginationprev').html('');// reset pagination

      lastPage = 1;
      $('.pagination')
        .find('li')
        .slice(1, -1)
        .remove();
      var trnum = 0; // reset tr counter
      var maxRows = parseInt($(this).val()); // get Max Rows from select option

      if (maxRows == 100) {
        $('.pagination').hide();
      } else {
        $('.pagination').show();
      }

      var totalRows = $(table + ' tbody tr').length; // numbers of rows
      $(table + ' tr:gt(0)').each(function() {
        // each TR in  table and not the header
        trnum++; // Start Counter
        if (trnum > maxRows) {
          // if tr number gt maxRows

          $(this).hide(); // fade it out
        }
        if (trnum <= maxRows) {
          $(this).show();
        } // else fade in Important in case if it ..
      }); //  was fade out to fade it in
      if (totalRows > maxRows) {
        // if tr total rows gt max rows option
        var pagenum = Math.ceil(totalRows / maxRows);( // ceil total(rows/maxrows) to get ..
        //	numbers of pages
        for (var i = 1; i <= pagenum; ) {
          // for each page append pagination li
          $('.pagination #prev')
            .before(
              '<li data-page="' +
                i +
                '">\
								  <span>' +
                i++ +
                '<span class="sr-only">(current)</span></span>\
								</li>'
            )
            .show();
        } // end for i
      } // end if row count > max rows
      $('.pagination [data-page="1"]').addClass('active'); // add active class to the first li
      $('.pagination li').on('click', function(evt) {
        // on click each page
        evt.stopImmediatePropagation();
        evt.preventDefault();
        var pageNum = $(this).attr('data-page'); // get it's number

        var maxRows = parseInt($('#maxRows').val()); // get Max Rows from select option

        if (pageNum == 'prev') {
          if (lastPage == 1) {
            return;
          }
          pageNum = --lastPage;
        }
        if (pageNum == 'next') {
          if (lastPage == $('.pagination li').length - 2) {
            return;
          }
          pageNum = ++lastPage;
        }

        lastPage = pageNum;
        var trIndex = 0; // reset tr counter
        $('.pagination li').removeClass('active'); // remove active class from all li
        $('.pagination [data-page="' + lastPage + '"]').addClass('active'); // add active class to the clicked
        // $(this).addClass('active');					// add active class to the clicked
        limitPagging();
        $(table + ' tr:gt(0)').each(function() {
          // each tr in table not the header
          trIndex++; // tr index counter
          // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
          if (
            trIndex > maxRows * pageNum ||
            trIndex <= maxRows * pageNum - maxRows
          ) {
            $(this).hide();
          } else {
            $(this).show();
          } //else fade in
        }); // end of for each tr in table
      }); // end of on click pagination list
      limitPagging();
    })
    .val(5)
    .change();

  // end of on select change

  // END OF PAGINATION
}

// function limitPagging() {
//   // alert($('.pagination li').length)

//   if ($('.pagination li').length > 7) {
//     if ($('.pagination li.active').attr('data-page') <= 3) {
//       $('.pagination li:gt(5)').hide();
//       $('.pagination li:lt(5)').show();
//       $('.pagination [data-page="next"]').show();
//     }
//     if ($('.pagination li.active').attr('data-page') > 3) {
//       $('.pagination li:gt(0)').hide();
//       $('.pagination [data-page="next"]').show();
//       for (
//         let i = parseInt($('.pagination li.active').attr('data-page')) - 2;
//         i <= parseInt($('.pagination li.active').attr('data-page')) + 2;
//         i++
//       ) {
//         $('.pagination [data-page="' + i + '"]').show();
//       }
//     }
//   }
// }

// $(function() {
//   // Just to append id number for each row
//   $('table tr:eq(0)').prepend('<th> ID </th>');

//   var id = 0;

//   $('table tr:gt(0)').each(function() {
//     id++;
//     $(this).prepend('<td>' + id + '</td>');
//   });
// });
</script>
</body>
</html>

