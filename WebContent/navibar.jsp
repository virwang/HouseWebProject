<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="site-mobile-menu">
    <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
        </div>
    </div>
    <div class="site-mobile-menu-body"></div>
</div> <!-- .site-mobile-menu -->

<div class="site-navbar mt-4">
    <div class="container py-1">
        <div class="row align-items-center">
            <div class="col-8 col-md-8 col-lg-4">
                <h1 class="mb-0">
                    <a href="index.jsp" class="text-white h2 mb-0">
                        <strong>好家在-想住哪就住哪
                            <span class="text-danger">.</span>
                        </strong>
                    </a>
                </h1>
            </div>

            <div class="col-4 col-md-4 col-lg-8">
                <nav class="site-navigation text-right text-md-right" role="navigation">

                    <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
                        <a href="#" class="site-menu-toggle js-menu-toggle text-white">
                            <span class="icon-menu h3"></span>
                        </a>
                    </div>

                    <ul class="site-menu js-clone-nav d-none d-lg-block">
                        <li class="has-children">
                        	<a>看房</a>
                        	<ul class="dropdown arrow">
                        		<li><a href="<c:url value='houselist'/>">房屋列表</a></li>
                        		<li><a href="<c:url value='searchhousemap'/>">房屋地圖(依捷運分類)</a></li>
                        	</ul>
                        </li>
                        
                        <li><a href="<c:url value='SearchTaipeiAction.do'/>">實價登錄</a></li>
<%--                         <li><a href="<c:url value='relate'/>">比價</a></li> --%>
                        <li class="has-children">
                        	<a href="<c:url value='lend'/>">房貸評測</a>
                        	<ul class="dropdown arrow">
                        		<li><a href="<c:url value='allLender'/>">房貸專員</a></li>
                        	</ul>
                        </li>
                        <li><a href="<c:url value='newsList'/>">地方新聞</a></li>
                        <c:if test="${empty memberBean}">
                            <li><a href="<c:url value='register'/>">會員註冊</a></li>
                            <li><a href="<c:url value='login'/>">會員登入</a></li>
                        </c:if>
                        <c:if test="${!empty memberBean}">
							<li class="has-children"><a>${memberBean.name}</a> 
							<c:if test="${!empty memberBean.base64image1}">
								<c:if test="${empty memberBean.googleId}">
									<img style="height: 50px; width: 50px; border-radius: 50%;"
										src="data:image/jpeg;base64,${memberBean.base64image1}"
										alt="Image" class="img-fluid">
								</c:if>
								<c:if test="${!empty memberBean.googleId}">
									<img style="height: 50px; width: 50px; border-radius: 50%;"
										src="${memberBean.base64image1}"
										alt="Image" class="img-fluid">
								</c:if>
							</c:if>
								
								<ul class="dropdown arrow">
									<li><a href="<c:url value='showMemberData'/>">個人資料</a> <c:if
											test="${memberBean.usertype=='Senior' || memberBean.usertype=='admin'}">
											<li><a href="<c:url value='memberhouse'/>">我的物件</a></li>
											<li><a href="<c:url value='showbank'/>">新增專員</a></li>
										</c:if>
									<li><a href="<c:url value='reservation'/>">預約狀況</a></li>
									<li><a href="<c:url value='favorite'/>">我的收藏</a></li>
									<%--                             		<li><a id="logout" href="<c:url value='springlogout.do'/>">會員登出</a></li> --%>
									<li><a id="logout" class="g-signout2" href="#">會員登出</a></li>
									<c:if test="${memberBean.usertype=='admin'}">
										<li><a href="<c:url value='admin_index'/>">後台管理</a></li>
									</c:if>
								</ul></li>
						</c:if>
                        <!-- <li><a href="contact.html">聯絡我們</a></li> -->
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>