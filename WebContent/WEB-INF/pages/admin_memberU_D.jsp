<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/19_css/admin_member.css">
<title>修改會員資料</title>
<style>
body{background-color: #FCFCFC;}
.submit{background-color:#FCFCFC;}
.td1{
	font-family:微軟正黑體;
	font-weight:bold;
	font-size:6mm;
	color:white;
	background-color:#4F4F4F;
	width:300px;
}
.t1{
	background-color:#FFFFFF;
	border-color:#D0D0D0;
	border-left:none;
	border-right:none;
	border-collapse: collapse;
	width: 70%;
	}
.td2{
	font-size:6mm;
	font-family:微軟正黑體;
	text-align: center;
	}
.ip1{
	font-size:6mm;
	font-family:微軟正黑體;
	padding:5px;
	width:auto;
	border-color:#F0F0F0;
	text-align: center;
	}
.ip1:focus{
		background-color: #E0E0E0;
		}
.s1{
	border-width:medium;
	font-size:6mm;
	padding:5px;
	}
</style>
</head>
<body>
<h1 align="center">會員修改</h1>
	<form method="Post" action="<c:url value='updateMember'/>">
			<input type="hidden" name="id" value="${member.pk}">
		<table class="t1" border='1' align="center">
			<tr>
				<td class="td1">姓名：</td>
				<td class="td2">
					<input class="ip1" type="text" name="name" id="name" value="${member.name}" onblur="checkName();" onclick="hide()" />
					<img id="img3" src="">
					<span id="sp1"></span> 
					<font id="fonterror1" color='red' size="-1">${errors.name}</font>
				</td>
			</tr>
			<tr>
				<td class="td1">性別：</td>
				<td class="td2">
				<c:choose>
					<c:when test="${member.gender ==('male')}">男</c:when>
					<c:otherwise>女</c:otherwise>
				</c:choose>
				
				</td>
			</tr>

			<tr>
				<td class="td1">聯絡方式：</td>
				<td class="td2">
					<input class="ip1" value="${member.tel}" name="tel" id="tel" onblur="checkPhone();" onclick="hide()" maxlength="10"/> 
					<img id="img5" src="">
					<span id="sp6"></span>
					<font id="fonterror3" color='red' size="-1">${errors.tel}</font>
				</td>
			</tr>
			<tr>
				<td class="td1">身份別：</td>
				<td class="td2">
				<select class="s1" name="usertype">
				<option value="General">一般會員</option>
				<option value="Senior">高級會員</option>
				<option value="admin">管理者</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="td1">註冊日期：</td>
				<td class="td2">${member.registerDate}</td>
			</tr>
			<tr>
				<td class="td1">E-mail：</td>
				<td class="td2">
					<input class="ip1" type="text" name="email" id="email" value="${member.email}" onclick="hide()" onblur="checkEmail();"/>
					<img id="img6" src="">
					<span id="sp5"></span> 
					<font id="fonterror4" color='red' size="-1">${errors.email}</font>
				</td>
			</tr>
		</table>
		<span class="update">
		<input class="submit" type="submit" name='updateBtn' value="修改" onclick="return confirmUpdate()">
		</span>
	</form>
	
	<span class="index"><a href="<c:url value='admin_index'/>">上一頁</a></span>
	
	<form method='Post' action="<c:url value='deleteMember'/>">
		<input type="hidden" name="mid" value="${member.pk}">
		<input type='hidden' name='_method' value='DELETE'>
		<span class="delete">
		<input class="submit" type="submit" name='deleteBtn' value="刪除" onclick="return confirmDelete()">
		</span>
	</form>
	
	
	<script>
		function confirmUpdate() {
			if (confirm("確定修改此筆紀錄?")) {
				return true
			}	
				return false
		}
	</script>
		<script>
		function confirmDelete() {
			if (confirm("確定刪除此筆紀錄?")) {
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