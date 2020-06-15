<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/19_css/admin_house.css">
<title>刪除房屋資料</title>
<style>
body{background-color: #FCFCFC;}
.submit{background-color:#FCFCFC;}
.td1{
	font-family:微軟正黑體;
	font-weight:bold;
	font-size:6mm;
	color:white;
	background-color:#4F4F4F;
}
.td2{
	font-size:6mm;
	font-family:微軟正黑體;
	text-align: center;
	}
.t1{
	background-color:#FFFFFF;
	border-color:#D0D0D0;
	border-left:none;
	border-right:none;
	border-collapse: collapse;
	width: 70%;
	}
.index{
	font-size:10mm;
	margin-left:30vw;
		}
</style>
</head>
<body>
<h1 align="center">刪除房屋資料</h1>
<form method="Get" action="<c:url value='showHouse'/>">
			<input type="hidden" name="id" value="${house.id}">
		<table class="t1" border='1' >
			<tr>
				<td class="td1">標題：</td>
				<td class="td2">
					${house.title}
				</td>
			</tr>
			<tr>
				<td class="td1">城市：</td>
				<td class="td2">
					${house.city}
				</td>
			</tr>
			
			<tr>
				<td class="td1">區域：</td>
				<td class="td2">		
					${house.dist}				
				</td>
			</tr>

			<tr>
				<td class="td1">社區：</td>
				<td class="td2">
					${house.apartment}
				</td>
			</tr>
			<tr>
				<td class="td1">地址：</td>
				<td class="td2">
					${house.address}
				</td>
			</tr>
			<tr>
				<td class="td1">總額：</td>
				<td class="td2">
					${house.totalprice}萬
				</td>
			</tr>
			<tr>
				<td class="td1">枰數：</td>
				<td class="td2">
					${house.ping}	
				</td>
			</tr>
		</table>
	</form>
	
	<form method='Post' action="<c:url value='deleteHouse'/>">
		<input type="hidden" name="hid" value="${house.id}">
		<input type='hidden' name='_method' value='DELETE'>
		<span class="delete">
		<input class="submit" type="submit" name='deleteBtn' value="刪除" onclick="return confirmDelete()">
		</span>
	</form>
	<span class="index"><a href="<c:url value='admin_index'/>">上一頁</a></span>
		<script>
		function confirmDelete() {
			if (confirm("確定刪除此筆紀錄?")) {
				return true
			}
				return false
		}
	</script>
</body>
</html>