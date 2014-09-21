<spring:message code="title.linkedin.connected" var="linkedinConnected" />
<spring:message code="linkedin.connected" var="linkedinConnectedStatus" />
<template:basic htmlTitle="${linkedinConnected}"
                bodyTitle="${linkedinConnected}">
    <div class="spacer"></div>
    <a href="<c:url value="/linkedin" />"> Your Profile </a>
</template:basic>