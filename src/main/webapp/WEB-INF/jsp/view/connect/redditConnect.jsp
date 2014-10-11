<spring:message code="title.reddit.connect" var="redditConnect" />
<template:basic htmlTitle="${redditConnect}"
                bodyTitle="${redditConnect}">
    <c:url value="/connect/reddit" var="connectRedditUrl" />
    <form:form action="${connectRedditUrl}" method="POST">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="formInfo">
            <p>You haven't created any connections with Reddit yet.</p>
        </div>

        <button class="btn btn-fb" type="submit"><i class="fa fa-reddit fa-lg icon-rounded icon-fb"></i>Connect to Reddit</button>
    </form:form>

</template:basic>