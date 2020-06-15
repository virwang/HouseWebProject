<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/19_css/admin_index.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
/* tr:nth-child(even) { */
/*   background-color: #f2f2f2; */
/* } */
/* table tbody tr:hover{ */
/* 		background-color:#9D9D9D; */
/* 		} */
  body{
  font-family:微軟正黑體;
  background-color: #333333;
  }
  .butn1{
  font-family:微軟正黑體;
  border:none;
  background-color: #333;
  color:white;
  font-size: 17px;
  outline: none;
  }
  .butn1:hover{
   background-color: #333; 
  text-decoration: underline;
  }
			/* Add a black background color to the top navigation */
.topnav {
	margin-top:50px;
	margin-left:180px;
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
  text-decoration:underline;
  color: white;
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

/* table{ */
/* 	border-collapse:collapse; */
/* 	} */
.d1{
	margin-top:30px;
	background-color: #333;
}
 tr td{ 
	background-color:#FFFFFF; 
	padding:2px; 
 	font-size:6mm; 
 	font-family: 微軟正黑體; 
 	border-left:none; 
	border-right:none; 	} 
 tr th{ 
 	background-color:#D0D0D0; 
 	padding:2px; 
 	font-size:6mm; 
 	font-family: 微軟正黑體; 
 	border-left:none; 
 	border-right:none; 
 	} 
a:hover {
  text-decoration:underline;
  color: white;
}


}
</style>
<title>後臺管理</title>
</head>
<body>
<div class="topnav" id="myTopnav">
  <a href="index.jsp" class="active">好家在</a>
  <a href="<c:url value='createnew'/>">新增新聞</a>
  <a  id="newbtn" href="#" onclick="ajaxnews()">新聞清單</a>
  <a  id="housebtn" href="#" onclick="ajaxhouses()">房屋清單</a>
  <a  id="memberbtn" href="#" onclick="ajaxmembers()">會員清單</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
<div class=d1 id="ajax"></div>	
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready( function () {
	    $('#member').DataTable({
	    } );
	} );
	$(document).ready( function () {
	    $('#house').DataTable({
	    } );
	} );
	$(document).ready( function () {
	    $('#new').DataTable({
	    } );
	} );
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
				content = '<table class="table table-striped table-hover table-bordered" id="member" align="center" style="width:70%;text-align:center;">';
				content += '<thead><tr><th>帳號</th><th>姓名</th><th>身份</th><th> </th></tr></thead><tbody>';
				for (let j = 0; j < memberlist.length;j++) {
					let tb = '<tr><td>' + memberlist[j].account
					+ '</td><td>'
					+ memberlist[j].name
					+'</td><td>'
					+ memberlist[j].usertype
					+ "</td><td><a class='a1' href='<c:url value='showmember?id="
					+ memberlist[j].pk
					+"'/>'>修改資料</a></td></tr>";
					content += tb;
				}		
		}
		content += '</tbody></table>';
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
				content1 = '<table class="table table-striped table-hover table-bordered" id="member" align="center" style="width:70%;text-align:center;" id="house" align="center"  style="width:70%;text-align:center;">';
				content1 += '<thead><tr><th>標題</th><th>城市</th><th>行政區</th><th> </th></tr></thead><tbody>';
				for (let j = 0; j < houselist.length;j++) {
					let tb1 = '<tr><td>' + houselist[j].title
					+ '</td><td>'
					+ houselist[j].city
					+'</td><td>'
					+houselist[j].dist
					+"</td><td><a class='a1' href='<c:url value='showHouse?id="
					+ houselist[j].id
					+"'/>'>刪除資料</a></td></tr>";
					content1 += tb1;
				}		
		}
		content1 += '</tbody></table>';
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
				
				content2 = '<table class="table table-striped table-hover table-bordered" id="member" align="center" style="width:70%;text-align:center;" id="new" align="center"  style="width:70%;text-align:center;">';
				content2 += '<thead><tr><th>標題</th><th>城市</th><th>行政區</th><th> </th></tr></thead><tbody>';
				for (let j = 0; j < newlist.length;j++) {
					let tb2 = '<tr><td>' + newlist[j].newstitle
					+ '</td><td>'
					+ newlist[j].newscityname
					+'</td><td>'
					+newlist[j].newsareaname
					+"</td><td><a class='a1' href='<c:url value='showNew?id="
					+ newlist[j].newsnum
					+"'/>'>修改資料</a></td></tr>";
					content2 += tb2;
				}		
		}
		content2 += '</tbody></table>';
		ajaxnew.innerHTML = content2;
		}	
	}
	</script>
<script src="js/bootstrap.min.js"></script>	

</body>
</html>