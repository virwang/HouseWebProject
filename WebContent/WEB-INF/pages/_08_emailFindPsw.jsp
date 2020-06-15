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
.googleLogin {
	margin-right: 36%;
	margin-left: 36%;
}  
/*  	body {font-family: Arial, Helvetica, sans-serif;} */

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
} 	
</style>
</head>

<body>
  <div class="site-loader"></div>
  <div class="site-wrap">
	<jsp:include page="/navibar.jsp" />
	<div class="slide-one-item home-slider owl-carousel"></div>
  </div>
  <fieldset >
<div class="form-popup " id="myForm">
  <form   class="form-container">
    <h1 style="font-color:#333333" >忘記密碼</h1>
<%--     <Font color='red' size="-1">&nbsp;${ErrorMsgKey.LoginError}</Font> --%>
    <Font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font>
    <br>
    <label for="account"><b>帳號</b></label>
    <input id="account" placeholder="請輸入帳號" type="text" name="account" size="16" required >
	<small><Font color='red' size="-1">${ErrorMsgKey.AccountError}</Font></small>
	
    <label for="psw"><b>信箱</b></label>
    <input id="email" placeholder="請輸入E-mail" type="text" name="email"  size=""required >
	<small><Font color='red'  size="-1">${ErrorMsgKey.PswError}</Font></small>
<!-- 	<br> -->
<!--   style="display:none"    <div class="g-recaptcha" data-sitekey="6LdiYQEVAAAAAOo5WzmBhqfR4YdV0BOQdifm_cTi" data-callback="enablebtn"></div> -->
<!--       <br> -->
	
	
	<br>
    <button  id="myBtn" type="button" class="btn">送出</button>
<!--     <button type="submit" class="btn cancel" onclick="closeForm()">Close</button> -->
  </form>
  
</div>
</fieldset>
 

 <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p></p>
    <span id="success"></span>
    
  </div>

</div>
<%-- <a href="<c:url value='sendEmail'/>">寄信測試</a> --%>
  <div class="st2">
      <a href="index.jsp">返回首頁</a>
  </div>
  <jsp:include page="/footer.jsp" />
  <script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
		<script src="https://www.google.com/recaptcha/api.js"></script>
	<script>
	function enablebtn(){
			var rebtn=document.getElementById("myBtn");
			rebtn.disabled=false;
			rebtn.style.display="block"			
		}
</script>
  <script>
  $(function() {
	// Get the modal
	  var modal = document.getElementById("myModal");

	  // Get the button that opens the modal
	  var btn = document.getElementById("myBtn");

	  // Get the <span> element that closes the modal
	  var span = document.getElementsByClassName("close")[0];

	  // When the user clicks the button, open the modal 
	  btn.onclick = function() {
	  	var spanEmail=document.getElementById("success");
	    modal.style.display = "block";
	    spanEmail.innerHTML="寄信中...";
	    var account=$("#account").prop("value");
	    var email=$("#email").prop("value");
	    console.log("email="+email+"account="+account);
	    var xhr3 = new XMLHttpRequest();
	  	xhr3.open("POST", "<c:url value='checkAcctEmail'/>" , true);
	  	xhr3.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  	xhr3.send("account="+account+"&email="+email);
	  	xhr3.onreadystatechange = function() {
	  		if (xhr3.readyState == 4 && xhr3.status == 200) {
	  			
	  			var emailData = JSON.parse(xhr3.responseText);
	  			console.log(emailData.status);
	  			var newEmail=emailData.status+"!!<br>";
	  			spanEmail.innerHTML=newEmail;
	  		}
	  }
	  }
	  // When the user clicks on <span> (x), close the modal
	  span.onclick = function() {
	    modal.style.display = "none";
	  }

	  // When the user clicks anywhere outside of the modal, close it
	  window.onclick = function(event) {
	    if (event.target == modal) {
	      modal.style.display = "none";
	    }
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
  <script src="js/circleaudioplayer.js"></script>
  <script src="js/main.js"></script>

</body>

</html>