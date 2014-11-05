<spring:message code="title.flickr.connect" var="flickrConnect" />
<template:basic htmlTitle="${flickrConnect}"
                bodyTitle="${flickrConnect}">
    <c:url value="/connect/flickr" var="connectFlickrUrl" />
    <form:form action="${connectFlickrUrl}" method="POST">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="formInfo">
            <p>You haven't created any connections with Flickr yet.</p>
        </div>
        <button class="btn btn-fb" type="submit"><i class="fa fa-flickr fa-lg icon-rounded icon-fb"></i>Connect to Flickr</button>
    </form:form>
</template:basic>