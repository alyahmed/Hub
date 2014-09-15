<spring:message code="title.linkedin.connected" var="linkedinConnected" />
<spring:message code="linkedin.connected" var="linkedinConnectedStatus" />
<template:basic htmlTitle="${linkedinConnected}"
	bodyTitle="${linkedinConnected}">
		<h3> ${linkedinConnectedStatus}</h3>

		<a href="<c:url value="/linkedin" />"> Your Profile </a>
</template:basic>