<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/19_css/admin_new.css">
<title>修改新聞</title>
</head>
<body>
<h1 align="center">新聞修改</h1>
<form method="Post" action="<c:url value='updateNew'/>">
			<input type="hidden" name="id" value="${new1.newsnum}">
		<table class="t1" align="center">
			<tr>
				<td class="td1">標題：</td>
				<td class="td2">
				<textarea rows="3" cols="100" name="newstitle" style="overflow:hidden;resize: none;">${new1.newstitle}</textarea>
				</td>
			</tr>
			<tr>
				<td class="td1">城市：</td>
				<td class="td2">
					<select class="s1" name="newscityname" id="city" onchange="changecity(this)">
					<option value="taipei">台北</option>
					<option value="newtaipei">新北</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="td1">行政區：</td>
				<td class="td2">
					<select class="s1" name="newsareaname" id="dist">					
					</select>
				</td>
			</tr>
			<tr>
				<td class="td1">內容：</td>
				<td class="td2">
				<textarea rows="30" cols="100" name="newscontent" style="overflow:hidden;resize: none;">${new1.newscontent}</textarea>
				</td>
			</tr>
		</table>
		<span class="update"><input class="submit" type="submit" name='updateBtn' value="修改" onclick="return confirmUpdate()"></span>
	</form>
		
		<span class="index"><a href="<c:url value='admin_index'/>">上一頁</a></span>
	
	<form method='Post' action="<c:url value='deleteNew'/>">
		<input type="hidden" name="nid" value="${new1.newsnum}">
		<input type='hidden' name='_method' value='DELETE'>
		<span class="delete"><input class="submit" type="submit" name='deleteBtn' value="刪除" onclick="return confirmDelete()"></span>
	</form>

	<script>
		function confirmUpdate() {
			if (confirm("確定修改此筆紀錄?")) {
				return true
			}	
				return false
				
		}
		function confirmDelete() {
			if (confirm("確定刪除此筆紀錄?")) {
				return true
			}
				return false
		}

		let dctl = document.getElementById("city");
		let dctv = dctl.value;
		let ddt = ["北投區", "士林區", "內湖區", "中山區", "松山區", "大同區", "萬華區", "中正區", "大安區",
			"信義區", "南港區", "文山區", "台北市"];
		let ddist = document.getElementById("dist");
		if(dctv == "taipei"){
			ddist.options.length=0;
			for(let k=0;k<ddt.length;k++){
				ddist.add(new Option(ddt[k],ddt[k]));
				}
			}

		function changecity(clicked){
			let ctvl = clicked.value;
	  		let dist = document.getElementById("dist");
			let tpdt = ["北投區", "士林區", "內湖區", "中山區", "松山區", "大同區", "萬華區", "中正區", "大安區",
	  			"信義區", "南港區", "文山區", "台北市"];
			let ntpdt = [ "板橋區", "中和區", "新莊區", "土城區", "汐止區", "鶯歌區", "淡水區", "五股區", "林口區",
				"深坑區", "坪林區", "石門區", "萬里區", "雙溪區", "烏來區", "三重區", "永和區", "新店區", "蘆洲區",
				"樹林區", "三峽區", "瑞芳區", "泰山區", "八里區", "石碇區", "三芝區", "金山區", "平溪區", "貢寮區", "新北市" ];
			if(ctvl=="taipei"){
	  	  		dist.options.length=0;
	  			for(let x=0;x<tpdt.length;x++){
					dist.add(new Option(tpdt[x],tpdt[x]));
	  	  		}
			}
			if(ctvl=="newtaipei"){
	  	  		dist.options.length=0;
		  		for(let y=0;y<ntpdt.length;y++){
					dist.add(new Option(ntpdt[y],ntpdt[y]));
	  			}
	  	  	}
		}
	</script>
</body>
</html>