<spring:message code="title.google.connect" var="googleConnect" />
<template:basic htmlTitle="${googleConnect}"
                bodyTitle="${googleConnect}">
    <c:url value="/connect/google" var="connectGoogleUrl" />
    <form:form action="${connectGoogle}" method="POST">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="formInfo">
            <p>You haven't created any connections with Google yet.</p>
        </div>

        <button class="btn btn-fb" type="submit"><i class="fa fa-google fa-lg icon-rounded icon-fb"></i>Connect to Google</button>
    </form:form>
</template:basic>