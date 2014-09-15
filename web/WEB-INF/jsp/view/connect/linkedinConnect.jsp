<spring:message code="title.linkedin.connected" var="linkedinConnected" />
<spring:message code="linkedin.notConnected" var="linkedinNotConnectedStatus" />
<template:basic htmlTitle="${linkedinConnected}"
                bodyTitle="${linkedinConnected}">
    <div id="content">
        <c:url value="/connect/linkedin" var="connectLinkedinUrl" />

        <form:form action="${connectLinkedinUrl}" method="POST">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="formInfo">
                <p>You haven't created any connections with LinkedIn yet. Click the button to connect Hub with your LinkedIn account. 
                    (You'll be redirected to LinkedIn where you'll be asked to authorize the connection.)</p>
            </div>

            <button type="submit">Connect to Linkedin</button>
            </form:form>
    </div>
</template:basic>