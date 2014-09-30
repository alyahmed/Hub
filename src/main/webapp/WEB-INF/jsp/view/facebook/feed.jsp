<spring:message code="title.facebook.feed" var="facebookFeed" />
<template:basic htmlTitle="${facebookFeed}" bodyTitle="${facebookFeed}" >

    <h3>Your Facebook Feed</h3>

    <c:url var="facebookFeedUrl" value="/facebook/feed" />

    <form:form method="POST" action="${facebookFeedUrl}">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <p>Post to your Facebook wall:</p>
        <textarea id="message" name="message" rows="2" cols="60"></textarea>
        <br />
        <input type="submit" value="Post" />
    </form:form>


    <c:forEach items="${feed}" var="post">
        <p>
            MSG: ${post.message} <br /> NAME: ${post.name} <br />
        </p>
    </c:forEach>

        ${api}
        ${timeline}
        ${feed}

</template:basic>