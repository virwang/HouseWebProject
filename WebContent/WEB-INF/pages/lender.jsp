<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css//bootstrap.min.css">
<link rel="stylesheet" href="css/_08_css/jquery.dataTables.min.css">
<title>Document</title>
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
	background: #f5f6fb;
	font-family:微軟正黑體;
	font-size:18px;
}

.risk {
	width: 800px;
	margin: auto;
	margin-top: 1rem;
	color: #333;
	font-size: 1.3rem;
}

.risk .select ul li {
	display: none;
}

.risk .select ul li.active {
	display: block;
}

.risk .select ul li .line {
	transition: all 0.5s;
	border-bottom: 1px solid #ccc;
	padding: 1rem 2rem 1rem;
	position: relative;
}

.risk .select ul li p.line {
	font-size: 1.4rem;
}

.risk .select ul li div.line {
	padding: 1rem 3.5rem 1rem 2rem
}

.risk .select ul li input[type=radio] {
	position: absolute;
	top: 50%;
	transform: translate(0, -50%);
	right: 1rem;
}

.risk .select ul li .check-img {
	background: url("css/_08_css/images/icon_signcheck.png") no-repeat
		center;
	height: 2rem;
	background-size: 100%;
	position: absolute;
	top: 50%;
	-webkit-transform: translate(0, -50%);
	transform: translate(0, -50%);
	right: 1rem;
	width: 2rem;
}

.risk .pro-box {
	text-align: center;
}

.risk .select ul li .check-img.uncheck {
	background: url("css/_08_css/images/icon_uncheck.png") no-repeat center;
	height: 2rem;
	background-size: 100%;
	position: absolute;
	top: 50%;
	-webkit-transform: translate(0, -50%);
	transform: translate(0, -50%);
	right: 1rem;
	width: 2rem;
}

.risk .pro-box {
	text-align: center;
}

.risk .pro-box .pro-bg {
	width: 90%;
	background: #e4e4ea;
	height: .6rem;
	margin: 2rem auto auto;
	border-radius: 2rem;
}

.risk .pro-box .pro-bg .pro-col {
	width: 10%;
	background: #5175b3;
	height: 100%;
	border-radius: 2rem;
}

.risk .btns {
/* 	position: fixed; */
	/* bottom: 0; */
	/* left: 0; */
	width: 800px;
	margin: auto;
	text-align: center;
	box-sizing: border-box;
}

.risk .btns div {
	width: 49.7%;
	height: 3.5rem;
	line-height: 3.5rem;
	float: left;
	border-top: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

.risk .btns div:nth-child(2) {
	border-right: 0;
}

.risk .btns div.blue {
	color: #5175b3;
}

#choice-tip {
	display: none;
	border-radius: .5rem;
	font-size: 1.5rem;
	background: #000;
	color: #fff;
	padding: 1rem;
 	position: absolute; 
	top: 100%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.result-box {
	width: 1500px;
	margin: auto;
	font-size: 1.2rem;
	color: #666;
	padding-top: 3rem;
	text-align: center;
	display: none;
	/*             position: absolute; */
	top: 10px;
	/* left: 0; */
}

.result-box img {
	/* 	margin: 1.5rem auto; */
	
}

.result-box .result-txt {
	padding: 0 4rem;
	text-align: justify;
	line-height: 1.2rem;
}

.result-box .result-txt .result-money {
	color: #5175b3;
}

.result-box .ok-btn {
	width: 70%;
	margin: 2rem auto 1rem;
	padding: 1rem 0;
	background: #5175b3;
	color: #fff;
	font-size: 1.3rem;
	border-radius: .5rem;
}

#reset {
	color: #5175b3;
	margin-bottom: 2rem;
	font-size: 1.3rem;
}

.selectDist2 {
	display: none;
}
</style>

</head>

<body>
	<div class="site-loader"></div>
	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
	</div>
	<div class="site-blocks-cover inner-page-cover overlay"
		style="background-image: url(css/_08_css/images/background_building1.jpg);"
		fade" data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row align-items-center justify-content-center text-center">
				<div class="col-md-10">
					<h1 class="mb-2">房貸評測及諮詢</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="site-section">
		<div class="container">
			<div class="row">

				<section class="risk">
					<div class="select">
						<ul id="subjectBox">

						</ul>
					</div>
					<div class="pro-box">
						<div class="pro-bg">
							<div class="pro-col" id="scroller"></div>
						</div>
						<p>
							<span id="current"></span>
							<span id="total"></span>
						</p>
					</div>
					<div class="btns">
						<div id="preBtn">上一題</div>
						<div id="nextBtn" class="blue">下一題</div>
					</div>
				</section>

				<section>
					<div id="choice-tip">請選擇答案!</div>
				</section>

				<section class="result-box">
					<h1>您房地貸款簡評</h1>
					
					<div class="result-1">
						<img src="" id="result-img">
						<div class="result-txt">
							<div id="result-type"></div>
							<div class="result-money">
								<h4><span id="max-money"></span></h4>
<!--                     <p>您當前已投資金額：<span id="invest-money"></span></p>  -->
							</div>
							<div class="container">
								<div class="py-2">
									
									<h4>為您推薦房地業務專員</h4>
									<span>請選擇地區</span>
									<select class="form-control" name="city" id="city">
										<option value="台北市" selected>台北市</option>
										<option value="新北市">新北市</option>
									</select>
									<div id="tp" class="selectDist1">
										<select name="dist" class="form-control" id='dist'>
											<option value="全地區" selected>全地區</option>
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
									</div>
									<div id='ntp' class="selectDist2">
										<select name="dist1" class='form-control' id='dist1'>
											<option value="全地區" selected>全地區</option>
											<option value="板橋區">板橋區</option>
											<option value="新莊區">新莊區</option>
											<option value="中和區">中和區</option>
											<option value="永和區">永和區</option>
											<option value="蘆洲區">蘆洲區</option>
											<option value="三重區">三重區</option>
											<option value="新店區">新店區</option>
											<option value="土城區">土城區</option>
											<option value="泰山區">泰山區</option>
											<option value="樹林區">樹林區</option>
											<option value="五股區">五股區</option>
											<option value="汐止區">汐止區</option>
											<option value="鶯歌區">鶯歌區</option>
											<option value="林口區">林口區</option>
											<option value="深坑區">深坑區</option>
											<option value="坪林區">坪林區</option>
											<option value="石門區">石門區</option>
											<option value="淡水區">淡水區</option>
											<option value="萬里區">萬里區</option>
											<option value="雙溪區">雙溪區</option>
											<option value="烏來區">烏來區</option>
											<option value="三峽區">三峽區</option>
											<option value="瑞芳區">瑞芳區</option>
											<option value="八里區">八里區</option>
											<option value="石碇區">石碇區</option>
											<option value="三芝區">三芝區</option>
											<option value="金山區">金山區</option>
											<option value="平溪區">平溪區</option>
											<option value="貢寮區">貢寮區</option>
										</select>
									</div>
									<button  style="margin: center" class="ok-btn"id="cityBtn" onClick="lenderShow()">確定</button>
								</div>

							</div>
							<div id="lenderShow"></div>
							

						</div>
					</div>
<!-- 			<div class="ok-btn">確定</div> -->
			<div id="reset">重新測評</div>
			</section>
			</div>

		</div>
	</div>
	<jsp:include page="/footer.jsp" />


	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		var starLevel = "";
	  
        
		$('#city').change(function() {
			var val = $(this).val();
			if (val == '台北市') {
				$('.selectDist1').css("display", "block")
				$('.selectDist2').css("display", "none")
			} else {
				$('.selectDist2').css("display", "block")
				$('.selectDist1').css("display", "none")
			}
		})
		var lendShow = document.getElementById('lenderShow');

		function lenderShow() {
			
			console.log('click')
			var city = $('#city').prop("value")
			var dist = "";
			//判斷城市
			if (city == "台北市") {
				var dist = $('#dist').prop("value")
			} else {
				var dist = $('#dist1').prop("value")
			}
			//全地區
			console.log('city:' + city)
			console.log('dist:' + dist)
			var content = "";
			if (dist == '全地區') {
				
		    	
				var xhr = new XMLHttpRequest();
				xhr.open("POST", "<c:url value='lendercity'/>", true);
				xhr.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
				xhr.send("city=" + city + "&starLevel=" + starLevel); //+"&dist="+dist
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {						
						let lenderCity = JSON.parse(xhr.responseText);
						console.log('lenderCity.length:' + lenderCity.length);
						content = '<table id="example"  style="border:thick double black">';
						content += '<thead><tr><th>業務姓名</th><th>銀行名稱</th><th>縣市</th><th>行政區</th>'
								+ '<th>連絡電話</th><th>聯絡地址</th></tr></thead>';
						for (let j = 0; j < lenderCity.length; j++) {
							console.log("name:" + lenderCity[j].memberBean.name
									+ "star:" + lenderCity[j].star)
							let tb = '<tr><td>' + lenderCity[j].memberBean.name
									+ '</td><td>'
									+ lenderCity[j].bankTest.bankName
									+ '</td><td>'
									+ lenderCity[j].bankTest.bankCity
									+ '</td><td>'
									+ lenderCity[j].bankTest.bankDist
									+ '</td><td>'
									+ lenderCity[j].bankTest.bankTel
									+ '</td><td>'
									+ lenderCity[j].bankTest.bankAddr
									+ '</td></tr>';
							content += tb;
						}
						content += '</table>';
					}
					lendShow.innerHTML = content;
				}
			}
			//行政區
				
			var xhr2 = new XMLHttpRequest();
			xhr2.open("POST", "<c:url value='lendercitydist'/>", true);
			xhr2.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			xhr2.send("city=" + city + "&dist=" + dist+ "&starLevel=" + starLevel);
			xhr2.onreadystatechange = function() {

				if (xhr2.readyState == 4 && xhr2.status == 200) {
					let lenderCityDist = JSON.parse(xhr2.responseText);
					console.log('lenderCityDist.lengeth:'
							+ lenderCityDist.length);
					if (lenderCityDist.length == 0) {
						content += "<h3>此地區無房貸專員，請重新選擇地區</h3>";
					} else {
						content = '<table id="example"  style="width: 100%">';
						content += '<thead><tr><th>業務姓名</th><th>銀行名稱</th><th>縣市</th><th>行政區</th>'
								+ '<th>連絡電話</th><th>聯絡地址</th></tr></thead>';

						for (let j = 0; j < lenderCityDist.length; j++) {
							let tb = '<tr><td>'
									+ lenderCityDist[j].memberBean.name
									+ '</td><td>'
									+ lenderCityDist[j].bankTest.bankName
									+ '</td><td>'
									+ lenderCityDist[j].bankTest.bankCity
									+ '</td><td>'
									+ lenderCityDist[j].bankTest.bankDist
									+ '</td><td>'
									+ lenderCityDist[j].bankTest.bankTel
									+ '</td><td>'
									+ lenderCityDist[j].bankTest.bankAddr
									+ '</td></tr>';
							content += tb;
						}
						content += '</table>';
					}
				}
				lendShow.innerHTML = content;
			}
		}

		var object = {
			"question_items" : [ {
				"title" : "您貸款的目的?：",
				"type" : "TYPE_RADIO",
				"answers_items" : [ {
					"result" : "A",
					"point" : 3,
					"content" : "購屋"
				}, {
					"result" : "B",
					"point" : 1,
					"content" : "融資"

				} ]
			}, {
				"title" : "您購屋時有無雇用不動產經紀人(房仲)服務？",
				"type" : "TYPE_RADIO",
				"answers_items" : [ {
					"result" : "A",
					"point" : 3,
					"content" : "是 "
				}, {
					"result" : "B",
					"point" : 1,
					"content" : "否"

				} ]
			},{
				"title" : "是否為首次購屋?？",
				"type" : "TYPE_RADIO",
				"answers_items" : [ {
					"result" : "A",
					"point" : 3,
					"content" : "是 "
				}, {
					"result" : "B",
					"point" : 1,
					"content" : "否"

				} ]
			}, {
				"title" : "您的購屋旅程進度如何？",
				"type" : "TYPE_RADIO",
				"answers_items" : [ {
					"result" : "A",
					"point" : 1,
					"content" : "看屋中"
				}, {
					"result" : "B",
					"point" : 3,
					"content" : "已簽約"

				} ]
			}, {
				"title" : "您所得來源為薪資轉帳還是現金收入？",
				"type" : "TYPE_RADIO",
				"answers_items" : [ {
					"result" : "A",
					"point" : 1,
					"content" : "現金收入"
				}, {
					"result" : "B",
					"point" : 3,
					"content" : "薪資轉帳"

				} ]
			}, {
				"title" : "您目前是否有其他貸款 例如:房貸 、車貸、 信貸或創業貸款？",
				"type" : "TYPE_RADIO",
				"answers_items" : [ {
					"result" : "A",
					"point" : 1,
					"content" : "是"
				}, {
					"result" : "B",
					"point" : 3,
					"content" : "否"

				} ]

			} ]
		}
		var subjectArray = object['question_items'];

		$(function() {

			// 當前題目索引
			var currentSubjectIndex = 1;
			// 總題數
			var subjectTotal = subjectArray.length;
			// 上一題按鈕
			var $preBtn = $("#preBtn");
			// 下一題按鈕    
			var $nextBtn = $("#nextBtn");
			// 題目容器
			var $subjectBox = $("#subjectBox");
			// 總題數容器
			var $total = $("#total");

			// 進度條
			var $scroller = $("#scroller");

			//重新測評按鈕
			var $reset = $("#reset");

			// 選中題目點擊find("div.line").    
			$subjectBox.on("click", "div.line", function() {
				if (currentSubjectIndex >= 1) {
					$preBtn.addClass("blue");
				}
				console.log($(this))
				//get為選中的答案標識
				$(this).find(".check-img").removeClass("uncheck").addClass(
						"get");
				$(this).siblings().find(".check-img").addClass("uncheck");

				setTimeout(nextPage, 200);
			});

			// 上一題按鈕點擊
			$preBtn.on("click", function() {
				prePage();
			});

			// 下一題按鈕點擊
			$nextBtn.on("click", function() {
				nextPage();
			});

			//重新測評按鈕點擊
			$reset.on("click", function() {
				resetTest();
			});

			/**
			 * 初始化題目容器
			 */
			initSubjectBox();
			console.log(subjectBox)

			function initSubjectBox() {
				var subjectHtml = "";
				for (var i = 0; i < subjectArray.length; i++) {
					subjectHtml += getSubjectHtml(subjectArray[i], i + 1);
				}

				$subjectBox.html(subjectHtml);
				$("#index_" + currentSubjectIndex).addClass("active");

				// 改變進度條
				changeScroller();
			}

			/**
			 * 獲取題目HTML
			 */
			function getSubjectHtml(subject, index) {
				var subjectItemHtml = getSubjectItemHtml(
						subject['answers_items'], index);
				var html = '' + '<li id="index_' + index + '">'
						+ '<p class="line">' + '<span>' + index + '.</span>'
						+ '<span>' + subject.title + '</span>' + '</p>'
						+ subjectItemHtml + '</li>'
				return html;
			}

			/**
			 * 獲取題目選項HTML
			 */
			function getSubjectItemHtml(subjectItemArray, index) {
				var html = '';
				for (var i = 0; i < subjectItemArray.length; i++) {
					var subjectItem = subjectItemArray[i];
					html += ''
							+ '<div class="line" value="' + subjectItem.point + '">'
							+ '<span>' + subjectItem.result + '.</span>'
							+ '<span>' + subjectItem.content + '</span>'
							+ '<div class="check-img uncheck">' + '</div>'
							+ '</div>';
				}
				return html;
			}

			/**
			 * 改變進度條
			 */
			function changeScroller() {
				$scroller.width(currentSubjectIndex / subjectTotal * 100 + "%");
			}

			/**
			 * 獲取總分數
			 */
			function getTotalPoint() {
				var result = 0;
				var selectedOptionArray = $subjectBox.find(".get");
				$(selectedOptionArray).each(function() {
					result += parseInt($(this).parent().attr("value"));
				});
				return result;
			}

			/**
			 * 上一題
			 */
			function prePage() {
				//console.log(currentSubjectIndex);
				if (currentSubjectIndex <= 1) {
					return;
				}
				if (currentSubjectIndex == 2) {
					$preBtn.removeClass("blue");
				}
				currentSubjectIndex--;
				flipPage();
			}

			/**
			 * 下一題
			 */
			function nextPage() {

				//console.log(currentSubjectIndex);
				if (currentSubjectIndex >= 1) {
					$preBtn.addClass("blue");
				}
				var nopass = $("#index_" + currentSubjectIndex).find(".get").length == 0 ? true
						: false;
				if (nopass) {
					$("#choice-tip").fadeIn();
					setTimeout("$('#choice-tip').fadeOut()", 1000);
					return;
				}
				if (currentSubjectIndex == subjectTotal) {
					//得出結果
					var result = getTotalPoint();
					console.log("您的得分是：" + result);
					var imgSrc = $("#result-img"), resultType = $("#result-type"), maxMoney = $("#max-money"), investMoney = $("#invest-money");

					if (result >= 0 && result <= 7) {
						imgSrc.attr("src",
								"css/_08_css/images/icon_house_bad1.png");
// 						resultType.html("評測結果：保守")
						starLevel = "1";
						console.log("starLevel:level" + starLevel);
												maxMoney.html("評測結果：保守");
						// 						investMoney.html("30,000.12元")

					} else {
						imgSrc.attr("src",
								"css/_08_css/images/icon_house_good2.png");
// 						resultType.html("評測結果：良好")
						starLevel = "2";
						console.log("starLevel:level" + starLevel);
												maxMoney.html("評測結果：良好");	
						// 						investMoney.html("30,000.12元")
					}
					$(".risk").fadeOut();
					$(".result-box").fadeIn();
					return;
				}
				currentSubjectIndex++;
				flipPage()
			}

			/**
			 * 翻頁
			 */
			function flipPage() {
				$subjectBox.find("li").removeClass("active");
				$("#index_" + currentSubjectIndex).addClass("active");
				$("#current").html(currentSubjectIndex);
				changeScroller();
			}

			/**
			 * 重新測評
			 */
			function resetTest() {
				currentSubjectIndex = 1;
				lendShow.innerHTML = "";
				$(".risk").fadeIn();
				$(".result-box").fadeOut();
				$preBtn.removeClass("blue");
				$(".check-img").removeClass("get").addClass("uncheck");
				flipPage();
			}

		})
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
	
	<script src="<c:url value='/datatable/datatables.js' />"></script>
</body>

</html>