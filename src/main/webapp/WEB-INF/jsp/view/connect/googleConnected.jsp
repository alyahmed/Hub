<spring:message code="title.google.connected" var="googleConnected" />
<template:basic htmlTitle="${googleConnected}"
	bodyTitle="${googleConnected}">
	<div id="content">
		<a href="<c:url value="/google" />"> Your Profile </a>
</template:basic>