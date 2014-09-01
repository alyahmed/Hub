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
		
		<a href="${socialStatus}"> <spring:message code="nav.item.social.status" /> </a>
		<br />
        <security:authorize access="hasAuthority('VIEW_USER_SESSIONS')">
            <a href="${listSessions}"><spring:message
					code="nav.item.list.session" /></a>
			<br />
        </security:authorize>
        <a href="javascript:void 0;"
			onclick="postInvisibleForm('<c:url value="/logout" />', { });"><spring:message
				code="nav.item.logout" /></a>
		<br />
        <jsp:invoke fragment="extraNavigationContent" />
        <br />Welcome, <security:authentication
			property="principal.username" />!
    </jsp:attribute>
	<jsp:body>
        <jsp:doBody />
    </jsp:body>
</template:main>
