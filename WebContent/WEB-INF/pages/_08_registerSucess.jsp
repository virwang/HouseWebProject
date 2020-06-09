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
   body {
	background-color: #333333;
	font-family:微軟正黑體;
	font-size:18px;
	color:#ffffff;
}
    .st1 {
      text-align: center;
        margin: auto;
        margin-top: 150px;
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
    .st3 {
        margin: auto;
        width: 500px;
        font-size: 30px;
    }
    
</style>
</head>

<body>

  <div class="site-loader"></div>

  <div class="site-wrap">
	<jsp:include page="/navibar.jsp" />
  </div>

  <div class="slide-one-item home-slider owl-carousel">
  </div>
<fieldset >
  <div class="st1">您已成功註冊，好家在-想住哪就住哪，歡迎您的加入</div>
  <div class="st3">會員 ${ memberBean.name } 的資料新增成功<br></div>
<div class="st3">帳號: ${ memberBean.account }<br></div>
<div class="st3">手機: ${ memberBean.tel }<br></div>
<div class="st3">E-Mail: ${ memberBean.email }<br></div>
<div class="st3">註冊時間: ${ memberBean.registerDate }<br></div>
</fieldset>
<!--   <div class="st2"> -->
<!--       <a href="index.jsp">返回首頁</a> -->
<!--   </div> -->

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