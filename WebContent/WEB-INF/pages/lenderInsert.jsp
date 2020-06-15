<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css//bootstrap.min.css">
<link rel="stylesheet" href="css/_08_css/jquery.dataTables.min.css">

<link rel="stylesheet" href="css/_08_css/input_radio_style.css">
<title>新增專員銀行</title>
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

<style>
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
	<div class="site-blocks-cover inner-page-cover overlay"
		style="background-image: url(css/_08_css/images/allLoanLender.jpg);"
		fade" data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row align-items-center justify-content-center text-center">
				<div class="col-md-10">
					<h1 class="mb-2">新增房貸專員</h1>
				</div>
			</div>
		</div>
	</div>

	<div style="display: block">
		<h1>選擇銀行及分行</h1>
		<h3>姓名:${memberBean.name}</h3>
	</div>
	<br>
	
<%-- 	<form action="insertLenderList" method="POST"> --%>
		<div id="bankCode" class="button-wrap"></div>
		<hr>
		<div id="branchBank"></div>
		
		<button  id="myBtn"type="submit">送出</button>
<%-- 	</form> --%>
<!-- 	<h2>Modal Example</h2> -->

<!-- Trigger/Open The Modal -->
<!-- <button id="myBtn">Open Modal</button> -->

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p></p>
    <span id="success"></span>
    
  </div>

</div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script>
		$(function() {
			var bankArea = document.getElementById("bankCode");
			var content="";
			
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='allbank'/>", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					content = '<table id="example"  style="width: 100%">';
					var bankData = JSON.parse(xhr.responseText);
					for (var j = 0; j < bankData.length; j++) {
						let input = document.createElement("INPUT");
						input.type = "radio";
						input.setAttribute("class", "hidden radio-label yes-button");
						input.setAttribute("name", "bank");
						input.setAttribute("id", "yes-button" + j);
// 						input.setAttribute("checked", "checked");
						input.setAttribute("value", bankData[j].bankCode);
						let label = document.createElement("label");
						label.setAttribute("class", "button-label");
						label.setAttribute("for", "yes-button" + j);
						
						bankArea.appendChild(input);
						label.innerHTML += bankData[j].bankCode+bankData[j].bankName;
						bankArea.appendChild(label);
						
					}
						
					$("input.yes-button").on("click", function() {
						$("#branchBank").empty();
						var bankCode = $(this).prop("value");
						console.log("input-value:" + bankCode);
						var bankArea2 = document.getElementById("branchBank");
						var xhr2 = new XMLHttpRequest();
						xhr2.open("GET", "<c:url value='selectBranchBank'/>" + "?bankCode=" + bankCode, true);
						xhr2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
						xhr2.send();
						xhr2.onreadystatechange = function() {
							if (xhr2.readyState == 4 && xhr2.status == 200) {
								var branchBankData = JSON.parse(xhr2.responseText);
								for (var i = 0; i < branchBankData.length; i++) {	
													
									let input2 = document.createElement("INPUT");
									input2.type = "radio";
									input2.setAttribute("class", "hidden radio-label maybe-button");
									input2.setAttribute("name", "branchBank");
									input2.setAttribute("id", "maybe-button" + i);
// 									input2.setAttribute("checked", "checked");
									input2.setAttribute("value", branchBankData[i].branchCode);
									let label2 = document.createElement("label");
									label2.setAttribute("class", "button-label");
									label2.setAttribute("for", "maybe-button" + i);
									bankArea2.appendChild(input2);
									label2.innerHTML += branchBankData[i].bankName;
									bankArea2.appendChild(label2);									
								}
							}
							$("input.maybe-button").on("click", function() {
								var branchCode = $(this).prop("value");
								console.log("input-value:" + branchCode);
							})
						}
					
					});

				}
			}

			
	
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
	var spanLender=document.getElementById("success");
  modal.style.display = "block";
  var branchBank=$("input.maybe-button:checked").prop("value")
  console.log("branchBank:"+branchBank);
  var xhr3 = new XMLHttpRequest();
	xhr3.open("POST", "<c:url value='insertLenderList'/>" , true);
	xhr3.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr3.send("branchBank="+branchBank);
	xhr3.onreadystatechange = function() {
		if (xhr3.readyState == 4 && xhr3.status == 200) {
			var insertBankData = JSON.parse(xhr3.responseText);
			console.log(insertBankData.lender.memberBean.name+""+insertBankData.lender.bankTest.bankName);
			var newLender=insertBankData.status+"!!<br>"+"專員姓名:"+insertBankData.lender.memberBean.name+" 專員銀行:"+insertBankData.lender.bankTest.bankName;
			spanLender.innerHTML=newLender;
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
		});
</script>
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
	<script src="js/main.js"></script>
	
</body>
</html>