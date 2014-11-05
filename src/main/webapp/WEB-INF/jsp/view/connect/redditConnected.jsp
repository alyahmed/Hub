<spring:message code="title.reddit.connected" var="redditConnected" />
<template:basic htmlTitle="${redditConnected}"
                bodyTitle="${redditConnected}">
    <div class="spacer"></div>
    <a href="<c:url value="/reddit" />"> Your Profile </a>
</template:basic>