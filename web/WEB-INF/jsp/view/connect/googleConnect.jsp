<spring:message code="title.google.connect" var="googleConnect" />

<template:basic htmlTitle="${googleConnect}"
                bodyTitle="${googleConnect}">
    <c:url value="/connect/google" var="connectGoogleUrl" />
    <form:form action="${connectGoogleUrl}" method="POST">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="formInfo">
            <p>You haven't created any connections with Google Plus yet. Click
                the button to connect Hub Social with your Google
                account. (You'll be redirected to Google where you'll be asked to
                authorize the connection.)</p>
        </div>
        <button type="submit">Connect to Google </button>
    </form:form>
</template:basic>