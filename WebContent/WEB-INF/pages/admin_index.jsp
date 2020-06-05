<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/19_css/admin_index.css">
<title>後臺管理</title>
</head>
<body>
<!--   <div class="site-loader"></div> -->

<!--   <div class="site-wrap"> -->
<%--      <jsp:include page="/navibar.jsp" /> --%>
<!--   </div> -->
<table class="t1">
	<tr>
		<th class="h1"><button class=bt1 id="memberbtn" onclick="ajaxmembers()">會員清單</button></th>
		<th class="h1"><button class=bt1 id="housebtn" onclick="ajaxhouses()">房屋清單</button></th>
		<th class="h1"><button class=bt1 id="newbtn" onclick="ajaxnews()">新聞清單</button></th>
		<th class="h2"><a class="a1" href="<c:url value='createnew'/>">新增新聞</a></th>
		<th class="h2"><a class="a1" href=index.jsp>返回首頁</a></th>
	</tr>
</table>
<div class=d1 id="ajax"></div>	
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
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