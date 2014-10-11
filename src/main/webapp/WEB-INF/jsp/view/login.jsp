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
        <!-- Container Fluid starts -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-push-4 col-md-4 col-sm-push-3 col-sm-6 col-sx-12">
                    <div class="login-container">
                        <div class="login-wrapper animated flipInY">
                            <div id="login" class="show">
                                <div class="login-header">
                                    <h4>Sign In To Your Account</h4>
                                </div>
                            <form:form method="POST" modelAttribute="loginForm">
                                <div class="form-group has-feedback">
                                    <form:label cssClass="control-label" for="userName" path="username"> ${usernameLabel}</form:label>
                                    <form:input path="username" type="text" id="userName"
                                                class="form-control" placeholder="Username"
                                                required="required"></form:input>
                                        <i class="fa fa-user text-info form-control-feedback"></i>
                                    </div>
                                    <div class="form-group has-feedback">
                                    <form:label cssClass="control-label" for="passWord" path="password">${passwordLabel}</form:label>
                                    <form:input path="password" type="password" id="passWord"
                                                class="form-control" placeholder="**********"
                                                required="required"></form:input>
                                        <i class="fa fa-key text-danger form-control-feedback"></i>
                                    </div>
                                    <input type="submit" value="${forumSubmit}" class="btn btn-danger btn-lg btn-block">
                            </form:form>
                            <form:form method="POST" action="${instagramSignInUrl}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"></input>
                                <button type="submit"> instagram sign in </button>
                            </form:form>
                                <form:form method="POST" action="${twitterSignInUrl}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"></input>
                                <button type="submit"> Twitter sign in </button>
                            </form:form>
                                <form:form method="POST" action="${facebookSignInUrl}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"></input>
                                <button type="submit"> Facebook sign in </button>
                            </form:form>
                        </div>
                        <div id="forgot-pwd" class="form-action hide">
                            <div class="login-header">
                                <h4>Reset your Password</h4>
                            </div>
                            <form action="index.html">
                                <div class="form-group has-feedback">
                                    <label class="control-label" for="password3">Password</label>
                                    <input type="text" class="form-control" id="password3">
                                    <i class="fa fa-key form-control-feedback"></i>
                                </div>
                                <div class="form-group has-feedback">
                                    <label class="control-label" for="password4">Confirm password</label>
                                    <input type="text" class="form-control" id="password4">
                                    <i class="fa fa-key form-control-feedback"></i>
                                </div>
                                <input type="submit" value="Reset" class="btn btn-danger btn-lg btn-block">
                            </form>
                            <a href="#register">Don't have an account? <span class="text-danger">Sign Up</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Container Fluid ends -->
</template:loggedOut>
