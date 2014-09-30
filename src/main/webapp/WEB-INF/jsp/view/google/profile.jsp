
<spring:message code="title.twitter.profile" var="twitterProfile" />
<template:basic htmlTitle="${twitterProfile}"
                bodyTitle="${twitterProfile}">
                
    <c:url value="/google/tasks/list" var="tasksUrl" />
    
    <a href="${tasksUrl}"> Tasks </a>
    
    
    
</template:basic>
