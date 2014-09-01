<spring:message code="title.twitter.messages" var="twitterMessages" />
<template:basic htmlTitle="${twitterMessages}"
	bodyTitle="${twitterMessages}">


	<div id="content" layout:fragment="content">
		<h3>
			Your Twitter <span th:text="${dmListType}">list type</span> Messages
		</h3>

		<!--  TODO: Bind form -->
		<form action="<c:url value="/twitter/messages" />" method="post">
			<input type="hidden" name="_csrf" value="${_csrf.token}" />
			<p>Send a message:</p>
			<label>To: </label>
			<input type="text" name="to" />
			<br />
			<textarea name="text" rows="2" cols="80"></textarea>
			<br />
			<input type="submit" value="Send Message" />
		</form>

		<ul class="choices">
			<li><a href="<c:url value="twitter/messages" />"">Inbox</a></li>
			<li><a th:href="<c:url value="twitter/messages/sent" />"">Sent</a></li>
		</ul>


		<div class="feed">
			<ul class="imagedList">

				<c:forEach items="directMessages" var="dm">
					<li class="imagedItem"><img src="${dm.sender.profileImageUrl}"
						align="left" /> <strong><a
							href="'http://twitter.com/' + ${dm.sender.screenName}"
							text="${dm.sender.screenName}">screen name</a></strong><br /> <span
						class="dmRecipient">to <span
							th:text="${dm.recipient.screenName}">screen name</span></span><br /> <span
						text="${dm.text}">text</span><br /> <span class="postTime"
						text="${dm.createdAt}"></span></li>
				</c:forEach>
			</ul>
		</div>
	</div>


</template:basic>