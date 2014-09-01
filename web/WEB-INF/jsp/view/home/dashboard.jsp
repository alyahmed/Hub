<%--@elvariable id="profiles" type="org.springframework.social.twitter.api.Twitter.friendOperations()"--%>
<spring:message code="title.home.dashboard" var="dashboardTitle" />
<template:basic htmlTitle="${dashboardTitle}"
	bodyTitle="${dashboardTitle}">
	<c:url value="/twitter/tweet" var="newTweetUrl" />
	<div id="form">
		<h4>Post a tweet</h4>
			<form action="${newTweetUrl}" method="post">
				<input type="hidden" name="_csrf" value="${_csrf.token}" />
				<textarea name="message" rows="2" cols="80"></textarea><br/>
				<input type="submit" value="Post Tweet"/>
			</form>
	</div>
	
	<div id="friends">
		<ul class="imagedList">
			<h4> Your Friends </h4>
			<c:forEach items="${friends}" var="friend">
				<li class="imagedItem">
					<div class="image">
					</div>
					<div class="content">
						<p>
							<a href="<c:url value="${friend.profileUrl}" /> "> ${friend.screenName}</a>
							 <img src='<c:url value="${friend.profileImageUrl}" />'>
						</p> 
					</div>
				</li>
			</c:forEach>
		</ul>
		
		<div>
			<h3> Home Timeline </h3>
			<c:forEach items="${timeline}" var="tweet">
				
				<c:if test="${tweet.profileImageUrl != null}">
					<img src="${tweet.profileImageUrl}" align="left" />
				</c:if>
				<div class="content">
					<strong><a href="'http://twitter.com/' + ${tweet.fromUser}"> ${tweet.fromUser} </a></strong><br/>
					<span> ${tweet.text} </span><br/>
					<span class="postTime"> ${tweet.createdAt} </span>
			    </div>
			</c:forEach>
		</div>		
	</div>

</template:basic>
