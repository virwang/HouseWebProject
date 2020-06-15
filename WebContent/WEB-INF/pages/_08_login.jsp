<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>隨心居 &mdash; 想住哪就住哪</title>
<meta charset="utf-8" name="google-signin-client_id" content="535880499912-miafr5t9hp5h7tu4630rspss8q0huacc.apps.googleusercontent.com">
<meta name="google-signin-scope" content="profile email">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" >
<script src="<c:url value='js/jquery-3.4.1.js' />"></script>
<script src="<c:url value='js/popper.min.js' />"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
/*   display: none; */
/*   position: fixed; */
  bottom: 0;
  right: 15px;
/*   border: 3px solid #f1f1f1; */
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
/*   max-width: 300px; */
  padding: 10px;
  max-width: 500px;
  margin: 150px auto;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
.googleLogin {
/* 	margin-right: 36%; */
/* 	margin-left: 36%; */
}
</style>
</head>

<body>

	<div class="site-loader"></div>
	<div class="site-wrap">
		<jsp:include page="/navibar.jsp" />
	</div>		
	<div class="slide-one-item home-slider owl-carousel"></div>
<fieldset >
<div class="form-popup " id="myForm">
  <form Action="<c:url value='logins' />" method="POST"  class="form-container">
    <h1 style="font-color:#333333" >登入</h1>
    <Font color='red' size="-1">&nbsp;${ErrorMsgKey.LoginError}</Font>
    <br>
    <label for="account"><b>帳號</b></label>
    <input id="account" type="text" placeholder="請輸入帳號" name="account" required size="16">
	<small><Font color='red' size="-1">${ErrorMsgKey.AccountError}</Font></small>
	
    <label for="psw"><b>密碼</b></label>
    <input id="psw" type="password" placeholder="請輸入密碼" name="psw" required size="16">
	<small><Font color='red'  size="-1">${ErrorMsgKey.PswError}</Font></small>
			<a href="<c:url value='mail'/>">忘記密碼</a>	
      <br>
      <div class="g-recaptcha" data-sitekey="6LdiYQEVAAAAAOo5WzmBhqfR4YdV0BOQdifm_cTi" data-callback="enablebtn"></div>
      <br>
      
    <div class="googleLogin">
			<a class="g-signin2" onclick="ClickLogin()" data-onsuccess="onSignIn">Google登入</a>
	</div>
	<br>
	<input type="hidden" name="reurl" value="${reurl}">
	<button id="allsub"  onclick="eeit07submit()" >一鍵登入(eeit07)</button>
	<button id="allsub"  onclick="adminsubmit()" >一鍵登入(admin)</button>
    <button style="display:none" disabled="disabled" id="rebtn" type="submit" class="btn">登入</button>
<!--     <button type="submit" class="btn cancel" onclick="closeForm()">Close</button> -->
  </form>
  
</div>
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

	<script src="https://apis.google.com/js/platform.js"></script>
	 <script src="https://www.google.com/recaptcha/api.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
		<script type="text/javascript">

</script>
<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
    async defer>
</script>
<script src="https://www.google.com/recaptcha/api.js?render=reCAPTCHA_site_key"></script>

<script>
function eeit07submit(){
	let acct=document.getElementById("account");
	acct.value="eeit07";
	let psw=document.getElementById("psw");
	psw.value="eeit123";
	}
function adminsubmit(){
	let acct=document.getElementById("account");
	acct.value="admin";
	let psw=document.getElementById("psw");
	psw.value="admin1234";
	
	}


	function enablebtn(){
			var rebtn=document.getElementById("rebtn");
			rebtn.disabled=false;
			rebtn.style.display="block"			
		}
</script>
	
	<script>
	var clicked = false;
	function ClickLogin() {
		clicked = true;
	}

	function onSignIn(googleUser) {
		if (clicked) {
			var profile = googleUser.getBasicProfile();
			var id_token = googleUser.getAuthResponse().id_token;
			console.log(id_token)
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '<c:url value="gv"/>',true);
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
				console.log('Signed in as: ' + xhr.responseText);
			xhr.send('idtoken=' + id_token);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					window.location.href = xhr.responseText;
						console.log('Signed in as: ' + xhr.responseText);
				}
			}
		}
	}
	
	   function checkAccount() {		   
		   var spana = document.querySelector("#sp3")
		   var spanaa = document.querySelector("#sp4")
		   spanaa.textContent="";	   
	        let act = document.querySelector("#account").value
	        let actLen = act.length
	        let regx=/^(?=.*[a-zA-Z])(?=.*\d).{6,16}$/;
	        if (act == "") {
	            spana.innerHTML = "帳號不可空白";
	            document.querySelector("#img1").src = "css/_08_css/images/img2.jpg"
	        } else if (actLen < 6) {
	            spana.innerHTML="至少6個字"
	            document.querySelector("#img1").src = "css/_08_css/images/img2.jpg"
	        }else if(!regx.test(act)){
	            spana.innerHTML="格式錯誤必須是英文加數字組合"
	            document.querySelector("#img1").src = "css/_08_css/images/img2.jpg"
	        }else{
	            spana.innerHTML="正確"
	            document.querySelector("#img1").src="css/_08_css/images/img1.jpg"
	        } 	   
		   var accspan=document.getElementById("sp3")
		   console.log("123"+accspan.textContent);
		   accspan.textContent
		   if(accspan.textContent=="正確"){
			   accspan.innerHTML="";
		   let acct=$("#account").prop("value");
		   var content="";
// 		   var span=$("#sp3");
	       var span = document.querySelector("#sp4")
		   console.log("account:"+acct);
		   var xhr=new XMLHttpRequest();
		   xhr.open("POST","<c:url value='accountCheck'/>",true);
		   xhr.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
		   xhr.send("account="+acct);
		   xhr.onreadystatechange=function(){				
				if(xhr.readyState==4&&xhr.status==200){
					let exist=JSON.parse(xhr.responseText);
					console.log(exist)
					
					if(exist.ok=="帳號可以使用"){
					let msg=exist.ok
					console.log("msg:"+msg);
					content=msg;
				    span.innerHTML=content;
						}else{
					let msg=exist.error
					console.log("msg:"+msg);	
					content=msg;
				    span.innerHTML=content;
				    document.querySelector("#img1").src = "css/_08_css/images/img2.jpg"
							}
					}
			   }
			   }
		   
	       
	    }
		
	
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