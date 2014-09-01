<spring:message code="title.facebook.profile" var="facebookProfile" />
<template:basic htmlTitle="${facebookProfile}"
	bodyTitle="${facebookProfile}">
	<div id="content" layout:fragment="content">
			<h3>Your Facebook Profile</h3>
			<p>Hello, <span> ${profile.firstName} </span>!</p>
			<dl>
				<dt>Facebook ID:</dt>
				<dd> ${profile.id} </dd>
				<dt>Name:</dt>
				<dd> ${profile.name} </dd>
				<dt>Email:</dt>
				<dd> ${email}</dd>
			</dl>
		
			<form id="disconnect" action="<c:url value="/connect/facebook" />" method="DELETE">
				<input type="hidden" name="_csrf" value="${_csrf.token}" />
				<button type="submit">Disconnect from Facebook</button>	
				<input type="hidden" name="_method" value="delete" />
			</form>			
		</div>
</template:basic>
