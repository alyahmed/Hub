<spring:message code="title.twitter.connect" var="twitterConnectTitle" />
<template:basic htmlTitle="${twitterConnectTitle}" bodyTitle="${twitterConnectTitle}">
    <div class="container-fluid">
        <div class="row">
            <spring:message code="twitter.status.notConnected" var="twitterNotConnected"></spring:message>
            <c:url value="/connect/twitter" var="connectTwitterUrl" />
            <form:form action="${connectTwitterUrl}" method="POST">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="formInfo">
                    <p> You haven't created any connections with Twitter yet. </p>
                </div>
                <button class="btn btn-twitter " type="submit">Connect to Twitter</button>
            </form:form>
        </div>
    </div>
</template:basic>