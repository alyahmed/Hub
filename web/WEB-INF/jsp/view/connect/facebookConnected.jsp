<spring:message code="title.facebook.connected" var="facebookConnected" />
<template:basic htmlTitle="${facebookConnected}"
	bodyTitle="${facebookConnected}">

	<div id="content">

		<a href="<c:url value="/facebook" />"> Your Profile </a>
</template:basic>