<spring:message code="title.twitter.profile" var="twitterProfile" />
<template:basic htmlTitle="${twitterProfile}"
	bodyTitle="${twitterProfile}">
	<c:url var="twitterTimeline" value="/twitter/timeline" />
	<!-- Twitter Timeline -->
	<c:url var="twitterFriends" value="/twitter/friends" />
	<!-- Twitter Friends Page -->
	<c:url var="twitterTrends" value="/twitter/trends" />
	<!-- Twitter Global Trends -->
	<c:url var="twitterMessages" value="/twitter/messages" />
	<!-- Twitter Direct Messages -->
	<div id="content" layout:fragment="content">

		<p>
			Hello, <span> ${profile.name}</span>
		</p>
		<img src="<c:url value="${profile.profileImageUrl}" />" />

		<dl>
			<dt>Twitter ID:</dt>
			<dd>${profile.id}</dd>
			<dt>Screen name:</dt>
			<dd>
				<a href="${profile.profileUrl}"> ${profile.screenName}</a>
			</dd>
			<dt>Description:</dt>
			<dd>${profile.description}</dd>
			<dt>Location:</dt>
			<dd>${profile.location}</dd>
			<dt>URL:</dt>
			<dd>
				<a href="${profile.url}"> ${profile.url}</a>
			</dd>

		</dl>

		<form action="<c:url value="/connect/twitter" />" method="DELETE">
			<input type="hidden" name="_csrf" value="${_csrf.token}" />
			<button type="submit">
				<spring:message code="twitter.disconnect" />
			</button>
			<input type="hidden" name="_method" value="delete" />
		</form>

	</div>
	<li><a href="${twitterTimeline}"><spring:message
				code="nav.item.social.twitter.timeline" /></a></li>
	<li><a href="${twitterFriends}"><spring:message
				code="nav.item.social.twitter.friends" /></a></li>
	<li><a href="${twitterTrends}"><spring:message
				code="nav.item.social.twitter.trends" /></a></li>
	<li><a href="${twitterMessages}"><spring:message
				code="nav.item.social.twitter.messages" /></a></li>
</template:basic>
