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
<!-- <link rel="stylesheet" href="css/19_css/memberData.css"> -->
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/style.css">
<style>
   body {
	background-color: #333333;
	font-family:微軟正黑體;
	font-size:18px;
	color:#ffffff;
}
form 
{display: inline;}
  .sp1 {
       text-align: center;
        margin: auto;
        margin-top: 150px;
        margin-bottom: 20px;
        font-size: 40px;
    }
.sp2{ 
	font-size: 6mm;
	margin-left: 70vw;
}
.a1{color:black;}

.a1:hover{ 
   color:red; 
    } 
 .t1 { 
       background-color:#FCFCFC; 
       border-collapse: collapse; 
       width: 60%; 
       margin-top: 2vh; 
       margin-left:20vw;
       margin-bottom: 30px;  
       text-align: left; 
       color:black;
     } 

	.td1
	{
	background-color:#BEBEBE;
	width:10vw;
	font-size: 8mm;
	}
tr td{border-bottom:1px solid gray;}

	.td2
	{
	text-align: center;
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
	<div class="sp1">個人資料</div>
	
	<form method="get" action="showMember">
		<input type="hidden" name="id" value="${memberData.pk}">
		<table class="t1">
			<tr>
				<td class="td1">姓名：</td>
				<td class="td2">${memberData.name}</td>
			</tr>

			<tr>
				<td class="td1">性別：</td>
				<td class="td2">
				<c:choose>
					<c:when test="${memberData.gender ==('male')}">男</c:when>
					<c:otherwise>女</c:otherwise>
				</c:choose>
				
				</td>
			</tr>

			<tr>
				<td class="td1">聯絡方式：</td>
				<td class="td2">${memberData.tel}</td>
			</tr>
			<tr>
				<td class="td1">身份別：</td>
				<td class="td2">
				<c:if test="${memberData.usertype==('General')}">
						一般會員
				</c:if> 
				<c:if test="${memberData.usertype==('Senior')}">
						高級會員
				</c:if>
				<c:if test="${memberData.usertype==('admin')}">
						管理者
				</c:if>
				</td>
			</tr>
			<tr>
				<td class="td1">註冊日期：</td>
				<td class="td2">${memberData.registerDate}</td>
			</tr>
			<tr>
				<td class="td1">E-mail：</td>
				<td class="td2">${memberData.email}</td>
			</tr>
		</table>
		<span class="sp2" ><button><a class="a1" href="<c:url value='updateMemberData.do'/>">修改資料</a></button></span>
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


</body>

</html>