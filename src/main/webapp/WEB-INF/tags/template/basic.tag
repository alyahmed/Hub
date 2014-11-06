<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ attribute name="htmlTitle" type="java.lang.String"
              rtexprvalue="true" required="true"%>
<%@ attribute name="bodyTitle" type="java.lang.String"
              rtexprvalue="true" required="true"%>
<%@ include file="/WEB-INF/jsp/base.jspf"%>
<%@ attribute name="pageCss" required="false" %>
<%@ attribute name="pageJs" required="false" %>
<template:main htmlTitle="${htmlTitle}" bodyTitle="${bodyTitle}">

    <jsp:attribute name="header">
        <!-- SITE URLS -->
        <spring:message code="header.user.profile" var="userProfile" ></spring:message>
        <spring:message code="nav.item.social.dashboard" var="socialDashboard" />
        <spring:message code="nav.item.social.twitter" var="twitterTitle" />
        <spring:message code="nav.item.social.facebook" var="facebookTitle" />
        <spring:message code="nav.item.social.timeline" var="timelineTitle" />
        <spring:message code="nav.item.social.google" var="googleTitle" />
        <spring:message code="nav.item.list.session" var="listSessions" />
        <spring:message code="nav.item.social.instagram" var="instagramTitle" />
        <spring:message code="nav.item.social.tumblr" var="tumblrTitle" />
        <spring:message code="nav.item.social.reddit" var="redditTitle" />
        <spring:message code="nav.item.social.flickr" var="flickrTitle" />
        <security:authentication var="username" property="principal.username" />

        <c:url var="homeUrl" value="/connect" /> <!-- Dashboard Console -->
        <c:url var="logoUrl" value="/resource/img/logo_1.png" /> <!-- Website Logo -->
        <c:url var="profileUrl" value="/user/profile" /> <!-- User Profile Settings -->
        <c:url var="socialConnectUrl" value="/connect" /> <!-- Check List of all active social media connections -->
        <c:url var="listSessionsUrl" value="/session/list" /> <!-- List of current Sessions -->
        <c:url var="logoutUrl" value="/logout" /> <!-- Log out of application -->
        <c:url var="twitterProfileUrl" value="/connect/twitter" /> <!-- Check out Twitter Profile or Status-->
        <c:url var="facebookProfileUrl" value="/connect/facebook" /> <!-- Check out Facebook Profile or Status-->
        <c:url var="linkedinProfileUrl" value="/connect/linkedin" /> <!-- Check out Twitter Profile or Status-->
        <c:url var="googleProfileUrl" value="/connect/google" />
        <c:url var="instagramProfileUrl" value="/connect/instagram" />
        <c:url var="tumblrProfileUrl" value="/connect/tumblr" />
        <c:url var="redditProfileUrl" value="/connect/reddit" /> <!-- Reddit Profile -->
        <c:url var="flickrProfileUrl" value="/connect/flickr" />
        <c:url var="timelineUrl" value="/timeline" /> <!-- Timeline -->
        <c:url var="profilePictureUrl" value="/resource/img/user4.jpg" /> 
        <c:url var="settingsUrl" value="/user/settings" />
        <c:url var="logoUrl" value="/resource/img/logo.png" />

        <!-- END OF SITE URLS -->
        <!-- Header Start -->
        <a href="${homeUrl}" class="logo">
            <img src="${logoUrl}" alt="Logo">
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <div>
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <div class="responsive_nav"></div>
                </a>
            </div>
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img data-src="holder.js/35x35/#fff:#000" width="35" class="img-circle img-responsive pull-left" height="35" alt="riot">
                            <div class="riot">
                                <div>
                                    ${username}
                                    <span>
                                        <i class="caret"></i>
                                    </span>
                                </div>
                            </div>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header bg-light-blue">
                                <img src="${profilePictureUrl}" class="img-responsive img-circle" alt="User Image">
                                <p class="topprofiletext">${username}</p>
                            </li>
                            <!-- Menu Body -->
                            <li>
                                <a href="${profileUrl}">
                                    <i class="livicon" data-name="user" data-s="18"></i>
                                    My Profile
                                </a>
                            </li>
                            <li role="presentation"></li>
                            <li>
                                <a href="${profileUrl}">
                                    <i class="livicon" data-name="gears" data-s="18"></i>
                                    Account Settings
                                </a>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <a href="javascript:void 0;" onclick="postInvisibleForm('${logoutUrl}', {});" >
                                    <i class="livicon" data-name="sign-out" data-s="18"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- Header ends -->
    </jsp:attribute>


    <jsp:attribute name="navigationContent">
        <section class="sidebar purplebg">
            <div class="page-sidebar  sidebar-nav">
                <div class="nav_icons">
                    <ul class="sidebar_threeicons">
                        <li>
                            <a href="${settingsUrl}">
                                <i class="livicon" data-name="user" title="Form Builder 1" data-loop="true" data-color="#42aaca" data-hc="#42aaca" data-s="25"></i>
                            </a>
                        </li>
                        <li>
                            <a href="${profileUrl}">
                                <i class="livicon" data-name="settings" title="Form Builder 2" data-loop="true" data-color="#e9573f" data-hc="#e9573f" data-s="25"></i>
                            </a>
                        </li>
                        <li>
                            <a href="buttonbuilder.html">
                                <i class="livicon" data-name="vector-square" title="Button Builder" data-loop="true" data-color="#f6bb42" data-hc="#f6bb42" data-s="25"></i>
                            </a>
                        </li>
                        <li>
                            <a href="gridmanager.html">
                                <i class="livicon" data-name="new-window" title="Page Builder" data-loop="true" data-color="#37bc9b" data-hc="#37bc9b" data-s="25"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
                <!-- BEGIN SIDEBAR MENU -->
                <ul id="menu" class="page-sidebar-menu">
                    <li>
                        <a class="has-sub" href="${timelineUrl}">
                            <i class="livicon" data-name="tasks" data-size="18" data-c="#EF6F6C" data-hc="##EF6F6C" data-loop="true"></i>
                            ${timelineTitle}</a>
                    </li>
                    <security:authorize access="hasAuthority('VIEW_USER_SESSIONS')">
                        <li>
                            <a href='${listSessionsUrl}'>
                                <i class="livicon" data-name="users" data-size="18" data-c="#F89A14" data-hc="#F89A14" data-loop="true"></i>
                                <span>${listSessions}</span>
                            </a>
                        </li>
                    </security:authorize>
                    <li>
                        <a href="${socialConnectUrl}">
                            <i class="livicon" data-name="home" data-size="18" data-c="#418BCA" data-hc="#418BCA" data-loop="true"></i>
                            <span class="title">${socialDashboard}</span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <i class="livicon" data-name="barchart" data-size="18" data-c="#6CC66C" data-hc="#6CC66C" data-loop="true"></i>
                            <span class="title"> Analytics </span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="livicon" data-name="comment" data-c="#67C5DF" data-hc="#67C5DF" data-size="18" data-loop="true"></i>
                            <span class="title">Social Connections</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <!-- Twitter Specific Links -->
                            <li><a href="${twitterProfileUrl}">
                                    <i class="livicon" data-name="twitter" data-size="18" data-c="#fff" data-hc="#fff" data-loop="true"></i>  ${twitterTitle}</a>
                            </li>
                            <!-- Facebook Specific Links -->
                            <li><a href="${facebookProfileUrl}">
                                    <i class="livicon" data-name="facebook-alt" data-size="18" data-c="#fff" data-hc="#fff" data-loop="true"></i> ${facebookTitle}</a>
                            </li>
                            <!-- Google Specific Links -->
                            <li><a href="${googleProfileUrl}">
                                    <i class="livicon" data-name="google-plus" data-size="18" data-c="#fff" data-hc="#fff" data-loop="true"></i> ${googleTitle}</a>
                            </li>
                            <!-- Instagram Specific Links -->
                            <li><a href="${instagramProfileUrl}">
                                    <i class="livicon" data-name="instagram" data-c="#fff" data-hc="#fff" data-size="18" data-loop="true"></i>
                                    ${instagramTitle}</a>
                            </li>
                            <!-- Tumblr Specific Links -->
                            <li><a href="${tumblrProfileUrl}">
                                    <i class="livicon" data-name="tumblr" data-size="18" data-c="#fff" data-hc="#fff" data-loop="true"></i>  ${tumblrTitle}</a>
                            </li>
                            <!-- Reddit Specific Links -->
                            <li><a href="${redditProfileUrl}">
                                    <i class="livicon" data-name="reddit" data-c="#fff" data-hc="#fff" data-size="18" data-loop="true"></i>
                                    ${redditTitle}</a>
                            </li>
                            <!-- Flickr Specific Links -->
                            <li><a href="${flickrProfileUrl}">
                                    <i class="livicon" data-name="flickr" data-size="18" data-c="#fff" data-hc="#fff" data-loop="true"></i>  ${flickrTitle}</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- END SIDEBAR MENU -->
            </div>
        </section>
    </jsp:attribute>
    <jsp:body>
        <aside class="right-side">
            <!-- Main content -->
            <section class="content-header">
                <h1>${bodyTitle}</h1>
            </section>
            <section class="content">
                <jsp:doBody />
            </section>
        </aside>
    </jsp:body>
</template:main>
