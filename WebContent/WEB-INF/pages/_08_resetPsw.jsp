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
   
</style>
</head>

<body>
  <div class="site-loader"></div>
  <div class="site-wrap">
	<jsp:include page="/navibar.jsp" />
  </div>
  <div class="slide-one-item home-slider owl-carousel">
  </div>
 <fieldset>
 <div  class="form-popup " id="myForm">
<Form   class="form-container" Action="<c:url value='resetPsw' />" method="POST" >
	    <h1 style="font-color:#333333" >重設密碼</h1>
    <label for="psw3"><b>原密碼</b>
    <img id="img3" src=""><span id="sp3"></span>
    <small><Font id="fonterror2"color='red'  size="-1">${errorMsg.pswkey1}&nbsp;</Font></small></label>
    <input	type="password" id="psw3" placeholder="請輸入原密碼" name="psw3"  maxlength="16" required>
    <br>
    	<label for="psw1" class="psw">新密碼：<img id="img1" src=""><span id="sp1"></span>
    <small><Font id="fonterror2"color='red'  size="-1">${errorMsg.pswkey2}&nbsp;</Font></small></label>
		<font id="fonterror1"color='red'size="-1">${errorMsg.psw}</font>
		<input type="password" id="psw1"name="psw1" placeholder="請輸入新密碼" required  onblur="checkPwd();"maxlength="16"onclick="hide()"> 
		<br>
		<label for="psw2" class="psw">重複密碼：<img id="img2" src=""><span id="sp2"></span>
		<font id="fonterror2"color='red'size="-1">${errorMsg.psw}</font></label> 
		<input type="password" id="psw2"name="psw2" placeholder="請輸入新密碼" required  onblur="checkPwd1();"maxlength="16"onclick="hide()"> 
		<br>
	
<!--    style="display:none"   <div class="g-recaptcha" data-sitekey="6LdiYQEVAAAAAOo5WzmBhqfR4YdV0BOQdifm_cTi" data-callback="enablebtn"></div> -->
<!-- 	<br> -->
	<input type="hidden" name="x" value="${param.x}">
	
    <button  id="myBtn" type="submit" class="btn">送出</button>        
 </Form>
  </div>
 </fieldset> 
  <div class="st2">
      <a href="index.jsp">返回首頁</a>
  </div>

  <jsp:include page="/footer.jsp" />

  </div>
  		<script src="https://www.google.com/recaptcha/api.js"></script>
	<script>
	function enablebtn(){
		console.log("123")
			var rebtn=document.getElementById("myBtn");
			rebtn.disabled=false;
			rebtn.style.display="block"			
		}
</script>
  <script>
  function hide(){
		let f1 =document.getElementById("fonterror1");
		f1.style.display="none";
		let f2 =document.getElementById("fonterror2");
		f2.style.display="none";
  }
  function checkPwd() {
      let pwd = document.querySelector("#psw1").value
      console.log(pwd)
      let pwdLen = pwd.length
      let span = document.querySelector("#sp1")
      let regx=/^(?=.*[a-zA-Z])(?=.*\d).{6,16}$/;
      if (pwd == "") {
          span.innerHTML = "密碼不可空白";
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
  function checkPwd1(){
	  let pwd1 = document.querySelector("#psw1").value
	  let pwd2 = document.querySelector("#psw2").value
	  let span = document.querySelector("#sp2")
	  if(pwd1==pwd2){
		  span.innerHTML="重複密碼正確";
	          document.querySelector("#img2").src="css/_08_css/images/img1.jpg";
		  }else{
			   span.innerHTML="重複密碼不相符";
			   document.querySelector("#img2").src = "css/_08_css/images/img2.jpg";
			  }	  	
	  }
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
  <script src="js/circleaudioplayer.js"></script>

  <script src="js/main.js"></script>

</body>

</html>