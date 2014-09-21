<spring:message code="title.facebook.connect" var="facebookConnect" />
<template:basic htmlTitle="${facebookConnect}"
                bodyTitle="${facebookConnect}">
    <c:url value="/connect/facebook" var="connectFacebookUrl" />
    <form:form action="${connectFacebookUrl}" method="POST">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="formInfo">
            <p>You haven't created any connections with Facebook yet.</p>
        </div>

        <button class="btn btn-fb" type="submit"><i class="fa fa-facebook fa-lg icon-rounded icon-fb"></i>Connect to Facebook</button>
    </form:form>




</template:basic>