<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ attribute name="htmlTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ attribute name="bodyTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ include file="/WEB-INF/jsp/base.jspf" %>
<template:loggedOutMain htmlTitle="${htmlTitle}" bodyTitle="${bodyTitle}">
    <jsp:body>
        <jsp:doBody />
    </jsp:body>
</template:loggedOutMain>
