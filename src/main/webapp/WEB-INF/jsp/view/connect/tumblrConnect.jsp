<spring:message code="title.tumblr.connect" var="tumblrConnect" />
<template:basic htmlTitle="${tumblrConnect}"
                bodyTitle="${tumblrConnect}">
    <c:url value="/connect/tumblr" var="connectTumblrUrl" />
    <form:form action="${connectTumblrUrl}" method="POST">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="formInfo">
            <p>You haven't attached a Tumblr profile yet.</p>
        </div>
        <button class="btn btn-fb" type="submit"><i class="fa fa-tumblr fa-lg icon-rounded icon-fb"></i>Connect to Tumblr</button>
    </form:form>

</template:basic>