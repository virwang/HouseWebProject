<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/19_css/admin_createnew.css">
<meta charset="UTF-8">
<title>新增新聞</title>
<style>
body{background-color:#FCFCFC;}
.submit{background-color:#FCFCFC;}
.td1{
	text-align:center;
	font-size: 6mm;
	}
a:link{color:blue;text-decoration:none;}
a:visited {color:blue;text-decoration:none;}
a:hover{color:red;}
form{display: inline;}
h1{margin-top:10vh;}
.t1{
	height:400px;
	width:60%;
	margin-top:5vh;
	}
.ip1{
	width: 80%;
	}
.submit{
	margin-left:50px;
	padding:10px;
	font-size: 10mm;
	margin-top:10px;
	background-color:#FCFCFC;
	border:none;
	color:blue;
		}
.submit:hover{color:red;}
.update{
	margin-left:25vw;
		}
.index{
	font-size:10mm;
	margin-left:30vw;
		}
.delete{margin-left:15vw;}
.s1{font-size: 6mm;}
</style>
</head>
<body>
<h1 align="center">新增新聞</h1>
	<form method="Post" action="<c:url value='insertNews'/>">
		<table class="t1" align="center">
			<tr>
				<td class="td1">標題：</td>
				<td class="td2">
				<textarea rows="3" cols="100" name="newstitle" style="overflow:hidden;resize: none; "></textarea>
				</td>
			</tr>
			<tr>
				<td class="td1">城市：</td>
				<td class="td2">
					<select class="s1" name="newscityname" id="city" onchange="changecity(this)">
					<option value="臺北">臺北</option>
					<option value="新北">新北</option>
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
				<textarea rows="30" cols="100" name="newscontent" style="overflow:hidden;resize: none;"></textarea>
				</td>
			</tr>		
		</table>
		<span class="create"><input class="submit" type="submit" name='createBtn' value="送出" onclick="return confirmCreate()"></span>
	</form>
	<span class="index">
		<a class="a1" href="<c:url value='admin_index'/>">上一頁</a>
	</span>
	
	
	<script>
		function confirmCreate() {
			if (confirm("確定新增此筆紀錄?")) {
				return true
			}	
				return false
		}

		let dctl = document.getElementById("city");
		let dctv = dctl.value;
		let ddt = ["北投區", "士林區", "內湖區", "中山區", "松山區", "大同區", "萬華區", "中正區", "大安區",
			"信義區", "南港區", "文山區", "台北市"];
		let ddist = document.getElementById("dist");
		if(dctv == "臺北"){
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
			if(ctvl=="臺北"){
	  	  		dist.options.length=0;
	  			for(let x=0;x<tpdt.length;x++){
					dist.add(new Option(tpdt[x],tpdt[x]));
	  	  		}
			}
			if(ctvl=="新北"){
	  	  		dist.options.length=0;
		  		for(let y=0;y<ntpdt.length;y++){
					dist.add(new Option(ntpdt[y],ntpdt[y]));
	  			}
	  	  	}
		}
	</script>
	

</body>
</html>