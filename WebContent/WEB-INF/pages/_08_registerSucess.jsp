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
    .st3 {
        margin: auto;
        width: 300px;
        font-size: 20px;
    }
    
</style>
</head>

<body>

  <div class="site-loader"></div>

  <div class="site-wrap">

    <<div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->

    <div class="site-navbar mt-4">
      <div class="container py-1">
        <div class="row align-items-center">
          <div class="col-8 col-md-8 col-lg-4">
            <h1 class="mb-0"><a href="index.jsp" class="text-white h2 mb-0"><strong>隨心居-想住哪就住哪<span
                    class="text-danger">.</span></strong></a></h1>
          </div>
          <div class="col-4 col-md-4 col-lg-8">
            <nav class="site-navigation text-right text-md-right" role="navigation">

              <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3"><a href="#"
                  class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a></div>

              <ul class="site-menu js-clone-nav d-none d-lg-block">
                <!-- <li class="active">
                    <a href="index.html">首頁</a>
                  </li> -->
                <li><a href="view-list-search.jsp">房屋(台北)</a></li>
                <li><a href="NewTaipeiSV">房屋(新北)</a></li>
                <!-- <li><a href="rent.html">租房</a></li> -->
                <li><a href="news.do">地方新聞</a></li>                      
                <li><a href="process.jsp">購屋流程</a></li>                
<!--                 <li><a href="mylove.html">我的收藏</a></li> -->
                <c:if test="${empty LoginOK}">
                <li><a href="_08_registerMember.jsp">會員註冊</a></li> 
                <li><a href="_08_login.jsp">會員登入</a></li> 
                </c:if>
                <c:if test="${!empty LoginOK}">
                <li><a href="springlogout.do" >會員登出</a></li> 
                <li><a href="memberData.do?ACCT=${LoginOK3}">你好，${LoginOK2}</a></li>
                </c:if>
                <!-- <li><a href="contact.html">聯絡我們</a></li> -->
              </ul>
            </nav>
          </div>


        </div>
      </div>
    </div>
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
  <div class="st1">您已成功註冊，隨心居-想住哪就住哪，歡迎您的加入</div>
  <div class="st3">會員 ${ memberBean.name } 的資料新增成功<br></div>
<div class="st3">編號: ${ memberBean.account }<br></div>
<div class="st3">手機: ${ memberBean.tel }<br></div>
<div class="st3">生日: ${ memberBean.email }<br></div>
<div class="st3">註冊時間: ${ memberBean.registerDate }<br></div>
  <div class="st2">
      <a href="index.jsp">返回首頁</a>
  </div>

  <footer class="site-footer">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="mb-5">
            <h3 class="footer-heading mb-4">關於隨心居</h3>
            <p></p>
          </div>



        </div>
        <div class="col-lg-4 mb-5 mb-lg-0">
          <div class="row mb-5">
            <div class="col-md-12">
              <h3 class="footer-heading mb-4">Navigations</h3>
            </div>         
            <div class="col-md-6 col-lg-6">
              <ul class="list-unstyled">
                <li><a href="#">關於我們</a></li>
                <li><a href="#">隱私條款</a></li>
                <li><a href="#">聯絡我們</a></li>
              </ul>
            </div>
          </div>


        </div>

        <div class="col-lg-4 mb-5 mb-lg-0">
          <h3 class="footer-heading mb-4">關注我們</h3>

          <div>
            <a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
            <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
            <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
            <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
          </div>



        </div>

      </div>
      <div class="row pt-5 mt-5 text-center">
        <div class="col-md-12">
          <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;
            <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
            <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with
            <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com"
              target="_blank">好家在</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
        </div>

      </div>
    </div>
  </footer>

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