<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Homeland &mdash; Colorlib Website Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

</head>

<body>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.11/vue.js'></script>


	<div class="site-loader"></div>


	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />

	</div>

	<div class="slide-one-item home-slider owl-carousel">

		<div class="site-blocks-cover overlay"
			style="background-image: url(images/hero_bg_1.jpg);" data-aos="fade"
			data-stellar-background-ratio="0.5">
			<div class="container">
				<!-- <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-10">
              <span class="d-inline-block bg-success text-white px-3 mb-3 property-offer-type rounded">For Rent</span>
              <h1 class="mb-2">871 Crenshaw Blvd</h1>
              <p class="mb-5"><strong class="h2 text-success font-weight-bold">$2,250,500</strong></p>
              <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">See Details</a></p>
            </div>
          </div> -->
			</div>
		</div>



	</div>


<!-- 	<div class="site-section site-section-sm pb-0"> -->
		<div class="container">
			

			<div class="row">
				<div class="col-md-12">
					<div
						class="view-options bg-white py-3 px-3 d-md-flex align-items-center">
<!-- 						<div class="mr-auto"> -->
							<a href="<c:url value='newhouse'/>" class="view-list px-3 border-right active">新增物件</a>
<!-- 							<a href="view-list.html" class="icon-view view-list"><span class="icon-view_list"></span></a> -->

<!-- 						</div> -->
<!-- 						<div class="ml-auto d-flex align-items-center"> -->
<!-- 							<div> -->
<%--  								<a href="<c:url value='newhouse'/>" class="view-list px-3 border-right">新增物件</a> --%>
<!-- 								<a href="buy.jsp" class="view-list px-3 border-right active">All</a> -->
<!--                  			<a href="#" class="view-list px-3">Sale</a> -->
<!-- 							</div> -->


							<!-- <div class="select-wrap">
                  <span class="icon icon-arrow_drop_down"></span>
                  <select class="form-control form-control-sm d-block rounded-0">
                    <option value="">Sort by</option>
                    <option value="">Price Ascending</option>
                    <option value="">Price Descending</option>
                  </select>
                </div> -->

<!-- 						</div> -->
					</div>
				</div>
			</div>

		</div>
<!-- 	</div> -->

	<div class="site-section site-section-sm bg-light">
      <div class="container">
      
      
      <div class="row mb-5">
      <c:forEach var="hlist" items="${houselist}">
      
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="property-entry h-100">
              <a class="property-thumbnail">
                <div class="offer-type-wrap">
                  <span class="offer-type bg-danger">Sale</span>
                </div>
                <img src="data:image/jpeg;base64,${hlist.base64image1}" alt="Image" class="img-fluid">
              </a>
              <div class="p-4 property-body">
                	<a href="housedetail?HOUSEID=${hlist.id}">
                	<h2 class="property-title">${hlist.title}</h2>
                	</a>
                <span class="property-location d-block mb-3"><span class="property-icon icon-room"></span>${hlist.city}${hlist.dist}${hlist.address}</span>
                <strong class="property-price text-primary mb-3 d-block text-success">${hlist.totalprice}萬</strong>
                <ul class="property-specs-wrap mb-3 mb-lg-0">
                  <li>
                    <span class="property-specs">坪數</span>
                    <span class="property-specs-number">${hlist.ping}</span>
                    
                  </li>
                  <li>
                    <span class="property-specs">每坪(萬)</span>
                    <span class="property-specs-number">${hlist.unitprice}</span>
                    
                  </li>

                </ul>

              </div>
              
              <div>
              		<button onclick="update_house(this)" value="${hlist.id}">修改</button>
              		<button onclick="delete_house(this)" value="${hlist.id}">刪除</button>
              </div>
              
            
            </div>
          </div>
          
       </c:forEach>
       </div>
       			
       			<form id="hupdate" action="<c:url value='modhouse'/>" method="POST">
              	</form>
              	<form id="hdelete" action="<c:url value='deletehouse'/>" method="POST">
              		<input type="hidden" name="_method" value="DELETE">
              	</form>



<!--         <div class="row"> -->
<!--           <div class="col-md-12 text-center"> -->
<!--             <div class="site-pagination"> -->
<!--               <a href="#" class="active">1</a> -->
<!--               <a href="#">2</a> -->
<!--               <a href="#">3</a> -->
<!--               <a href="#">4</a> -->
<!--               <a href="#">5</a> -->
<!--               <span>...</span> -->
<!--               <a href="#">10</a> -->
<!--             </div> -->
<!--           </div>   -->
<!--         </div> -->
        
      </div>
    </div>


	<jsp:include page="/footer.jsp" />



	</div>
	
	
	<script>
		function delete_house(clicked){
			if (confirm("確定要刪除嗎?")){
				let vl = clicked.value;
				let ip = document.createElement("input");
				ip.setAttribute("type", "hidden");
				ip.setAttribute("name", "deleteh");
				ip.setAttribute("value", vl);
				
				let fd = document.getElementById("hdelete");
				fd.appendChild(ip);
				fd.submit();
			}else{
				return false;
			}
		}
		function update_house(clicked){
			let vl = clicked.value;
			let ip = document.createElement("input");
			ip.setAttribute("type", "hidden");
			ip.setAttribute("name", "updateh");
			ip.setAttribute("value", vl);
			
			let fd = document.getElementById("hupdate");
			fd.appendChild(ip);
			fd.submit();
		}
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