<spring:message code="title.facebook.connect" var="facebookConnect" />
<template:basic htmlTitle="${facebookConnect}"
                bodyTitle="${facebookConnect}">
    <c:url value="/connect/facebook" var="connectFacebookUrl" />
    <form:form action="${connectFacebookUrl}" method="POST">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="formInfo">
            <p>You haven't created any connections with Facebook yet. Click
                the button to connect Spring Social Showcase with your Facebook
                account. (You'll be redirected to Facebook where you'll be asked to
                authorize the connection.)</p>
        </div>

        <button type="submit">Connect to Facebook</button>
        <label for="postTweet"><input id="postTweet" type="checkbox"
                                      name="postTweet" /> Post a tweet about connecting with Spring
            Social Showcase</label>
        </form:form>




</template:basic>