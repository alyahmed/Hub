<spring:message code="title.linkedin.connected" var="linkedinConnected" />
<spring:message code="linkedin.notConnected" var="linkedinNotConnectedStatus" />
<template:basic htmlTitle="${linkedinConnected}"
                bodyTitle="${linkedinConnected}">
    <c:url value="/connect/linkedin" var="connectLinkedinUrl" />

    <form:form action="${connectLinkedinUrl}" method="POST">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="formInfo">
            <p>You haven't created any connections with LinkedIn yet.</p>
        </div>

        <button class="btn btn-linkedin" type="submit"><i class="fa fa-linked fa-lg icon-rounded icon-fb"></i>Connect to Linkedin</button>
    </form:form>
</template:basic>