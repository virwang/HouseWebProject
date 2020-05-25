<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Homeland &mdash; Colorlib Website Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
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
  
  <div class="site-loader"></div>
  
  <div class="site-wrap">
    <jsp:include page="/navibar.jsp" />
  </div>

    <div class="site-blocks-cover inner-page-cover overlay"  data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
          <div class="col-md-10">
            <h1 class="mb-2">新增物件</h1>
          </div>
        </div>
      </div>
    </div>
    

    <div class="site-section">
      <div class="container">
        <div class="row">
       
          <div class="col-md-12 col-lg-10 mb-5">
          
            
          
            <form action="<c:url value='inserthouse' />" method="POST" class="p-5 bg-white border">

              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="title">物件標題:</label>
                  <input type="text" id="title" name="title" class="form-control">
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="tprice">總價:(單位:萬)</label>
                  <input type="text" id="tprice" name="tprice" class="form-control">
                  
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="ping">坪數:</label>
                  <input type="text" id="ping" name="ping" class="form-control">
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="addr">地址:</label>
                  <select name="city" class="form-control">
　					<option value="台北市">台北市</option>
　					<option value="新北市">新北市</option>
				  </select>
				  <select name="dist" class="form-control">
					<option value="北投區">北投區</option>
					<option value="士林區">士林區</option>
					<option value="中山區">中山區</option>
					<option value="內湖區">內湖區</option>
					<option value="大同區">大同區</option>
					<option value="松山區">松山區</option> 
					<option value="萬華區">萬華區</option>
					<option value="中正區">中正區</option>
					<option value="大安區">大安區</option>
					<option value="信義區">信義區</option>
					<option value="南港區">南港區</option>
					<option value="文山區">文山區</option>
				  </select>
                  <input type="text" id="addr" name="addr" class="form-control">
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="apart">社區:</label>
                  <input type="text" id="apart" name="apart" class="form-control">
                </div>
              </div>
				
              <div class="row form-group">
                <div class="col-md-12">
                  <label class="font-weight-bold" for="detail">詳細資料</label> 
                  <textarea name="message" id="detail" name="detail" cols="30" rows="5" class="form-control"></textarea>
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="送出" class="btn btn-primary  py-2 px-4 rounded-0">
                </div>
              </div>

  
            </form>
          </div>


        </div>
      </div>
    </div>

    
    

  

    <jsp:include page="/footer.jsp" />

  </div>

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
  <script src="js/circleaudioplayer.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>