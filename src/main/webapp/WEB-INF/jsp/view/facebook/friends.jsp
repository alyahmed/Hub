<spring:message code="title.facebook.friends" var="facebookFriends" />
<template:basic htmlTitle="${facebookFriends}"
	bodyTitle="${facebookFriends}">

	<div id="content" layout:fragment="content">
		<h3>Your Facebook Friends</h3>
		<ul class="friends">
			<c:forEach items="${friends}" var="friend">
				<li><img
					src="'http://graph.facebook.com/' + ${friend.id} +'/picture'"
					align="middle" /> <span> ${friend.name} </span></li>
			</c:forEach>
		</ul>
		
		=========================
		
		<ul class="friends">
			<c:forEach items="${friendIds}" var="friend">
				<li>
				${friendId }
					</li>
			</c:forEach>
		</ul>
	</div>
</template:basic>
