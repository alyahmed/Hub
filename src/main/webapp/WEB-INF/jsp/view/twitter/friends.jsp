<%--@elvariable id="profiles" type="org.springframework.social.twitter.api.Twitter.friendOperations()"--%>
<spring:message code="title.twitter.friends" var="twitterFriends" />
<template:basic htmlTitle="${twitterFriends}"
	bodyTitle="${twitterFriends}">
	<div id="content" layout:fragment="content">
		<h3>Your Twitter Friends</h3>

		<ul class="imagedList">
			<c:forEach items="${profiles}" var="profile">
				<li class="imagedItem">
					<div class="image">
					</div>
					<div class="content">
						<p>
							<a href="<c:url value="http://twitter.com/${profile.name}" /> "> ${profile.screenName}</a>
						</p> 
					</div>
				</li>
			</c:forEach>

		</ul>
	</div>
</template:basic>
