<spring:message code="title.facebook.connected" var="facebookConnected" />
<template:basic htmlTitle="${facebookConnected}"
	bodyTitle="${facebookConnected}">

	<div id="content" layout:fragment="content">
		<h3>You are connected to Facebook</h3>

		<a href="<c:url value="/facebook" />"> Your Profile </a>
</template:basic>