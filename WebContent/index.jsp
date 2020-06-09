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
  			font-family: 微軟正黑體;
  	}
  </style>
</head>

<body>

  <div class="site-loader"></div>

  <div class="site-wrap">
     <jsp:include page="/navibar.jsp" />
  </div>

  <div class="slide-one-item home-slider owl-carousel" style="font-family:DFKai-sb;">

    <div class="site-blocks-cover overlay" style="background-image: url(images/house1.jpg);" data-aos="fade"
      data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
          <div class="col-md-10">
            <!-- <span class="d-inline-block bg-success text-white px-3 mb-3 property-offer-type rounded">出租</span> -->
            <span class="d-inline-block bg-danger text-white px-3 mb-3 property-offer-type rounded">賣房</span>
            <h1 class="mb-2">碧波白</h1>
            <p class="mb-5"><strong class="h2 text-success font-weight-bold">$2,250,500</strong></p>
            <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">詳細資訊</a></p>
          </div>
        </div>
      </div>
    </div>

    <div class="site-blocks-cover overlay" style="background-image: url(images/house2.jpg);" data-aos="fade"
      data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
          <div class="col-md-10">
            <span class="d-inline-block bg-danger text-white px-3 mb-3 property-offer-type rounded">賣房</span>
            <h1 class="mb-2">美河市</h1>
            <p class="mb-5"><strong class="h2 text-success font-weight-bold">$1,000,500</strong></p>
            <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">詳細資訊</a></p>
          </div>
        </div>
      </div>
    </div>

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


  <div class="site-section site-section-sm pb-0">
    <div class="container">
      <div class="row">
        <form class="form-search col-md-12" style="margin-top: -100px;">
          
          <div class="row  align-items-end">
            <div class="col-md-3">
              <label for="list-types">選擇捷運路線</label>
              <div class="select-wrap">
                <span class="icon icon-arrow_drop_down"></span>
                <select name="list-types" id="list-types" class="form-control d-block rounded-0">
                  <option value="">淡水象山線(紅線)</option>
                  <option value="">中和新蘆線(橘線)</option>
                  <option value="">環狀線(黃線)</option>
                  <option value="">松山新店(綠線)</option>
                  <option value="">板南線(藍線)</option>
                  <option value="">文湖線(棕線)</option>
                  <option value="">桃園機場線(紫線)</option>
                  <option value="">淡水輕軌</option>
                  <!-- <optioon value=""></optioon> -->
                </select>
              </div>
            </div>
            <div class="col-md-3">
              <label for="offer-types">選擇地區</label>
              <div class="select-wrap">
                <span class="icon icon-arrow_drop_down"></span>
                <select name="offer-types" id="offer-types" class="form-control d-block rounded-0">
                  <option value="">中正區</option>
                  <option value="">信義區</option>
                  <option value="">大安區</option>
                  <option value="">文山區</option>
                </select>
              </div>
            </div>
            <div class="col-md-3">
              <label for="select-city">選擇學校</label>
              <div class="select-wrap">
                <span class="icon icon-arrow_drop_down"></span>
                <select name="select-city" id="select-city" class="form-control d-block rounded-0">
                  <option value="">國小</option>
                  <option value="">國中</option>
                  <option value="">高中</option>
                  <option value="">大學</option>
                </select>
              </div>
            </div>
            <div class="col-md-3">
              <input type="submit" class="btn btn-success text-white btn-block rounded-0" value="Search">
            </div>
          </div>
        </form>
      </div>

      <div class="row">
        <div class="col-md-12">
          <div class="view-options bg-white py-3 px-3 d-md-flex align-items-center">
            <div class="mr-auto">
              <a href="index.html" class="icon-view view-module"><span class="icon-view_module"></span></a>
              <a href="view-list.html" class="icon-view view-list active"><span class="icon-view_list"></span></a>

            </div>
            <div class="ml-auto d-flex align-items-center">
              <div>
                <a href="#" class="view-list px-3 border-right active">全部</a>
                <!-- <a href="#" class="view-list px-3 border-right">出租</a> -->
                <a href="#" class="view-list px-3">賣房</a>
              </div>


              <div class="select-wrap">
                <span class="icon icon-arrow_drop_down"></span>
                <select class="form-control form-control-sm d-block rounded-0">
                  <option value="">排序依據</option>
                  <option value="">價格低至高</option>
                  <option value="">價格高至低</option>
                </select>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>

  <div class="site-section site-section-sm bg-light">
    <div class="container">


      <div class="row mb-4">
        <div class="col-md-12">
          <div class="property-entry horizontal d-lg-flex">

            <a href="#" class="property-thumbnail h-100">
              <div class="offer-type-wrap">
                <span class="offer-type bg-danger">賣</span>
                <!-- <span class="offer-type bg-success">租</span> -->
              </div>
              <img src="images/house1.jpg" alt="Image" class="img-fluid">
            </a>

            <div class="p-4 property-body">
<!--               <a href="#" class="property-favorite"><span class="icon-heart-o"></span></a> -->
              <h2 class="property-title"><a href="#"> 231　新北市　新店區</a></h2>
              <span class="property-location d-block mb-3"><span class="property-icon icon-room"></span>  231　新北市　新店區　北新路一段　79號</span>
              <strong class="property-price text-primary mb-3 d-block text-success">$65.2萬/坪</strong>
              <p>交通動線佳, 有休閒設施, 熱鬧商圈, 社區機能成型, 強調建築外觀, 社區統一管理, SRC結構, 自地自建, 面臨主幹道或次要幹道, 鄰河川, 標準樓層。</p>
              <ul class="property-specs-wrap mb-3 mb-lg-0">
                <li>
                  <span class="property-specs">房間</span>
                  <span class="property-specs-number">2 <sup>+</sup></span>

                </li>
                <li>
                  <span class="property-specs">廳</span>
                  <span class="property-specs-number">2</span>

                </li>
                <li>
                  <span class="property-specs">坪數</span>
                  <span class="property-specs-number">50</span>
                    
                </li>
              </ul>
            </div>

          </div>
        </div>
      </div>

      <div class="row mb-4">
        <div class="col-md-12">
          <div class="property-entry horizontal d-lg-flex">

            <a href="#" class="property-thumbnail h-100">
              <div class="offer-type-wrap">
                <span class="offer-type bg-danger">賣</span>
                <!-- <span class="offer-type bg-success">Rent</span> -->
              </div>
              <img src="images/house6.jpg" alt="Image" class="img-fluid">
            </a>

            <div class="p-4 property-body">
<!--               <a href="#" class="property-favorite active"><span class="icon-heart-o"></span></a> -->
              <h2 class="property-title"><a href="#">116 台北市 文山區</a></h2>
              <span class="property-location d-block mb-3"><span class="property-icon icon-room"></span> 116 台北市 文山區 木柵路 三段 85巷</span>
              <strong class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
              <p>久康街的靜巷氛圍有一種屬於自己的悠閒節奏，從百年木柵國小走到久康公園，感受醇厚人文味，綠蔭掩靜巷，漫步出街巷即是木柵路精華商圈、3分鐘到木柵老街漫步人文時光，與政大生活圈保持最美的距離，信義大安敦南轉個彎8分鐘，生活好近，來到這裡，重拾好生活。</p>
              <ul class="property-specs-wrap mb-3 mb-lg-0">
                <li>
                  <span class="property-specs">房</span>
                  <span class="property-specs-number">2 <sup>+</sup></span>

                </li>
                <li>
                  <span class="property-specs">廳</span>
                  <span class="property-specs-number">1</span>

                </li>
                <li>
                  <span class="property-specs">坪數</span>
                  <span class="property-specs-number">20</span>

                </li>
              </ul>
            </div>

          </div>
        </div>
      </div>

      <div class="row mb-4">
        <div class="col-md-12">
          <div class="property-entry horizontal d-lg-flex">

            <a href="#" class="property-thumbnail h-100">
              <div class="offer-type-wrap">
                <span class="offer-type bg-danger">賣</span>
                <!-- <span class="offer-type bg-success">Rent</span> -->
              </div>
              <img src="images/house4.jpg" alt="Image" class="img-fluid">
            </a>

            <div class="p-4 property-body">
<!--               <a href="#" class="property-favorite"><span class="icon-heart-o"></span></a> -->
              <h2 class="property-title"><a href="#">231 新北市 新店區</a></h2>
              <span class="property-location d-block mb-3"><span class="property-icon icon-room"></span> 853 S Lucerne
                新店路263號-3 六樓 6號</span>
              <strong class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
              <p>新店捷運總站，到站即到家，鄰碧潭風景區，休閒運動好去處。公設齊全，管理佳，採光通風，遠看碧潭美景，生活機能佳</p>
              <ul class="property-specs-wrap mb-3 mb-lg-0">
                <li>
                  <span class="property-specs">房</span>
                  <span class="property-specs-number">3 <sup>+</sup></span>

                </li>
                <li>
                  <span class="property-specs">廳</span>
                  <span class="property-specs-number">2</span>

                </li>
                <li>
                  <span class="property-specs">坪</span>
                  <span class="property-specs-number">50</span>

                </li>
              </ul>
            </div>

          </div>
        </div>
      </div>

      <div class="row mb-4">
        <div class="col-md-12">
          <div class="property-entry horizontal d-lg-flex">

            <a href="#" class="property-thumbnail h-100">
              <div class="offer-type-wrap">
                <span class="offer-type bg-danger">賣</span>
                <!-- <span class="offer-type bg-success">Rent</span> -->
              </div>
              <img src="images/house5.jpg" alt="Image" class="img-fluid">
            </a>

            <div class="p-4 property-body">
<!--               <a href="#" class="property-favorite"><span class="icon-heart-o"></span></a> -->
              <h2 class="property-title"><a href="#">231 新北市 新店區</a></h2>
              <span class="property-location d-block mb-3"><span class="property-icon icon-room"></span> 
              231 新北市 新店區 央北二路</span>
              <strong class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
              <p>央北重劃區東起中央路、南鄰中央新村、北至央北三路、西望溪園路，占地將近40公頃，設有一座中央公園及多處的小型鄰里公園，同時因緊鄰新店溪，另有小碧潭及陽光兩座既有河濱公園可利用。</p>
              <ul class="property-specs-wrap mb-3 mb-lg-0">
                <li>
                  <span class="property-specs">房</span>
                  <span class="property-specs-number">4 <sup>+</sup></span>

                </li>
                <li>
                  <span class="property-specs">廳</span>
                  <span class="property-specs-number">3</span>

                </li>
                <li>
                  <span class="property-specs">坪數</span>
                  <span class="property-specs-number">80</span>

                </li>
              </ul>
            </div>

          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12">
          <div class="property-entry horizontal d-lg-flex">

            <a href="#" class="property-thumbnail h-100">
              <div class="offer-type-wrap">
                <!-- <span class="offer-type bg-info">Lease</span> -->
                <span class="offer-type bg-danger">賣</span>
              </div>
              <img src="images/house2.jpg" alt="Image" class="img-fluid">
            </a>

            <div class="p-4 property-body">
<!--               <a href="#" class="property-favorite"><span class="icon-heart-o"></span></a> -->
              <h2 class="property-title"><a href="#">853 S Lucerne Blvd</a></h2>
              <span class="property-location d-block mb-3"><span class="property-icon icon-room"></span> 853 S Lucerne
                Blvd Unit 101 Los Angeles, CA 90005</span>
              <strong class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem dolorem tenetur magni. Aspernatur odit
                rem repudiandae cumque tenetur enim consequuntur esse.</p>
              <ul class="property-specs-wrap mb-3 mb-lg-0">
                <li>
                  <span class="property-specs">房</span>
                  <span class="property-specs-number">2 <sup>+</sup></span>

                </li>
                <li>
                  <span class="property-specs">廳</span>
                  <span class="property-specs-number">2</span>

                </li>
                <li>
                  <span class="property-specs">坪數</span>
                  <span class="property-specs-number">5,500</span>

                </li>
              </ul>
            </div>

          </div>
        </div>
      </div>


      <div class="row mt-5">
        <div class="col-md-12 text-center">
          <div class="site-pagination">
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <span>...</span>
            <a href="#">10</a>
          </div>
        </div>
      </div>

    </div>
  </div>

  <div class="site-section">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-7 text-center">
          <div class="site-section-title">
            <h2>我們的服務:</h2>
          </div>
          <p>
            <ul>
              <li>
                <strong>
                購屋流程說明: 為首次買房的您提供詳盡的說明   
              </strong>
              </li>
              <li>
                看屋行程規劃: 省去您一個個輸入地址的麻煩
              </li>
            </ul>
          </p>
        </div>
      </div>
<!-- 
      <div class="row">
        <div class="col-md-6 col-lg-4">
          <a href="#" class="service text-center">
            <span class="icon flaticon-house"></span>
            <h2 class="service-heading">Research Subburbs</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt iure qui natus perspiciatis ex odio
              molestia.</p>
            <p><span class="read-more">Read More</span></p>
          </a>
        </div>
        <div class="col-md-6 col-lg-4">
          <a href="#" class="service text-center">
            <span class="icon flaticon-sold"></span>
            <h2 class="service-heading">Sold Houses</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt iure qui natus perspiciatis ex odio
              molestia.</p>
            <p><span class="read-more">Read More</span></p>
          </a>
        </div>
        <div class="col-md-6 col-lg-4">
          <a href="#" class="service text-center">
            <span class="icon flaticon-camera"></span>
            <h2 class="service-heading">Security Priority</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt iure qui natus perspiciatis ex odio
              molestia.</p>
            <p><span class="read-more">Read More</span></p>
          </a>
        </div>
      </div>
    </div>
  </div> -->

  <!-- <div class="site-section bg-light">
    <div class="container">
      <div class="row justify-content-center mb-5">
        <div class="col-md-7 text-center">
          <div class="site-section-title">
            <h2>Recent Blog</h2>
          </div>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis maiores quisquam saepe architecto error
            corporis aliquam. Cum ipsam a consectetur aut sunt sint animi, pariatur corporis, eaque, deleniti cupiditate
            officia.</p>
        </div>
      </div> -->
      <!-- <div class="row">
        <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="100">
          <a href="#"><img src="images/img_4.jpg" alt="Image" class="img-fluid"></a>
          <div class="p-4 bg-white">
            <span class="d-block text-secondary small text-uppercase">Jan 20th, 2019</span>
            <h2 class="h5 text-black mb-3"><a href="#">Art Gossip by Mike Charles</a></h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias enim, ipsa exercitationem veniam quae
              sunt.</p>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="200">
          <a href="#"><img src="images/img_2.jpg" alt="Image" class="img-fluid"></a>
          <div class="p-4 bg-white">
            <span class="d-block text-secondary small text-uppercase">Jan 20th, 2019</span>
            <h2 class="h5 text-black mb-3"><a href="#">Art Gossip by Mike Charles</a></h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias enim, ipsa exercitationem veniam quae
              sunt.</p>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="300">
          <a href="#"><img src="images/img_3.jpg" alt="Image" class="img-fluid"></a>
          <div class="p-4 bg-white">
            <span class="d-block text-secondary small text-uppercase">Jan 20th, 2019</span>
            <h2 class="h5 text-black mb-3"><a href="#">Art Gossip by Mike Charles</a></h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias enim, ipsa exercitationem veniam quae
              sunt.</p>
          </div>
        </div> -->

        <!-- <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="100">
            <a href="#"><img src="images/img_2.jpg" alt="Image" class="img-fluid"></a>
            <div class="p-4 bg-white">
              <span class="d-block text-secondary small text-uppercase">Jan 20th, 2019</span>
              <h2 class="h5 text-black mb-3"><a href="#">Art Gossip by Mike Charles</a></h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias enim, ipsa exercitationem veniam quae sunt, voluptatum reprehenderit deserunt illum rem.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="200">
            <a href="#"><img src="images/img_3.jpg" alt="Image" class="img-fluid"></a>
            <div class="p-4 bg-white">
              <span class="d-block text-secondary small text-uppercase">Jan 20th, 2019</span>
              <h2 class="h5 text-black mb-3"><a href="#">Art Gossip by Mike Charles</a></h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias enim, ipsa exercitationem veniam quae sunt, voluptatum reprehenderit deserunt illum rem.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="300">
            <a href="#"><img src="images/img_4.jpg" alt="Image" class="img-fluid"></a>
            <div class="p-4 bg-white">
              <span class="d-block text-secondary small text-uppercase">Jan 20th, 2019</span>
              <h2 class="h5 text-black mb-3"><a href="#">Art Gossip by Mike Charles</a></h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias enim, ipsa exercitationem veniam quae sunt, voluptatum reprehenderit deserunt illum rem.</p>
            </div>
          </div> -->

      </div>

    </div>
  </div>

  <div class="site-section">
    <div class="container">

      <div class="row justify-content-center mb-5">
        <div class="col-md-7 text-center">
          <div class="site-section-title">
            <h2>關於我們</h2>
          </div>
          <p>我們是一個五人團隊的團隊，來自各種不同的背景，平均年齡不到30歲。<br><strong>因為資策會，所以我們相遇了。</strong></p>
          <p>團隊裡面，有人曾經擔任過代書，有感於知名買賣租屋平台591及政府實價登入平台的複雜；<br>
            我們決定運用這四個月在資策會所學到的技能，創建一個更加平易近人、更簡化的購屋平台，<br>
            降低使用者在使用平台查詢相關訊息時所需的精力。<br>
          </p>
          <p><strong>隨心而居，找到理想的房子!是我們的理念!</strong></p>
        </div>
      </div>

      <div class="row justify-content-center" data-aos="fade" data-aos-delay="100">
        <div class="col-md-8">
          <div class="accordion unit-8" id="accordion">
            <div class="accordion-item">
              <h3 class="mb-0 heading">
                <a class="btn-block" data-toggle="collapse" href="#collapseOne" role="button" aria-expanded="true"
                  aria-controls="collapseOne">我們的團隊名稱:<span class="icon"></span></a>
              </h3>
              <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="body-text">
                  <p>我們的團隊名稱是:好家在。起源於五個在資策會上課的同伴。</p>
                </div>
              </div>
            </div> <!-- .accordion-item -->

            <div class="accordion-item">
              <h3 class="mb-0 heading">
                <a class="btn-block" data-toggle="collapse" href="#collapseTwo" role="button" aria-expanded="false"
                  aria-controls="collapseTwo">我需要付費嗎?<span class="icon"></span></a>
              </h3>
              <div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="body-text">
                  <p>
                    <ul>
                      <li>個人:免費</li>
                    <li>企業:3000元/月</li>
                  </ul>
                </p>
                </div>
              </div>
            </div> <!-- .accordion-item -->

            <div class="accordion-item">
              <h3 class="mb-0 heading">
                <a class="btn-block" data-toggle="collapse" href="#collapseThree" role="button" aria-expanded="false"
                  aria-controls="collapseThree">我需要加入會員嗎? <span class="icon"></span></a>
              </h3>
              <div id="collapseThree" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="body-text">
                  <p>成為我們的會員後，可以使用【我的最愛】功能，將您感興趣的房屋加入收藏，當您您想要在規劃看屋行程時，可以從我麼最愛裡面挑選您過去的收藏，並且可以直接匯入Google Map，讓您可以一次規劃完所有看屋的行程。</p>
                </div>
              </div>
            </div> <!-- .accordion-item -->

            <!-- <div class="accordion-item">
              <h3 class="mb-0 heading">
                <a class="btn-block" data-toggle="collapse" href="#collapseFour" role="button" aria-expanded="false"
                  aria-controls="collapseFour">Who should I contact in case of support.<span class="icon"></span></a>
              </h3>
              <div id="collapseFour" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="body-text">
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel ad laborum expedita. Nostrum iure
                    atque enim quisquam minima distinctio omnis, consequatur aliquam suscipit, quidem, esse aspernatur!
                    Libero, excepturi animi repellendus porro impedit nihil in doloremque a quaerat enim voluptatum,
                    perspiciatis, quas dignissimos maxime ut cum reiciendis eius dolorum voluptatem aliquam!</p>
                </div>
              </div> -->
            </div> <!-- .accordion-item -->

          </div>
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