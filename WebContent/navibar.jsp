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
                        <li><a href="<c:url value='houselist'/>">買房</a></li>
                        <li><a href="<c:url value='SearchTaipeiAction.do'/>">房屋(台北)</a></li>
                        <li><a href="<c:url value='mrt.jsp'/>">用捷運找</a></li>
                        <!-- <li><a href="rent.html">租房</a></li> -->
                        <li><a href="<c:url value='newsList'/>">地方新聞</a></li>
                        <li><a href="process.jsp">購屋流程</a></li>
                        <c:if test="${empty LoginOK}">
                            <li><a href="_08_registerMember.jsp">會員註冊</a></li>
                            <li><a href="_08_login.jsp">會員登入</a></li>
                        </c:if>
                        <c:if test="${!empty LoginOK}">
                            <li class="has-children">
                            	<a>${LoginOK2}</a>
                            	<ul class="dropdown arrow">
                            		<li><a href="<c:url value='showMemberData?ACCT=${LoginOK3}'/>">個人資料</a>
                        			<li><a href="<c:url value='memberhouse'/>">我的物件</a></li>
                                    <li><a href="<c:url value='favoriteList.jsp'/>">我的最愛</a></li>
                            		<li><a href="<c:url value='springlogout.do'/>">會員登出</a></li>
                            	</ul>
                            
                            </li>
                        </c:if>
                        <!-- <li><a href="contact.html">聯絡我們</a></li> -->
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>