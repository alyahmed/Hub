<%--@elvariable id="loginFailed" type="java.lang.Boolean"--%>
<%--@elvariable id="loginForm" type="ca.ahmedaly.site.AuthenticationController.Form"--%>
<%--@elvariable id="validationErrors" type="java.util.Set<javax.validation.ConstraintViolation>"--%>
<spring:message code="title.login" var="loginTitle" />
<template:loggedOut htmlTitle="${loginTitle}" bodyTitle="${loginTitle}">

    <spring:message code="title.login" var="loginTitle"/>
    <spring:message code="title.login.subheader" var="loginSubheader" />
    <spring:message code="field.login.username" var="usernameLabel" />
    <spring:message code="field.login.password" var="passwordLabel" />
    <spring:message code="field.login.submit" var="forumSubmit" />
    <spring:message code="error.login.failed" var="loginFailedMsg" />
    <spring:message code="message.login.loggedOut" var="loggedOutMsg" />
    <spring:message code="message.signUp.instruction"  var="signUpInstruction"/>
    <spring:message code="field.signUp.username" var="username"/>
    <spring:message code="field.signUp.firstName" var="firstname" />
    <spring:message code="field.signUp.lastName" var="lastname"/>
    <spring:message code="field.signUp.password" var="password"/>
    <spring:message code="field.signUp.passwordVerification" var="passwordVerify" />
    <spring:message code="field.signUp.submit" var="submit" />



    <c:url value="/signup" var="signUpUrl"></c:url>
    <c:url value="/signin/instagram" var="instagramSignInUrl"></c:url>
    <c:url value="/signin/twitter" var="twitterSignInUrl"></c:url>
    <c:url value="/signin/facebook" var="facebookSignInUrl"></c:url>
    <form:form method="POST" modelAttribute="loginForm" autocomplete="OFF">
        <h3 class="black_bg">
            <img src="<c:url value="/resource/img/logo.png" />" alt="">
        </h3>
        <p>
            <form:label path="username" style="margin-bottom:0px;" for="username" class="uname"> <i class="livicon" data-name="user" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
                ${usernameLabel}
            </form:label>
            <form:input path="username" id="username" name="username" type="text" placeholder="username" required="required"></form:input>
            </p>
            <p>
            <form:label cssClass="youpasswd" for="password" path="password">
                <i class="livicon" data-name="key" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
                ${passwordLabel}
            </form:label>
            <form:input path="password" type="password" id="password"
                        placeholder="**********"
                        required="required"></form:input>
            </p>
            <p class="keeplogin">
                <input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" />
                <label for="loginkeeping">Keep me logged in</label>
            </p>
            <p class="login button">
                <input type="submit" value="${forumSubmit}" class="btn btn-success" />
        </p>
        <p class="change_link">
            <a href="#toforgot">
                <button type="button" class="btn btn-responsive botton-alignment btn-warning btn-sm">Forgot password</button>
            </a>
            <a href="#toregister">
                <button type="button" class="btn btn-responsive botton-alignment btn-success btn-sm" style="float:right;">Sign up</button>
            </a>
        </p>
    </form:form>
</template:loggedOut>

