<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ attribute name="htmlTitle" type="java.lang.String"
              rtexprvalue="true" required="true"%>
<%@ attribute name="bodyTitle" type="java.lang.String"
              rtexprvalue="true" required="true"%>
<%@ include file="/WEB-INF/jsp/base.jspf"%>
<template:main htmlTitle="${htmlTitle}" bodyTitle="${bodyTitle}">
    <jsp:attribute name="header">
        <!-- SITE URLS -->
        <spring:message code="header.user.profile" var="userProfile" ></spring:message>
        <spring:message code="nav.item.social.dashboard" var="socialDashboard" />
        <spring:message code="nav.item.social.twitter" var="twitterTitle" />
        <spring:message code="nav.item.social.facebook" var="facebookTitle" />
        <spring:message code="nav.item.social.linkedin" var="linkedinTitle"/>
        <spring:message code="nav.item.social.instagram" var="instagramTitle" />
        <spring:message code="nav.item.social.timeline" var="timelineTitle" />
        <spring:message code="nav.item.list.session" var="listSessions" />
        
        <security:authentication var="userName" property="principal.username" />
        <c:url var="homeUrl" value="/connect" /> <!-- Dashboard Console -->
        <c:url var="logoUrl" value="/resource/img/logo_1.png" /> <!-- Website Logo -->
        <c:url var="profileUrl" value="/user/profile" /> <!-- User Profile Settings -->
        <c:url var="socialConnectUrl" value="/connect" /> <!-- Check List of all active social media connections -->
        <c:url var="listSessionsUrl" value="/session/list" /> <!-- List of current Sessions -->
        <c:url var="logoutUrl" value="/logout" /> <!-- Log out of application -->
        <c:url var="twitterProfileUrl" value="/connect/twitter" /> <!-- Check out Twitter Profile or Status-->
        <c:url var="facebookProfileUrl" value="/connect/facebook" /> <!-- Check out Facebook Profile or Status-->
        <c:url var="linkedinProfileUrl" value="/connect/linkedin" /> <!-- Check out Twitter Profile or Status-->
        <c:url var="instagramProfileUrl" value="#" /> <!-- Check out Instagram Profile or Status-->
        <c:url var="timelineUrl" value="/timeline" /> <!-- Timeline -->
        <c:url var="profilePictureUrl" value="/resource/img/user4.jpg" /> 
        <c:url var="settingsUrl" value="/user/settings" />
        
        <!-- END OF SITE URLS -->
        <!-- Header Start -->
        <header>
            <!-- Logo starts -->
            <div class="logo">
                <a href="${homeUrl}">
                    <img src="${logoUrl}" alt="logo">
                    <span class="menu-toggle hidden-xs">
                        <i class="fa fa-bars"></i>
                    </span>
                </a>
            </div>
            <!-- Logo ends -->

            <!-- Mini right nav starts -->
            <div class="pull-right">
                <ul id="mini-nav" class="clearfix">
                    <li class="list-box user-profile hidden-xs">
                        <a href="javascript:void 0;" onclick="postInvisibleForm('${logoutUrl}', {});" class="user-avtar animated rubberBand">
                            <img src="${profilePictureUrl}" alt="user avatar">
                        </a>
                    </li>
                </ul>
            </div>
            <!-- Mini right nav ends -->
        </header>
        <!-- Header ends -->
    </jsp:attribute>


    <jsp:attribute name="navigationContent">
        <!-- Left sidebar starts --> 
        <aside id="sidebar">
            <!-- Current User Starts -->
            <div class="current-user">
                <div class="user-avatar animated rubberBand">
                    <img src="${profilePictureUrl}" alt="Current User">
                    <span class="busy"></span>
                </div>
                <div class="user-name">Welcome, ${userName}</div>
                <ul class="user-links">
                    <li>
                        <a href="${profileUrl}">
                            <i class="fa fa-user text-success"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${settingsUrl}">
                            <i class="fa fa-sliders text-info"></i>
                        </a>
                        
                    <li>
                        <a href="javascript:void 0;" onclick="postInvisibleForm('${logoutUrl}', {});">
                            <i class="fa fa-sign-out text-danger"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- Current User Ends -->
            <!-- Menu start -->
            <div id='menu'>
                <ul  class="side-menu">
                    <li >
                        <a href='${socialConnectUrl}'>
                            <i class="fa fa-desktop"></i>
                            <span>${socialDashboard}</span>
                        </a>
                    </li>

                    <li><a class="has-sub" href="${timelineUrl}">
                            <i class="fa fa-sliders"></i>${timelineTitle}</a>
                    </li>
                    <security:authorize access="hasAuthority('VIEW_USER_SESSIONS')">

                        <li>
                            <a href='${listSessionsUrl}'>
                                <i class="fa fa-sliders"></i> 
                                <span>${listSessions}</span>
                            </a>
                        </li>
                    </security:authorize>
                    <!-- Twitter Specific Links -->
                    <li><a class="has-sub" href="${twitterProfileUrl}">
                            <i class="fa fa-twitter"></i>  ${twitterTitle}</a>
                    </li>

                    <!-- Facebook Specific Links -->
                    <li><a href="${facebookProfileUrl}">
                            <i class="fa fa-facebook"></i>  ${facebookTitle}</a>
                    </li>

                    <!-- Linkedin Specific Links -->
                    <li><a href="${linkedinProfileUrl}">
                            <i class="fa fa-linkedin"> </i>  ${linkedinTitle}</a>
                    </li>
                    <!-- Instagram Specific Links -->
                    <li><a href="${instagramProfileUrl}">
                            <i class="fa fa-instagram"></i>  ${instagramTitle}</a>
                    </li>
                </ul>
            </div>
            <!-- Menu End -->
        </aside>
        <!-- Left sidebar ends -->
    </jsp:attribute>
    <jsp:body>
        <div class="dashboard-wrapper">
            <div class="spacer">
                <div class="top-bar">
                    <div class="page-title">
                        ${bodyTitle}
                    </div>
                </div>
            </div>
            <div class="main-container">
                <div class="container-fluid">
                    <jsp:doBody />
                </div>
            </div>
            <div class="right-sidebar"></div>
        </div>
    </jsp:body>
</template:main>
