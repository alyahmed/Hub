<spring:message code="title.reddit.connected" var="redditConnected" />
<spring:message code="reddit.connected" var="redditConnectedStatus" />
<template:basic htmlTitle="${redditConnected}"
                bodyTitle="${redditConnected}">
    <div class="spacer"></div>
    <a href="<c:url value="/reddit" />"> Your Profile </a>
</template:basic>