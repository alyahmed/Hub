<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ attribute name="htmlTitle" type="java.lang.String"
              rtexprvalue="true" required="true"%>
<%@ attribute name="bodyTitle" type="java.lang.String"
              rtexprvalue="true" required="true"%>
<%@ include file="/WEB-INF/jsp/base.jspf"%>
<template:main htmlTitle="${htmlTitle}" bodyTitle="${bodyTitle}">
    <jsp:attribute name="navigationContent">

        <c:url var="homeUrl" value="/connect" /> <!-- Dashboard Console -->
        <c:url var="socialConnect" value="/connect" /> <!-- Check List of all active social media connections -->
        <c:url var="listSessions" value="/session/list" /> <!-- List of current Sessions -->
        <c:url var="logoutUrl" value="/logout" /> <!-- Log out of application -->
        <c:url var="twitterProfile" value="/connect/twitter" /> <!-- Check out Twitter Profile or Status-->
        <c:url var="facebookProfile" value="/connect/facebook" /> <!-- Check out Facebook Profile or Status-->
        <c:url var="linkedinProfile" value="/connect/linkedin" /> <!-- Check out Twitter Profile or Status-->
        <c:url var="instagramProfile" value="#" /> <!-- Check out Instagram Profile or Status-->
        <c:url var="redditProfile" value="#" /> <!-- Check out Reddit profile -->
        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top"
             role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle"
                        data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${homeUrl}"> <spring:message
                        code="title.application" /> </a>
            </div>

            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li><a href="${socialConnect}"><i
                                class="fa fa-dashboard"></i>   
                            <spring:message code="nav.item.social.dashboard" /></a></li>

                    <security:authorize access="hasAuthority('VIEW_USER_SESSIONS')">
                        <li>
                            <a href="${listSessions}">
                                <i class="fa fa-bar-chart-o"></i> 
                                <spring:message code="nav.item.list.session" />
                            </a>
                        </li>
                    </security:authorize>

                    <!-- Twitter Specific Links -->
                    <li><a href="${twitterProfile}">
                            <i class="fa fa-twitter-square"></i>  <spring:message
                                code="nav.item.social.twitter" /></a>
                    </li>

                    <!-- Facebook Specific Links -->
                    <li><a href="${facebookProfile}">
                            <i class="fa fa-facebook-square"></i>  <spring:message
                                code="nav.item.social.facebook" /></a>
                    </li>

                    <!-- Linkedin Specific Links -->
                    <li><a href="${linkedinProfile}">
                            <i class="fa fa-linkedin-square"> </i>  <spring:message
                                code="nav.item.social.linkedin" /></a>
                    </li>
                    <!-- Instagram Specific Links -->
                    <li><a href="${instagramProfile}">
                            <i class="fa fa-instagram"></i>  <spring:message
                                code="nav.item.social.instagram" /></a>
                    </li>
                    
                    <!-- Reddit Specific Links -->
                    <li><a href="${redditProfile}">
                            <i class="fa fa-reddit-square"></i>  <spring:message
                                code="nav.item.social.reddit" /></a>
                    </li>

                </ul>

                <ul class="nav navbar-nav navbar-right navbar-user">
                    <li class="dropdown user-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                class="fa fa-user"></i> <security:authentication
                                property="principal.username" /> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> Inbox <span
                                        class="badge">7</span></a></li>
                            <li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
                            <li class="divider"></li>
                            <li><a href="javascript:void 0;"
                                   onclick="postInvisibleForm('<c:url value="/logout" />', {});"><i
                                        class="fa fa-power-off"></i> <spring:message
                                        code="nav.item.logout" /> </a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>	

    </jsp:attribute>

    <jsp:body>
        <div id="page-wrapper">
            <jsp:doBody />
        </div>

    </jsp:body>
</template:main>
