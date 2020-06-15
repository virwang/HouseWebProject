<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <link rel="stylesheet" href="leaflet/leaflet.css" />
  <script src="leaflet/leaflet.js"></script>
  
  <style>

  </style>

</head>

<body>

  <div class="site-loader"></div>


  <div class="site-wrap">

    <jsp:include page="/navibar.jsp" />
  </div>

  <div class="site-blocks-cover inner-page-cover overlay" data-aos="fade" data-stellar-background-ratio="0.5">
    <div class="container">
      <div class="row align-items-center justify-content-center text-center">
        <div class="col-md-10">
          <h1 class="mb-2">預約狀況</h1>
        </div>
      </div>
    </div>
  </div>

  <div class="site-section">
    <div class="container">
    
      <div class="row">
      	<h1 class="mb-2">申請</h1>
      </div>
	  
	  <div id="applicanttable" class="row"></div>
	  
	  <c:if test="${memberBean.usertype=='Senior'||memberBean.usertype=='admin'}">
	    <div class="row">
      	   <h1 class="mb-2">受理</h1>
        </div>
      
      	<div id="recipienttable" class="row"></div>
	  </c:if>

    </div>
  </div>


  <jsp:include page="/footer.jsp" />

  <script>

  
	window.onload = function(){

		
		//申請
		let xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='applicanttable'/>",true);
		xhr.send();
		xhr.onreadystatechange = function(){

			if(xhr.readyState ==4 && xhr.status==200){
				let fragment1 = document.createDocumentFragment();
				let applicantlist = JSON.parse(xhr.responseText);

				let at = document.getElementById("applicanttable");
				let tbth = ["#", "房屋物件", "屋主", "申請狀態", "預約日期", "預約時段",
// 					"更改",
					"取消"];
				let aptable = document.createElement("table");
				aptable.setAttribute("class","table table-striped");
				let apthead = document.createElement("thead");

				let aptr = document.createElement("tr");
				let apth = document.createElement("th");


				
				for(let x=0;x<tbth.length;x++){
					let apth = document.createElement("th"); 
					apth.setAttribute("scope","col");
					let t = document.createTextNode(tbth[x]);
					apth.appendChild(t);
					aptr.appendChild(apth);
				}
				
				apthead.appendChild(aptr);
				aptable.appendChild(apthead);
				
				let aptbody = document.createElement("tbody");
				for(let i = 0;i<applicantlist.length;i++){
					let aptr1 = document.createElement("tr");
					
					let apth1 = document.createElement("th"); 
					apth1.setAttribute("scope","row");
					let t0 = document.createTextNode(i+1);
					apth1.appendChild(t0);
					aptr1.appendChild(apth1);
					
					let aptd1 = document.createElement("td");
					let t1 = document.createTextNode(applicantlist[i].houseBean.title);
					aptd1.appendChild(t1);
					aptr1.appendChild(aptd1);
					
					let aptd2 = document.createElement("td");
					let t2 = document.createTextNode(applicantlist[i].houseBean.memberBean.name);
					aptd2.appendChild(t2);
					aptr1.appendChild(aptd2);
					
					let aptd3 = document.createElement("td");
					aptd3.setAttribute("id","ap"+applicantlist[i].no);
					let t3 = document.createTextNode(applicantlist[i].status);
					aptd3.appendChild(t3);
					aptr1.appendChild(aptd3);
					
					let aptd4 = document.createElement("td");
					let rdate = applicantlist[i].reservatedate;
					
					let t4 = document.createTextNode(rdate.year+"-"+rdate.monthValue+"-"+rdate.dayOfMonth);
					aptd4.appendChild(t4);
					aptr1.appendChild(aptd4);
					
					let aptd5 = document.createElement("td");
					let t5 = document.createTextNode(applicantlist[i].reservatetime);
					aptd5.appendChild(t5);
					aptr1.appendChild(aptd5);

// 					let aptd6 = document.createElement("td");
// 					let bt1 = document.createElement("button");
// 					bt1.setAttribute("id","updaterv");
// 					bt1.setAttribute("class","btn btn-info");
// 					bt1.setAttribute("name","updaterv");
// 					bt1.setAttribute("value",applicantlist[i].no);
// 					let btt1 = document.createTextNode("更改");
// 					bt1.appendChild(btt1);
// 					aptd6.appendChild(bt1);
// 					aptr1.appendChild(aptd6);
					if(applicantlist[i].status!="預約已取消"){
						let aptd7 = document.createElement("td");
						aptd7.setAttribute("id","btnap"+applicantlist[i].no);
						let bt2 = document.createElement("button");
						bt2.setAttribute("id","cancelrv");
						bt2.setAttribute("class","btn btn-info");
						bt2.setAttribute("name","cancelrv");
						bt2.setAttribute("value",applicantlist[i].no);
						bt2.setAttribute("onclick","cancel(this)");
						let btt2 = document.createTextNode("取消");
						bt2.appendChild(btt2);
						aptd7.appendChild(bt2);
						aptr1.appendChild(aptd7);
					}else{
						let aptd7 = document.createElement("td");
						aptd7.setAttribute("id","btnap"+applicantlist[i].no);
						aptr1.appendChild(aptd7);
					}

					
					aptbody.appendChild(aptr1);

					

				}
					aptable.appendChild(aptbody);
					fragment1.appendChild(aptable);
					at.appendChild(fragment1);
			}
		}
		


			

			//受理
			let xhr2 = new XMLHttpRequest();
			xhr2.open("GET","<c:url value='recipienttable'/>",true);
			xhr2.send();
			xhr2.onreadystatechange = function(){
				if(xhr2.readyState ==4 && xhr2.status==200){
					let fragment2 = document.createDocumentFragment();

					let rt = document.getElementById("recipienttable");
					let rtbth = ["#", "房屋物件", "申請人", "申請狀態", "預約日期", "預約時段","確認","否決"];
					
					let rptable = document.createElement("table");
					rptable.setAttribute("class","table table-striped");
					let rpthead = document.createElement("thead");
					let rptr = document.createElement("tr");
					let rpth = document.createElement("th");

					for(let y=0;y<rtbth.length;y++){
						let rpth = document.createElement("th"); 
						rpth.setAttribute("scope","col");
						let t = document.createTextNode(rtbth[y]);
						rpth.appendChild(t);
						rptr.appendChild(rpth);
					}
					
					rpthead.appendChild(rptr);
					rptable.appendChild(rpthead);

					let recipientlist = JSON.parse(xhr2.responseText);

					let rptbody = document.createElement("tbody");
					for(let i = 0;i<recipientlist.length;i++){
						let rptr1 = document.createElement("tr");
						
						let rpth1 = document.createElement("th"); 
						rpth1.setAttribute("scope","row");
						let t0 = document.createTextNode(i+1);
						rpth1.appendChild(t0);
						rptr1.appendChild(rpth1);
						
						let rptd1 = document.createElement("td");
						let t1 = document.createTextNode(recipientlist[i].houseBean.title);
						rptd1.appendChild(t1);
						rptr1.appendChild(rptd1);
						
						let rptd2 = document.createElement("td");
						let t2 = document.createTextNode(recipientlist[i].memberBean.name);
						rptd2.appendChild(t2);
						rptr1.appendChild(rptd2);
						
						let rptd3 = document.createElement("td");
						rptd3.setAttribute("id","rp"+recipientlist[i].no);
						let t3 = document.createTextNode(recipientlist[i].status);
						rptd3.appendChild(t3);
						rptr1.appendChild(rptd3);
						
						let rptd4 = document.createElement("td");
						let rdate = recipientlist[i].reservatedate;
						
						let t4 = document.createTextNode(rdate.year+"-"+rdate.monthValue+"-"+rdate.dayOfMonth);
						rptd4.appendChild(t4);
						rptr1.appendChild(rptd4);
						
						let rptd5 = document.createElement("td");
						let t5 = document.createTextNode(recipientlist[i].reservatetime);
						rptd5.appendChild(t5);
						rptr1.appendChild(rptd5);

						if(!(recipientlist[i].status=="預約已取消"||recipientlist[i].status=="預約生效")){
							let rptd6 = document.createElement("td");
							rptd6.setAttribute("id","btnrpc"+recipientlist[i].no);
							let bt1 = document.createElement("button");
							bt1.setAttribute("id","confirmrv");
							bt1.setAttribute("class","btn btn-info");
							bt1.setAttribute("name","confirmrv");
							bt1.setAttribute("value",recipientlist[i].no);
							bt1.setAttribute("onclick","confirm(this)");
							let btt1 = document.createTextNode("確認");
							bt1.appendChild(btt1);
							rptd6.appendChild(bt1);
							rptr1.appendChild(rptd6);

							let rptd7 = document.createElement("td");
							rptd7.setAttribute("id","btnrpd"+recipientlist[i].no);
							let bt2 = document.createElement("button");
							bt2.setAttribute("id","declinerv");
							bt2.setAttribute("class","btn btn-info");
							bt2.setAttribute("name","declinerv");
							bt2.setAttribute("value",recipientlist[i].no);
							bt2.setAttribute("onclick","decline(this)");
							let btt2 = document.createTextNode("否決");
							bt2.appendChild(btt2);
							rptd7.appendChild(bt2);
							rptr1.appendChild(rptd7);
						}else{
							let rptd6 = document.createElement("td");
							rptd6.setAttribute("id","btnrpc"+recipientlist[i].no);
							rptr1.appendChild(rptd6);

							let rptd7 = document.createElement("td");
							rptd7.setAttribute("id","btnrpd"+recipientlist[i].no);
							rptr1.appendChild(rptd7);
						}
						


						
						rptbody.appendChild(rptr1);

					}
						rptable.appendChild(rptbody);
						fragment2.appendChild(rptable);
						rt.appendChild(rptable);
				}
			}

	}

	function confirm(clicked){
		let rid = clicked.value;
		let status = "預約生效";
		let rpstat = document.getElementById("rp"+rid);
		let btrpcstat = document.getElementById("btnrpc"+rid);
		let btrpdstat = document.getElementById("btnrpd"+rid);

		let xhr3 = new XMLHttpRequest();
		xhr3.open("POST","<c:url value='updatereserv'/>",true);
		xhr3.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr3.send("rid="+rid+"&status="+status);
		xhr3.onreadystatechange=function(){
			if(xhr3.readyState==4&&xhr3.status==200){
				let resv =JSON.parse(xhr3.responseText);
				if(resv.status=="success"){
					alert("預約更新成功");
					rpstat.innerHTML = status;
					btrpcstat.innerHTML = "";
					btrpdstat.innerHTML = "";
					
				}else{
					alert("預約更新失敗");
				}
			}
		
		};
	}
	function cancel(clicked){
		let rid = clicked.value;
		let status = "預約已取消";
		let apstat = document.getElementById("ap"+rid);
		let btapstat = document.getElementById("btnap"+rid);

		let xhr4 = new XMLHttpRequest();
		xhr4.open("POST","<c:url value='updatereserv'/>",true);
		xhr4.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr4.send("rid="+rid+"&status="+status);
		xhr4.onreadystatechange=function(){
			if(xhr4.readyState==4&&xhr4.status==200){
				let resv =JSON.parse(xhr4.responseText);
				if(resv.status=="success"){
					alert("預約更新成功");
					apstat.innerHTML = status;
					btapstat.innerHTML = "";
					
				}else{
					alert("預約更新失敗");
				}
			}
		
		};
	}
	function decline(clicked){
		let rid = clicked.value;
		let status = "預約已取消";
		let rpstat = document.getElementById("rp"+rid);
		let btrpcstat = document.getElementById("btnrpc"+rid);
		let btrpdstat = document.getElementById("btnrpd"+rid);

		let xhr3 = new XMLHttpRequest();
		xhr3.open("POST","<c:url value='updatereserv'/>",true);
		xhr3.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr3.send("rid="+rid+"&status="+status);
		xhr3.onreadystatechange=function(){
			if(xhr3.readyState==4&&xhr3.status==200){
				let resv =JSON.parse(xhr3.responseText);
				if(resv.status=="success"){
					alert("預約更新成功");
					rpstat.innerHTML = status;
					btrpcstat.innerHTML = "";
					btrpdstat.innerHTML = "";
					
				}else{
					alert("預約更新失敗");
				}
			}
		
		};
	}
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

  <script src="js/main.js"></script>

</body>

</html>