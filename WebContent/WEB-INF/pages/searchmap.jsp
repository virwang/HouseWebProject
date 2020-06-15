<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <link rel="stylesheet" href="leaflet/leaflet.css" />
  <script src="leaflet/leaflet.js"></script>
  
  <style>
  		body{
  			font-family: 微軟正黑體;
  		}
   		#content{
    		float:left;   
 			margin-left:150px;
 			margin-right:100px;
 			margin-bottom:100px;
   		} 
        #mapid{
        	 float: left;
             height:500px;
             width: 1000px;

        }
       
        .sidest{


        }
/*         #content{ */
/*         	margin:0 auto; */
/*         } */
        #footer{
        	 clear:both;
        }
/*         #lb{ */
/*         	height:50px; */
/* /*          margin:auto; */ 
/*         } */
        #lb ul{
        	height:50px;
        	overflow: hidden;
        	list-style: none;
        	padding: 0;
  			margin: 0;
        	
        }
        #lb li{
        	float: left;
        	height:50px;
        	width:199px;
        	margin-right: 1px;
        	padding-bottom: 1px;
        	background-color: #333;
        	color: #FFF;
        	text-align:center;
        	font-size: 25px;
        	font-weight:bold;
        	line-height:50px;
        }
         #sb{
          	 float:left;
         	 width:200px;
         	 height:500px;
        	 padding-bottom: 50px;
			 background-color: #555;
         	 overflow:scroll;
         	 overflow-x: auto;
        	
        }
        #sb ul{
        	list-style: none;
        	padding: 0;
  			margin: 0;
  			
        }
        #sb li{
        	 padding: 20px;
    		 color: #ccc;
    		 margin-top: 1px;
    		 margin-bottom: 1px;
    		 border: 10px solid transparent;
    		 background-color: #333;
    		 color: #FFF;
   		 	 font-size: 25px;
   		 	 font-weight:bold;
   		 	 text-align:center;
        }
        
    </style>

</head>

<body>

  <div class="site-loader"></div>


  <div class="site-wrap">
    <jsp:include page="/navibar.jsp" />
  </div>

  <div class="site-blocks-cover inner-page-cover overlay" data-aos="fade" data-stellar-background-ratio="0.5">
    <div class="container">
      <div class="row align-items-center justify-content-center text-center">
        <div class="col-md-10">
          <h1 class="mb-2">房屋地圖</h1>
        </div>
      </div>
    </div>
  </div>

  <div class="site-section" >
  
    <div id="content">
    
      <div id="lb">
      	<ul>
      		<li id='line1' onClick="line_click(this)" value="BR">文湖線</li>
      		<li id='line2' onClick="line_click(this)" value="R">淡水信義線</li>
      		<li id='line3' onClick="line_click(this)" value="G">松山新店線</li>
      		<li id='line4' onClick="line_click(this)" value="O">中和新蘆線</li>
      		<li id='line5' onClick="line_click(this)" value="BL">板南線</li>
      		<li id='line6' onClick="line_click(this)" value="Y">環狀線</li>
      	</ul>
      </div>
    
      <div>
      
        <div id="mapid">
        
        </div>
      
      </div>	
        <div id="sb">
	  	    <ul id="mrtst">
	  	  	
	  	    </ul>

        </div>
	  
	  

    </div>
    
    
  </div>


  <jsp:include page="/footer.jsp" />


  <script>
    //按下路線按紐
    function line_click(clicked) {
      var linecode = clicked.getAttribute("value");
      var stations = document.getElementById("mrtst");
      var lineb = document.getElementById("lb").getElementsByTagName("li");
      for(let q=0;q<lineb.length;q++){
    	  lineb[q].style.backgroundColor='#333';
      }
	  clicked.style.backgroundColor='#AE57A4';
	  
      var content = "";
      stations.innerHTML = content;
      console.log("linecode:" + linecode);
      let xhr2 = new XMLHttpRequest();
      xhr2.open("GET", "<c:url value='mrtlinepoint'/>" + "?linecode=" + linecode, true);
      xhr2.send();
      xhr2.onreadystatechange = function () {
        console.log(xhr2.readyState);
        if (xhr2.readyState == 4 && xhr2.status == 200) {
          let linestation = JSON.parse(xhr2.responseText);
          for (let j = 0; j < linestation.length; j++) {
//             console.log(linestation[j].stationname);
            var stbtn = document.createElement("li");
            stbtn.setAttribute("id", "station" + j);
            stbtn.setAttribute("value", linestation[j].pk);
            stbtn.setAttribute("onClick", "station_click(this)");
            var t = document.createTextNode(linestation[j].stationname);
            stbtn.appendChild(t);
            stations.appendChild(stbtn);
          }
        }
      }
    }

    //按下站點按紐
    function station_click(clicked) {
      var stateb = document.getElementById("sb").getElementsByTagName("li");
      for(let q=0;q<stateb.length;q++){
    	  stateb[q].style.backgroundColor='#333';
      }
  	  clicked.style.backgroundColor='#AE57A4';
      //清空所有layergroup中的物件
      layergroup.clearLayers();
      let stationpk = clicked.value;
      console.log("stationpk:" + stationpk);
      var hpoint;
      let xhr3 = new XMLHttpRequest();
      xhr3.open("GET", "<c:url value='stationhouse'/>" + "?stationpk=" + stationpk, true);
      xhr3.send();
      xhr3.onreadystatechange = function () {
        console.log(xhr3.readyState);
        if (xhr3.readyState == 4 && xhr3.status == 200) {
          let housepoint = JSON.parse(xhr3.responseText);
          console.log(housepoint);
          let stpt = housepoint.mrt;
          console.log(stpt);
          //該捷運站點變色
          let slmrtpt = L.circle([stpt.lat, stpt.lon], {
            color: 'white',
            fillColor: '#0000AA',
            fillOpacity: 1,
            radius: 50
          }).addTo(layergroup);
          slmrtpt.bindPopup("<b>" + stpt.stationname + "站</b>").openPopup();
          //地圖中心點飛至該捷運站點
          map.flyTo([stpt.lat, stpt.lon], 15);
          let hpt = housepoint.hlist;
          for (let k = 0; k < hpt.length; k++) {
            console.log(hpt[k].title);
            //將marker加入layergroup
            hpoint = L.marker([hpt[k].lat, hpt[k].lon]).addTo(layergroup);
            hpoint.bindPopup("<b>" + hpt[k].title + "</b><br>"
              + hpt[k].city + hpt[k].dist + hpt[k].address + "("
              + "<a href='" + "<c:url value='housedetail?HOUSEID=" + hpt[k].id + "'/>'>" +
              "連結" + "</a>" + ")");
          }
        }
      }
    }

    //讀取捷運站點
//      window.onload= function(){
    var mrtData = [];
    var map = L.map('mapid', {
      center: [25.0462237096147, 121.517455589434],
      zoom: 14
    });
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    var layergroup = L.layerGroup().addTo(map);
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "<c:url value='searchmapjson'/>", true);
    xhr.send();
    xhr.onreadystatechange = function () {
      console.log(xhr.readyState);
      if (xhr.readyState == 4 && xhr.status == 200) {
        let mrtlist = JSON.parse(xhr.responseText);
        for (let i = 0; i < mrtlist.length; i++) {
          var mrtpoint = L.circle([mrtlist[i].lat, mrtlist[i].lon], {
            color: 'white',
            fillColor: '#f03',
            fillOpacity: 0.5,
            radius: 50
          }).addTo(map);
        }

      }

    };





    //捷運文湖線
    let BRLines = [{
      "type": "LineString",
      "coordinates": [
        [121.57981, 24.998282],
        [121.573418, 24.998189],
        [121.568307, 24.998664],
        [121.557849, 24.999349],
        [121.556875, 25.00508],
        [121.558392, 25.018343],
        [121.552814, 25.023746],
        [121.543613, 25.026109],
        [121.543973, 25.033134],
        [121.543326, 25.041492],
        [121.544295, 25.052028],
        [121.543942, 25.060776],
        [121.551946, 25.063194],
        [121.546619, 25.079576],
        [121.55395, 25.084129],
        [121.567304, 25.082017],
        [121.575516, 25.080153],
        [121.584616, 25.078329],
        [121.594238, 25.083787],
        [121.602626, 25.08338],
        [121.607114, 25.072577],
        [121.611604, 25.067167],
        [121.616061, 25.060047],
        [121.617613, 25.055351],
      ]
    }];
    var BRStyle = {
      "color": "#9F5000",
      "weight": 5,
      "opacity": 0.65
    };
    L.geoJSON(BRLines, {
      style: BRStyle
    }).addTo(map);

    //捷運淡水信義線
    let RLines = [{
      "type": "LineString",
      "coordinates": [
        [121.57, 25.032464],
        [121.563709, 25.032704],
        [121.551996, 25.033037],
        [121.542337, 25.033207],
        [121.536566, 25.033252],
        [121.529439, 25.033693],
        [121.518085, 25.032578],
        [121.515793, 25.040942],
        [121.517665, 25.047068],
        [121.520266, 25.052442],
        [121.52055, 25.057797],
        [121.519486, 25.062635],
        [121.520064, 25.070773],
        [121.525165, 25.083574],
        [121.526266, 25.092369],
        [121.52263, 25.102162],
        [121.51913, 25.109303],
        [121.515171, 25.115006],
        [121.506413, 25.120863],
        [121.500948, 25.126152],
        [121.498136, 25.132122],
        [121.503383, 25.137048],
        [121.498136, 25.132122],
        [121.485312, 25.137682],
        [121.473239, 25.131175],
        [121.467239, 25.125895],
        [121.4596753, 25.13697113],
        [121.4590104, 25.1544886],
        [121.4455543, 25.16823193],
      ]
    }];

    var RStyle = {
      "color": "#FF0000",
      "weight": 5,
      "opacity": 0.65
    };

    L.geoJSON(RLines, {
      style: RStyle
    }).addTo(map);

    //捷運松山信義線
    let GLines = [{
      "type": "LineString",
      "coordinates": [
        [121.537768, 24.957888],
        [121.541099, 24.967454],
        [121.543113, 24.975013],
        [121.529914, 24.973113],
        [121.543113, 24.975013],
        [121.541457, 24.983615],
        [121.540663, 24.99318],
        [121.538522, 25.002547],
        [121.534193, 25.014575],
        [121.52769, 25.02061],
        [121.523252, 25.02556],
        [121.518085, 25.032578],
        [121.511048, 25.035275],
        [121.508736, 25.041803],
        [121.510162, 25.049556],
        [121.519382, 25.053025],
        [121.532728, 25.052743],
        [121.544295, 25.052028],
        [121.552505, 25.05143],
        [121.564701, 25.051657],
        [121.577851, 25.05054],
      ]
    }];

    var GStyle = {
      "color": "	#006000",
      "weight": 5,
      "opacity": 0.65
    };

    L.geoJSON(GLines, {
      style: GStyle
    }).addTo(map);

    //捷運中和新蘆線
    let OLines = [{
      "type": "LineString",
      "coordinates": [
        [121.509743, 24.98961],
        [121.504567, 24.993764],
        [121.510952, 25.002364],
        [121.51549, 25.013021],
        [121.523252, 25.02556],
        [121.529439, 25.033693],
        [121.533119, 25.042058],
        [121.532728, 25.052743],
        [121.532809, 25.060515],
        [121.526854, 25.062832],
        [121.519486, 25.062635],
        [121.513126, 25.063229],
        [121.49685, 25.070565],
        [121.486525, 25.077063],
        [121.479849, 25.080471],
        [121.472667, 25.085687],
        [121.464707, 25.091377],
        [121.472667, 25.085687],
        [121.479849, 25.080471],
        [121.486525, 25.077063],
        [121.49685, 25.070565],
        [121.513126, 25.063229],
        [121.500907, 25.06323],
        [121.49132, 25.059574],
        [121.484491, 25.055649],
        [121.471568, 25.046514],
        [121.460733, 25.039628],
        [121.452492, 25.036364],
        [121.435106, 25.032974],
        [121.42221, 25.028961],
        [121.410871, 25.021664],
      ]
    }];

    var OStyle = {
      "color": "#FF9224",
      "weight": 5,
      "opacity": 0.65
    };

    L.geoJSON(OLines, {
      style: OStyle
    }).addTo(map);

    //捷運板南線
    let BLLines = [{
      "type": "LineString",
      "coordinates": [
        [121.419574, 24.959567],
        [121.43559, 24.96609],
        [121.443752, 24.972786],
        [121.4494847, 24.98661959],
        [121.452955, 24.999374],
        [121.458555, 25.008034],
        [121.462264, 25.013961],
        [121.46813, 25.024205],
        [121.472211, 25.029575],
        [121.499448, 25.035885],
        [121.508736, 25.041803],
        [121.517665, 25.047068],
        [121.523519, 25.044597],
        [121.533119, 25.042058],
        [121.544952, 25.041776],
        [121.551692, 25.041298],
        [121.55786, 25.041159],
        [121.564775, 25.040956],
        [121.576494, 25.041025],
        [121.583029, 25.045311],
        [121.593766, 25.050616],
        [121.606488, 25.051872],
        [121.616822, 25.054875],
      ]
    }];

    var BLStyle = {
      "color": "#005AB5",
      "weight": 5,
      "opacity": 0.65
    };

    L.geoJSON(BLLines, {
      style: BLStyle
    }).addTo(map);

    //捷運環狀線
    let YLines = [{
      "type": "LineString",
      "coordinates": [
        [121.541457, 24.983615],
        [121.5276, 24.984655],
        [121.524837, 24.990645],
        [121.515774, 24.991998],
        [121.504567, 24.993764],
        [121.49651, 25.002227],
        [121.49035, 25.004828],
        [121.484147, 25.008386],
        [121.472455, 25.01424],
        [121.464812, 25.015233],
        [121.466946, 25.025862],
        [121.460507, 25.039866],
        [121.460254, 25.049945],
        [121.459606, 25.061494],
      ]
    }];

    var YStyle = {
      "color": "#F2FF00",
      "weight": 5,
      "opacity": 0.65
    };

    L.geoJSON(YLines, {
      style: YStyle
    }).addTo(map);
//     };



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