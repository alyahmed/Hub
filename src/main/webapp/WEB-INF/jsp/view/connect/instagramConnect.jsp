<spring:message code="title.instagram.connect" var="instagramConnect" />
<template:basic htmlTitle="${instagramConnect}"
                bodyTitle="${instagramConnect}">
    <c:url value="/connect/instagram" var="connectInstagramUrl" />
    <form:form action="${connectInstagramUrl}" method="POST">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="formInfo">
            <p>You haven't created any connections with Instagram yet.</p>
        </div>

        <button class="btn btn-fb" type="submit"><i class="fa fa-instagram fa-lg icon-rounded icon-fb">

            </i>Connect to Instagram</button>
    </form:form>
</template:basic>