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
<!-- <link rel="stylesheet" href="css/19_css/memberData.css">	 -->
<style>
   body {
	background-color: #333333;
	font-family:微軟正黑體;
	font-size:18px;
	color:#ffffff;
}
form{display: inline;}
  .sp1 {
       text-align: center;
        margin: auto;
        margin-top: 150px;
        margin-bottom: 20px;
        font-size: 40px;
    }
    
    .sp3 {
	margin-bottom:10vh;
	margin-left:33vw;
	font-size: 5mm;
    }

     .t1 { 
       background-color:#FCFCFC; 
       border-collapse: collapse; 
       width: 60%; 
       margin-top: 2vh; 
       margin-left:20vw;
       margin-bottom:20px;  
       text-align: left; 
       color:black;
     } 

    .img1 {
      padding-bottom: 20px;
    }

	.td1
	{
	background-color:#BEBEBE;
	width:10vw;
	font-size: 8mm;
	}
	tr td{
		border-bottom:1px solid gray;
	}

	.td2
	{
	font-size:6mm;
	font-family:微軟正黑體;
	text-align: center;
	}
    .submit{
   	 	padding:10px;
		font-size: 10mm;
		margin-top:10px;
		background-color: #333333;
		border:none;
		color:white;
		outline: none;}
	.submit:hover{color: red;}
	.index{
		font-size:10mm;
		margin-left:22vw;
		outline: none;
		}
	.a1{color:white;}

	.a1:hover{ color:red; }
	.in1{
		border-color:#F0F0F0;
		height:30px;
		text-align:center;
		font-size:6mm;
		font-family:微軟正黑體;
		width:50%;
		}
	.in1:focus{
		background-color: #E0E0E0;
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
	<div class="sp1">個人資料</div>
	<font size='-1' color='red'>&nbsp;${errors.DBError}</font>
	<form method="post" action=<c:url value='updateMember.do'/>>
	<input type="hidden" name="id"value="${memberUpdate.pk}">
		<table class="t1">				
			<tr>
				<td class="td1">姓名：</td>
				<td class="td2"><input class="in1" type="text" id="name" name="name"
					value="${memberUpdate.name}" onblur="checkName();" onclick="hide()">
					<img id="img3" src=""><span id="sp1"></span> <font
					id="fonterror1" color='red' size="-1">${errors.name}</font></td>
			</tr>
			<tr>
				<td class="td1">性別：</td>
				<td class="td2">
				<c:choose>
					<c:when test="${memberUpdate.gender ==('male')}">男</c:when>
					<c:otherwise>女</c:otherwise>
				</c:choose>
				
				</td>
			</tr>

			<tr>
				<td class="td1">聯絡方式：</td>
				<td class="td2"><input class="in1" type="text" id="tel" name="tel"
					value="${memberUpdate.tel}" onblur="checkPhone();" onclick="hide()"
					maxlength="10"> <img id="img5" src=""><span id="sp6"></span>
					<font id="fonterror3" color='red' size="-1">${errors.tel}</font></td>
			</tr>
			<tr>
				<td class="td1">身份別：</td>
				<td class="td2">
				<c:if test="${memberUpdate.usertype==('General')}">
						一般會員
				</c:if> 
				<c:if test="${memberUpdate.usertype==('Senior')}">
						高級會員
				</c:if>
				<c:if test="${memberUpdate.usertype==('admin')}">
						管理者
				</c:if>
				</td>
			</tr>
			<tr>
				<td class="td1">註冊日期：</td>
				<td class="td2">${memberUpdate.registerDate}</td>
			</tr>
			<tr>
				<td class="td1">E-mail：</td>
				<td class="td2"><input class="in1" type="text" id="email" name="email"
					value="${memberUpdate.email}" onclick="hide()" onblur="checkEmail();">
					<img id="img6" src=""><span id="sp5"></span> <font
					id="fonterror4" color='red' size="-1">${errors.email}</font></td>
			</tr>
		</table>	
		<span class="sp3"><input class="submit" type="submit" value="送出" onclick="return confirmUpdate()"></span>
		<span class="index"><a class="a1" href="<c:url value='showMemberData'/>">上一頁</a></span>
	</form>
	</fieldset>
	<div>

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
	<script>
		function confirmUpdate() {
			if (confirm("確定修改此筆紀錄?")) {
				return true
			}
			return false
		}
	</script>
	<script>
		function hide() {
			let f1 = document.getElementById("fonterror1");
			f1.style.display = "none";
			let f2 = document.getElementById("fonterror2");
			f2.style.display = "none";
			let f3 = document.getElementById("fonterror3");
			f3.style.display = "none";
			let f4 = document.getElementById("fonterror4");
			f4.style.display = "none";
		}
		function checkName() {
			let name = document.querySelector("#name").value
			let nameLen = name.length
			let span = document.querySelector("#sp1")
			let regx = /^[\u4E00-\u9FA5]+$/;
			if (name == "") {
				span.innerHTML = "姓名不可空白"
				document.querySelector("#img3").src = "css/_08_css/images/img2.jpg"
			} else if (nameLen < 2) {
				span.innerHTML = "至少兩個字"
				document.querySelector("#img3").src = "css/_08_css/images/img2.jpg"
			} else if (!regx.test(name)) {
				span.innerHTML = "必須是中文"
				document.querySelector("#img3").src = "css/_08_css/images/img2.jpg"
			} else {
				span.innerHTML = "正確"
				document.querySelector("#img3").src = "css/_08_css/images/img1.jpg"
			}

		}

		function checkPwd() {
			let pwd = document.querySelector("#psw").value
			let pwdLen = pwd.length
			let span = document.querySelector("#sp2")
			let regx = /^(?=.*[a-zA-Z])(?=.*\d).{6,16}$/;
			if (pwd == "") {
				span.innerHTML = "密碼不可空白";
				document.querySelector("#img2").src = "css/_08_css/images/img2.jpg"
			} else if (pwdLen < 6) {
				span.innerHTML = "至少6個字"
				document.querySelector("#img2").src = "css/_08_css/images/img2.jpg"
			} else if (!regx.test(pwd)) {
				span.innerHTML = "格式錯誤必須是英文加數字組合"
				document.querySelector("#img2").src = "css/_08_css/images/img2.jpg"
			} else {
				span.innerHTML = "正確"
				document.querySelector("#img2").src = "css/_08_css/images/img1.jpg"
			}

		}
		function checkAccount() {
			let pwd = document.querySelector("#account").value
			let pwdLen = pwd.length
			let span = document.querySelector("#sp3")
			let regx = /^(?=.*[a-zA-Z])(?=.*\d).{6,16}$/;
			if (pwd == "") {
				span.innerHTML = "帳號不可空白";
				document.querySelector("#img1").src = "css/_08_css/images/img2.jpg"
			} else if (pwdLen < 6) {
				span.innerHTML = "至少6個字"
				document.querySelector("#img1").src = "css/_08_css/images/img2.jpg"
			} else if (!regx.test(pwd)) {
				span.innerHTML = "格式錯誤必須是英文加數字組合"
				document.querySelector("#img1").src = "css/_08_css/images/img2.jpg"
			} else {
				span.innerHTML = "正確"
				document.querySelector("#img1").src = "css/_08_css/images/img1.jpg"
			}
		}
		function checkIdNumber() {
			let idN = document.querySelector("#idCard").value;
			let idNLen = idN.length;
			let span = document.querySelector("#sp4")
			let rex = /^[A-Z]{1}\d{9}$/;
			if (idN == "") {
				span.innerHTML = "身分證字號不可空白";
				document.querySelector("#img4").src = "css/_08_css/images/img2.jpg"
			} else if (!rex.test(idN)) {
				span.innerHTML = "身分證號碼格式錯誤"
				document.querySelector("#img4").src = "css/_08_css/images/img2.jpg"
			} else {
				span.innerHTML = "正確"
				document.querySelector("#img4").src = "css/_08_css/images/img1.jpg"
			}
		}
		function checkEmail() {
			let email = document.querySelector("#email").value;
			let span = document.querySelector("#sp5")
			let rex = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
			if (email == "") {
				span.innerHTML = "EMAIL不可空白"
				document.querySelector("#img6").src = "css/_08_css/images/img2.jpg"
			} else if (!rex.test(email)) {
				span.innerHTML = "EMAIL格式錯誤"
				document.querySelector("#img6").src = "css/_08_css/images/img2.jpg"
			} else {
				span.innerHTML = "正確"
				document.querySelector("#img6").src = "css/_08_css/images/img1.jpg"
			}
		}
		function checkPhone() {
			let phone = document.querySelector("#tel").value;
			let span = document.querySelector("#sp6")
			let rex = /^[09]{2}\d{8}$/;
			if (phone == "") {
				span.innerHTML = "手機號碼不可空白"
				document.querySelector("#img5").src = "css/_08_css/images/img2.jpg"
			} else if (!rex.test(phone)) {
				span.innerHTML = "手機號碼格式錯誤"
				document.querySelector("#img5").src = "css/_08_css/images/img2.jpg"
			} else {
				span.innerHTML = "正確"
				document.querySelector("#img5").src = "css/_08_css/images/img1.jpg"
			}
		}
	</script>
</body>

</html>