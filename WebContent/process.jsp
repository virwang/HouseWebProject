<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
    <link rel="stylesheet" href="css/_08_css/aos.css">
    <link rel="stylesheet" href="css/_08_css/style.css">
    <link rel="stylesheet" href="css/_08_css/bootstrap.css">
    <link rel="stylesheet" href="css/_08_css/line-awesome.css">
    <link rel="stylesheet" href="css/_08_css/owl.carousel.css">
  </head>
  <body>
  
  <div class="site-loader"></div>
    
  
  <div class="site-wrap">

    <div class="site-mobile-menu">
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
                <li ><a href="logout.do" >會員登出</a></li> 
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

    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(images/hero_bg_2.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
          <div class="col-md-10">
            <h1 class="mb-2">購屋流程</h1>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section site-portfolio">
      <div class="container">
        <div class="row mb-5 align-items-center">
          <div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up">
            <h2>購屋流程</h2>
            <p class="mb-0">準備 &amp; 須知</p>
          </div>
          <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100">
            <div id="filters" class="filters">
              <a href="#" data-filter="*" class="active">流程</a>
              <a href="#" data-filter=".web">簽約</a>
              <a href="#" data-filter=".design">房貸</a>
              <a href="#" data-filter=".branding">稅務</a>
              <a href="#" data-filter=".photography">小知識</a>
            </div>
          </div>
        </div>
        <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
          <div class="item web col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>流程</h3>
                <span>購屋完整流程</span>
              </div>
              <img class="img-fluid" src="css/_08_css/images/1.jpg">
            </a>
          </div>
          <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>簽約</h3>
                <span>應備文件</span>
              </div>
              <img class="img-fluid" src="css/_08_css/images/2.jpg">
            </a>
          </div>
          <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>房屋貸款</h3>
                <span>房貸估價試算</span>
              </div>
              <img class="img-fluid" src="css/_08_css/images/3.jpg">
            </a>
          </div>
          <div class="item design col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>稅務</h3>
                <span>相關稅費</span>
              </div>
              <img class="img-fluid" src="css/_08_css/images/4.jpg">
            </a>
          </div>
          <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>點交</h3>
                <span>驗屋注意事項</span>
              </div>
              <img class="img-fluid" src="css/_08_css/images/5.jpg">
            </a>
          </div>
          <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>法律小知識</h3>
                <span>地政士諮詢</span>
              </div>
              <img class="img-fluid" src="css/_08_css/images/6.jpg">
          </div>
        </div>
      </div>
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
  <script src="css/_08_css/aos.js"></script>
  <script src="css/_08_css/owl.carousel.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>