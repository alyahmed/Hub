<spring:message code="title.twitter.connected" var="twitterConnected" />
<template:basic htmlTitle="${twitterConnected}"
	bodyTitle="${twitterConnected}">

	<div id="content" layout:fragment="content">
			<h3> You are connected to twitter</h3>
			
			<a href="<c:url value="/twitter" />"> Your Profile </a>
</template:basic>