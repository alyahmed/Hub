<spring:message code="title.twitter.profile" var="twitterProfile" />
<template:basic htmlTitle="${twitterProfile}"
	bodyTitle="${twitterProfile}">
	<div id="content" layout:fragment="content">
		
		<p> Hello, <span> ${profile.name}</span> </p>
		<img src="<c:url value="${profile.profileImageUrl}" />" />
		
		<dl>
			<dt> Twitter ID: </dt>
			<dd> ${profile.id} </dd>
			<dt> Screen name: </dt>
			<dd> <a href="${profile.profileUrl}"> ${profile.screenName}</a></dd>
			<dt> Description: </dt>
			<dd> ${profile.description} </dd>
			<dt> Location: </dt>
			<dd> ${profile.location} </dd>
			<dt> URL: </dt>
			<dd> <a href="${profile.url}"> ${profile.url}</a> </dd>
		
		</dl>
		
		<form action="<c:url value="/connect/twitter" />" method ="DELETE">
			<input type="hidden" name="_csrf" value="${_csrf.token}" />
			<button type="submit"> <spring:message code="twitter.disconnect" /></button>
			<input type="hidden" name="_method" value="delete" />
		</form>
	
	</div>
</template:basic>
