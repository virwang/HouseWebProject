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
<style>
body {
	background-color: #D0D0D0;
}

h1.mem {
	text-align: center;
	margin: auto;
	margin-top: 100px;
	margin-bottom: 20px;
}

.st1 {
	margin: 10px;
	border: 1px solid gray;
	background-color: honeydew;
	padding: 10px;
}

.submit {
	text-align: center;
	padding: 10px;
	margin-bottom: 100px;
}

fieldset {
	border-radius: 15px;
	width: 50vw;
	height: auto;
	margin: auto
}

#reset {
	margin-left: 100px;
}
</style>
</head>

<body>

	<div class="site-loader"></div>

	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
	</div>

	<div class="slide-one-item home-slider owl-carousel">



<!-- 		<div class="site-blocks-cover overlay" -->
<!-- 			style="background-image: url(images/house3.jpg);" data-aos="fade" -->
<!-- 			data-stellar-background-ratio="0.5"> -->
<!-- 			<div class="container"> -->
<!-- 				<div -->
<!-- 					class="row align-items-center justify-content-center text-center"> -->
<!-- 					<div class="col-md-10"> -->
<!-- 						<span class="d-inline-block bg-success text-white px-3 mb-3 property-offer-type rounded">出租</span> -->
<!-- 						<span -->
<!-- 							class="d-inline-block bg-danger text-white px-3 mb-3 property-offer-type rounded">賣房</span> -->
<!-- 						<h1 class="mb-2">渡假村</h1> -->
<!-- 						<p class="mb-5"> -->
<!-- 							<strong class="h2 text-success font-weight-bold">$2,250,500</strong> -->
<!-- 						</p> -->
<!-- 						<p> -->
<!-- 							<a href="#" -->
<!-- 								class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">詳細資訊</a> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

	</div>
	<h1 class="mem">加入會員</h1>
	<font size='-1' color='red'>&nbsp;${errorMsg.DBError}</font>
	<fieldset>
		<form action="springRegisterMember.do" method="POST"
			enctype="application/x-www-form-urlencoded">
			<div class="st1">
				<label class="account">帳號：</label> 
				<input type="text" id="account"name="account" value="${param.account}" onblur="checkAccount();" onclick="hide()"maxlength="16"> 
				<img id="img1" src="">
				<span id="sp3"></span>
				<font id="fonterror1" color='red'size="-1">${errorMsg.account}</font>
			</div>
			<div class="st1">
				<label class="psw">密碼：</label> 
				<input type="password" id="psw"name="psw" value="${param.psw }" onblur="checkPwd();"maxlength="16"onclick="hide()"> 
				<img id="img2" src=""><span id="sp2"></span>
				<font id="fonterror2"color='red'size="-1">${errorMsg.psw}</font>
			</div>
			<div class="st1">
				<label class="name">真實姓名：</label> 
				<input type="text" id="name" name="name" value="${param.name}" onblur="checkName();" onclick="hide()"> 
				<img id="img3" src=""><span id="sp1"></span>
				<font id="fonterror3"color='red'size="-1">${errorMsg.name}</font>
			</div>
			<div class="st1">
				<label class="idCard">身分證字號：</label> 
				<input type="text" id="idCard"name="idCard" value="${param.idCard}" maxlength="10" onblur="checkIdNumber();"onclick="hide()"> 
				<img id="img4" src=""><span id="sp4"></span>
				<font id="fonterror4"color='red'size="-1">${errorMsg.idCard}</font>
			</div>
			<div class="st1">
				<label class="gender">性別：</label> 
				<input type="radio" name="gender"value="${param.gender} male" checked required>男 
				<input type="radio"	name="gender" value="${param.gender} female">女
			</div>
			<div class="st1">
				<label class="Id">身分別：</label>
				 <select name="usertype"value="${param.usertype}">
					<option value="General">一般會員</option>
					<option value="Senior">高級會員</option>
				</select>
			</div>
			<div class="st1">
				<label class="tel">手機：</label> 
				<input type="text" id="tel"name="tel" value="${param.tel }" onblur="checkPhone();"onclick="hide()" maxlength="10"> 
				<img id="img5" src=""><span id="sp6"></span>
				<font id="fonterror5"color='red'size="-1">${errorMsg.tel}</font>
			</div>
			<div class="st1">
				<label class="email">E-mail：</label> 
				<input type="text" id="email"name="email" value="${param.email }" onclick="hide()"onblur="checkEmail();">
				<img id="img6" src=""><span id="sp5"></span>
				<font id="fonterror6"color='red'size="-1">${errorMsg.email}</font>
			</div>
			<div class="submit">
			<input id="submit" type="submit" value="送出"> 
			<input id="reset" type="reset" value="清除">
			</div>
		</form>
	</fieldset>

	<jsp:include page="/footer.jsp" />


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
		function hide(){
			let f1 =document.getElementById("fonterror1");
			f1.style.display="none";
			let f2 =document.getElementById("fonterror2");
			f2.style.display="none";
			let f3 =document.getElementById("fonterror3");
			f3.style.display="none";
			let f4 =document.getElementById("fonterror4");
			f4.style.display="none";
			let f5 =document.getElementById("fonterror5");
			f5.style.display="none";
			let f6 =document.getElementById("fonterror6");
			f6.style.display="none";
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
        let regx=/^(?=.*[a-zA-Z])(?=.*\d).{6,16}$/;
        if (pwd == "") {
            span.innerHTML = "密碼不可空白";
            document.querySelector("#img2").src = "css/_08_css/images/img2.jpg"
        } else if (pwdLen < 6) {
            span.innerHTML="至少6個字"
            document.querySelector("#img2").src = "css/_08_css/images/img2.jpg"
        }else if(!regx.test(pwd)){
            span.innerHTML="格式錯誤必須是英文加數字組合"
            document.querySelector("#img2").src = "css/_08_css/images/img2.jpg"
        }else{
            span.innerHTML="正確"
            document.querySelector("#img2").src="css/_08_css/images/img1.jpg"
        }
         
    }	
    function checkAccount() {
        let pwd = document.querySelector("#account").value
        let pwdLen = pwd.length
        let span = document.querySelector("#sp3")
        let regx=/^(?=.*[a-zA-Z])(?=.*\d).{6,16}$/;
        if (pwd == "") {
            span.innerHTML = "帳號不可空白";
            document.querySelector("#img1").src = "css/_08_css/images/img2.jpg"
        } else if (pwdLen < 6) {
            span.innerHTML="至少6個字"
            document.querySelector("#img1").src = "css/_08_css/images/img2.jpg"
        }else if(!regx.test(pwd)){
            span.innerHTML="格式錯誤必須是英文加數字組合"
            document.querySelector("#img1").src = "css/_08_css/images/img2.jpg"
        }else{
            span.innerHTML="正確"
            document.querySelector("#img1").src="css/_08_css/images/img1.jpg"
        }        
    }	
    function checkIdNumber(){
    	let idN=document.querySelector("#idCard").value;
    	let idNLen=idN.length;
    	let span = document.querySelector("#sp4")
    	let rex=/^[A-Z]{1}\d{9}$/;
    	if(idN ==""){
    		span.innerHTML = "身分證字號不可空白";
    		document.querySelector("#img4").src = "css/_08_css/images/img2.jpg"
    	}else if(!rex.test(idN)){
    		span.innerHTML="身分證號碼格式錯誤"
    		document.querySelector("#img4").src = "css/_08_css/images/img2.jpg"
    	}else{
    		span.innerHTML="正確"
            document.querySelector("#img4").src="css/_08_css/images/img1.jpg"
    	}
    }
    function checkEmail(){
    	let email=document.querySelector("#email").value;
    	let span = document.querySelector("#sp5")
    	let rex=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
    	if(email == ""){
    		span.innerHTML="EMAIL不可空白"
    		document.querySelector("#img6").src = "css/_08_css/images/img2.jpg"
    	}else if(!rex.test(email))	{
    		span.innerHTML="EMAIL格式錯誤"
    		document.querySelector("#img6").src = "css/_08_css/images/img2.jpg"
    	}else{
    		span.innerHTML="正確"
            document.querySelector("#img6").src="css/_08_css/images/img1.jpg"
    	}
    }
    function checkPhone(){
    	let phone = document.querySelector("#tel").value;
    	let span = document.querySelector("#sp6")
    	let rex=/^[09]{2}\d{8}$/;
    	if(phone==""){
    		span.innerHTML="手機號碼不可空白"
    		document.querySelector("#img5").src = "css/_08_css/images/img2.jpg"
    	}else if(!rex.test(phone)){
    		span.innerHTML="手機號碼格式錯誤"
    		document.querySelector("#img5").src = "css/_08_css/images/img2.jpg"
    	}else{
    		span.innerHTML="正確"
            document.querySelector("#img5").src="css/_08_css/images/img1.jpg"
    	}
    }
	</script>
</body>

</html>