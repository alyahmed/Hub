<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ attribute name="htmlTitle" type="java.lang.String"
	rtexprvalue="true" required="true"%>
<%@ attribute name="bodyTitle" type="java.lang.String"
	rtexprvalue="true" required="true"%>
<%@ attribute name="extraHeadContent" fragment="true" required="false"%>
<%@ attribute name="extraNavigationContent" fragment="true"
	required="false"%>
<%@ include file="/WEB-INF/jsp/base.jspf"%>
<template:main htmlTitle="${htmlTitle}" bodyTitle="${bodyTitle}">
	<jsp:attribute name="headContent">
        <jsp:invoke fragment="extraHeadContent" />
    </jsp:attribute>
	<jsp:attribute name="navigationContent">

        <c:url var="socialStatus" value="/connect" /> <!-- Check List of all active social media connections -->
		<c:url var="listSessions" value="/session/list" /> <!-- List of current Sessions -->
		<c:url var="logoutUrl" value="/logout" /> <!-- Log out of application -->

        <jsp:invoke fragment="extraNavigationContent" />
         <div id="sidebar-left" class="col-xs-2 col-sm-2">
             <h4> Welcome, <security:authentication
                     property="principal.username" />!
             </h4>
             <ul class="nav main-menu">
                 <li>
                     <a href="${socialStatus}" class="active ajax-link">
                         <i class="fa fa-dashboard"></i>
                         <span class="hidden-xs"> <spring:message code="nav.item.social.status" />  </span>
                     </a>
                 </li>
                 <security:authorize access="hasAuthority('VIEW_USER_SESSIONS')">
                     <li>
                         <a href="${listSessions}" class="active ajax-link">
                             <i class="fa fa-dashboard"></i>
                            <span class="hidden-xs"> <spring:message
                                    code="nav.item.list.session" />  </span>
                         </a>
                     </li>
                 </security:authorize>
                 <li>
                     <a href="javascript:void 0;"
                        onclick="postInvisibleForm('<c:url value="/logout" />', { });"><spring:message
                             code="nav.item.logout" /></a>
                 </li>

             </ul>
         </div>


    </jsp:attribute>
	<jsp:body>
        <jsp:doBody />
    </jsp:body>
</template:main>
