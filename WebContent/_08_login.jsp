<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Homeland &mdash; Colorlib Website Template</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
    body{
        background-color: #D0D0D0;
    }
    .st1 {
      text-align: center;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 20px;
        font-size: 40px;
    }

    .st2 {
        margin: auto;
        width: 150px;
        font-size: 30px;
        margin-top: 100px;
        margin-bottom: 100px;
    }
 	.st3{
 		text-align: center;
 		margin:auto;
 		width:400px;
 		
 	}
    	
   
</style>
</head>

<body>

  <div class="site-loader"></div>

  <div class="site-wrap">
	<jsp:include page="/navibar.jsp" />
  </div>

  <div class="slide-one-item home-slider owl-carousel">



    <div class="site-blocks-cover overlay" style="background-image: url(images/house3.jpg);" data-aos="fade"
      data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
          <div class="col-md-10">
            <!-- <span class="d-inline-block bg-success text-white px-3 mb-3 property-offer-type rounded">出租</span> -->
            <span class="d-inline-block bg-danger text-white px-3 mb-3 property-offer-type rounded">賣房</span>
            <h1 class="mb-2">渡假村</h1>
            <p class="mb-5"><strong class="h2 text-success font-weight-bold">$2,250,500</strong></p>
            <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">詳細資訊</a></p>
          </div>
        </div>
      </div>
    </div>

  </div>
  
<Form  Action="<c:url value='springlogin.do' />" method="POST" >
    <Table class="st3" width='330' >
         <TR><TH colspan='2'>
            <H1 >登入</H1> 
         </TH><TH></TH></TR>
         <TR>
             <TD align="RIGHT">帳號：</TD>
             <TD align="LEFT"><input	type="text" name="account" size="16"></TD>
             <TD width='120'><small><Font color='red' size="-1">${ErrorMsgKey.AccountError}</Font></small></TD>
         </TR>
         <TR>	
             <TD align="RIGHT">密碼：</TD>
             <TD align="LEFT" ><input	type="password" name="psw"  size="16"></TD>
             <TD width='120'><small><Font color='red'  size="-1">${ErrorMsgKey.PswError}</Font></small></TD>
         </TR>            
         <TR>
             <TD align="CENTER" colspan='3'><Font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></TD>
             
         </TR>
            
        <TR>
            <TD colspan="2" align="center">      <input type="submit" value="提交"> </TD>
            </TR>
         </Table>
 </Form>
  <div class="st2">
      <a href="index.jsp">返回首頁</a>
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