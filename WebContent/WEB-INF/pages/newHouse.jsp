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
          
            
          
            <form action="<c:url value='inserthouse' />" method="POST" class="p-5 bg-white border" enctype="multipart/form-data">
			  <button type="button" class="btn btn-primary  py-2 px-4 rounded-0" onclick="demo()">DEMO</button>
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
                  <select id="city" name="city" class="form-control" OnChange="clickcity(this)">
　					<option value="台北市">台北市</option>
　					<option value="新北市">新北市</option>
				  </select>
				  <select id="dist" name="dist" class="form-control">
				
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
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="room">房:</label>
                  <select id="room" name="room" class="form-control">
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option> 
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
				  </select>
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="hall">廳:</label>
                  <select id="hall" name="hall" class="form-control">
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option> 
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
				  </select>
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="bath">衛:</label>
                  <select id="bath" name="bath" class="form-control">
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option> 
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
				  </select>
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="mrt">鄰近捷運站:</label>
                  <select id="mrt" name="mrt" class="form-control">
                  	<c:forEach var="mrtst" items="${mrtlist}">
						<option value="${mrtst.pk}">${mrtst.linename}-${mrtst.stationname}</option>
                  	</c:forEach>
				  </select>
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="picture1">上傳圖片1:</label>
                  <input type="file" id="picture1" name="picture1" accept=".jpg" class="form-control">
                </div>
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="p1">預覽圖片1:</label>
                  <img id="p1"/>
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="picture2">上傳圖片2:</label>
                  <input type="file" id="picture2" name="picture2" accept=".jpg" class="form-control">
                </div>
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="p2">預覽圖片2:</label>
                  <img id="p2"/>
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="picture3">上傳圖片3:</label>
                  <input type="file" id="picture3" name="picture3" accept=".jpg" class="form-control">
                </div>
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="p3">預覽圖片3:</label>
                  <img id="p3"/>
                </div>
              </div>
				
<!--               <div class="row form-group"> -->
<!--                 <div class="col-md-12"> -->
<!--                   <label class="font-weight-bold" for="detail">詳細資料</label>  -->
<!--                   <textarea name="message" id="detail" name="detail" cols="30" rows="5" maxlength="200" class="form-control"></textarea> -->
<!--                 </div> -->
<!--               </div> -->
              
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
  <script>
	 let dctl = document.getElementById("city");
	 let dctv = dctl.value;
	 console.log(dctv);
	 let ddt = ["北投區", "士林區", "內湖區", "中山區", "松山區", "大同區", "萬華區", "中正區", "大安區",
			"信義區", "南港區", "文山區"];
	 let ddist = document.getElementById("dist");
	 if(dctv=="台北市"){
		 ddist.options.length=0;
			for(let k=0;k<ddt.length;k++){
				ddist.add(new Option(ddt[k],ddt[k]));
	  		}
	 }
	 
	 
  
  	function clickcity(clicked){
  		let ctvl = clicked.value;
  		let dist = document.getElementById("dist");
  		let tpdt = ["北投區", "士林區", "內湖區", "中山區", "松山區", "大同區", "萬華區", "中正區", "大安區",
  			"信義區", "南港區", "文山區"];
		let ntpdt = [ "板橋區", "中和區", "新莊區", "土城區", "汐止區", "鶯歌區", "淡水區", "五股區", "林口區",
			"深坑區", "坪林區", "石門區", "萬里區", "雙溪區", "烏來區", "三重區", "永和區", "新店區", "蘆洲區",
			"樹林區", "三峽區", "瑞芳區", "泰山區", "八里區", "石碇區", "三芝區", "金山區", "平溪區", "貢寮區" ];
  		if(ctvl=="台北市"){
  	  		dist.options.length=0;
  			for(let x=0;x<tpdt.length;x++){
				dist.add(new Option(tpdt[x],tpdt[x]));
  	  		}
  		}
  		if(ctvl=="新北市"){
  	  		dist.options.length=0;
	  		for(let y=0;y<ntpdt.length;y++){
				dist.add(new Option(ntpdt[y],ntpdt[y]));
  			}
  	  	}
  	}
  	
  	$('#picture1').change(function() {
  		$('#p1').attr('src', '');
  	  var file = $('#picture1')[0].files[0];
  	  var reader = new FileReader;
  	  reader.onload = function(e) {
  	    $('#p1').attr('src', e.target.result);
  	  };
  	  reader.readAsDataURL(file);
  	});

  	$('#picture2').change(function() {
  		$('#p2').attr('src', '');
    	  var file = $('#picture2')[0].files[0];
    	  var reader = new FileReader;
    	  reader.onload = function(e) {
    	    $('#p2').attr('src', e.target.result);
    	  };
    	  reader.readAsDataURL(file);
    	});

  	$('#picture3').change(function() {
  		$('#p3').attr('src', '');
    	  var file = $('#picture3')[0].files[0];
    	  var reader = new FileReader;
    	  reader.onload = function(e) {
    	    $('#p3').attr('src', e.target.result);
    	  };
    	  reader.readAsDataURL(file);
    	});
  	function demo(){
  		document.getElementById("title").value="士林區劍潭公園美廈";
  		document.getElementById("tprice").value="3100";
  		document.getElementById("ping").value="49.07";
  		document.getElementById("apart").value="新都里";
  		document.getElementById("city").value="台北市";
  		document.getElementById("dist").value="士林區";
  		document.getElementById("addr").value="劍潭路";
  		document.getElementById("room").value="2";
  		document.getElementById("hall").value="2";
  		document.getElementById("bath").value="2";
  		document.getElementById("mrt").value="38";
  	}
	
  </script>

  
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