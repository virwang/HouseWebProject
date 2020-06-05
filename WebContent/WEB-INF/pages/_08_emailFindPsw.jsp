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
        background-color: #D0D0D0;
    }
    .st1 {
      text-align: center;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 20px;
        font-size: 40px;
    }

    .st2 {
        margin: auto;
        width: 150px;
        font-size: 30px;
        margin-top: 100px;
        margin-bottom: 100px;
    }
 	.st3{
 		text-align: center;
 		margin:auto;
 		width:400px;
 		
 	}   
 	body {font-family: Arial, Helvetica, sans-serif;}

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
  </div>
    <div class="site-blocks-cover overlay" style="background-image: url(css/_08_css/images/imgpassword.jpg);" data-aos="fade"
      data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
          <div class="col-md-10">
            <!-- <span class="d-inline-block bg-success text-white px-3 mb-3 property-offer-type rounded">出租</span> -->
<!--             <span class="d-inline-block bg-danger text-white px-3 mb-3 property-offer-type rounded">賣房</span> -->
            <h1 class="mb-2">忘記密碼</h1>
<!--             <p class="mb-5"><strong class="h2 text-success font-weight-bold">$2,250,500</strong></p> -->
<!--             <p><a href="#" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">詳細資訊</a></p> -->
          </div>
        </div>
      </div>
    </div>
 

    <Table class="st3" width='330' >
         <TR><TH colspan='2'>
            <H1 >忘記密碼</H1> 
         </TH><TH></TH></TR>
         <TR>
             <TD align="RIGHT">帳號：</TD>
             <TD align="LEFT"><input id="account" type="text" name="account" size="16"></TD>
             <TD width='120'><small><Font color='red' size="-1"></Font></small></TD>
         </TR>        
         <TR>	
             <TD align="RIGHT">請輸入電子信箱E-mail：</TD>
             <TD align="LEFT" ><input id="email"	type="text" name="email"  size=""></TD>
             <TD width='120'><small><Font color='red'  size="-1"></Font></small></TD>
         </TR>            
         <TR>
             <TD align="CENTER" colspan='3'><Font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></TD>             
         </TR>                 
        <TR>
            <TD colspan="2" align="center">
           <button  id="myBtn"type="submit">送出</button></TD>
            </TR>
         </Table>

 <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p></p>
    <span id="success"></span>
    
  </div>

</div>
<a href="<c:url value='sendEmail'/>">寄信測試</a>
  <div class="st2">
      <a href="index.jsp">返回首頁</a>
  </div>
  <jsp:include page="/footer.jsp" />
  <script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
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