<spring:message code="title.instagram.connected" var="instagramConnected" />
<template:basic htmlTitle="${instagramConnected}"
	bodyTitle="${instagramConnected}">
	<div id="content">
		<a href="<c:url value="/instagram" />"> Your Profile </a>
</template:basic>
