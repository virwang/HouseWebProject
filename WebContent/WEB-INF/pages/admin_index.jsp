<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/19_css/admin_index.css">
<style>
tr:nth-child(even) {
  background-color: #f2f2f2;
}
  body{font-family:微軟正黑體;}
  .butn1{
  font-family:微軟正黑體;
  border:none;
  background-color: #333;
  color:white;
  font-size: 17px;
  outline: none;
  }
  .butn1:hover{
  background-color: #ddd;
  }
			/* Add a black background color to the top navigation */
.topnav {
  background-color: #333;
  overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add an active class to highlight the current page */
.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

/* Hide the link that should open and close the topnav on small screens */
.topnav .icon {
  display: none;
}


</style>
<title>後臺管理</title>
</head>
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="topnav" id="myTopnav">
  <a href="index.jsp" class="active">返回首頁</a>
  <a href="<c:url value='createnew'/>">新增新聞</a>
  <a onmouseover="ahover()" onmouseleave="aleave()"><button class="butn1" id="newbtn" onclick="ajaxnews()">新聞清單</button></a>
  <a onmouseover="ahover1()" onmouseleave="aleave1()"><button class="butn1" id="housebtn" onclick="ajaxhouses()">房屋清單</button></a>
  <a onmouseover="ahover2()" onmouseleave="aleave2()"><button class="butn1" id="memberbtn" onclick="ajaxmembers()">會員清單</button></a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
<div class=d1 id="ajax"></div>	
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	function ahover(){
		$("#newbtn").css("background-color","#ddd");
		$("#newbtn").css("color","black");
		}
	function aleave(){
		$("#newbtn").css("background-color","#333");
		$("#newbtn").css("color","white");
		}
	function ahover1(){
		$("#housebtn").css("background-color","#ddd");
		$("#housebtn").css("color","black");
		}
	function aleave1(){
		$("#housebtn").css("background-color","#333");
		$("#housebtn").css("color","white");
		}
	function ahover2(){
		$("#memberbtn").css("background-color","#ddd");
		$("#memberbtn").css("color","black");
		}
	function aleave2(){
		$("#memberbtn").css("background-color","#333");
		$("#memberbtn").css("color","white");
		}
	function ajaxmembers(){
		let ajaxmember = document.getElementById('ajax');
		let content = "";
		ajaxmember.innerHTML=content;
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='ajaxgetmemberlist'/>", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			console.log(xhr.readyState);
			if (xhr.readyState == 4 && xhr.status == 200) {
				let memberlist = JSON.parse(xhr.responseText);
				content = '<table class=t2 id="member" style="width:100%;text-align:center;">';
				content += '<tr><th>姓名</th><th>身份</th><th> </th></tr>';
				for (let j = 0; j < memberlist.length;j++) {
					let tb = '<tr><td>' + memberlist[j].name
					+ '</td><td>'
					+ memberlist[j].usertype
					+ "</td><td><a class='a1' href='<c:url value='showmember?id="
					+ memberlist[j].pk
					+"'/>'>修改資料</a>";
					content += tb;
				}		
		}
		content += '</table>';
		ajaxmember.innerHTML = content;
		}	
	}

	function ajaxhouses(){
		let ajaxhouse = document.getElementById('ajax');
		let content1 = "";
		ajaxhouse.innerHTML=content1;
		let xhr1 = new XMLHttpRequest();
		xhr1.open("GET", "<c:url value='ajaxhouseList'/>", true);
		xhr1.send();
		
		xhr1.onreadystatechange = function() {
			console.log(xhr1.readyState);
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				let houselist = JSON.parse(xhr1.responseText);
				content1 = '<table class=t2 id="house"  style="width:100%;text-align:center;">';
				content1 += '<tr><th>標題</th><th>城市</th><th>行政區</th><th> </th></tr>';
				for (let j = 0; j < houselist.length;j++) {
					let tb1 = '<tr><td>' + houselist[j].title
					+ '</td><td>'
					+ houselist[j].city
					+'</td><td>'
					+houselist[j].dist
					+"</td><td><a class='a1' href='<c:url value='showHouse?id="
					+ houselist[j].id
					+"'/>'>刪除資料</a>";
					content1 += tb1;
				}		
		}
		content1 += '</table>';
		ajaxhouse.innerHTML = content1;
		}	
	}

	function ajaxnews(){
		let ajaxnew = document.getElementById('ajax');
		let content2 = "";
		ajaxnew.innerHTML=content2;
		let xhr2 = new XMLHttpRequest();
		xhr2.open("GET", "<c:url value='ajaxnewlist'/>", true);
		xhr2.send();
// 		document.write(xhr2.responseText)
		xhr2.onreadystatechange = function() {
			console.log(xhr2.readyState);
			if (xhr2.readyState == 4 && xhr2.status == 200) {
				let newlist = JSON.parse(xhr2.responseText);
				console.log(newlist);
				
				content2 = '<table class=t2 id="new"  style="width:100%;text-align:center;">';
				content2 += '<tr><th>標題</th><th>城市</th><th>行政區</th><th> </th></tr>';
				for (let j = 0; j < newlist.length;j++) {
					let tb2 = '<tr><td>' + newlist[j].newstitle
					+ '</td><td>'
					+ newlist[j].newscityname
					+'</td><td>'
					+newlist[j].newsareaname
					+"</td><td><a class='a1' href='<c:url value='showNew?id="
					+ newlist[j].newsnum
					+"'/>'>修改資料</a>";
					content2 += tb2;
				}		
		}
		content2 += '</table>';
		ajaxnew.innerHTML = content2;
		}	
	}
	</script>
	
</body>
</html>