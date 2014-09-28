<spring:message code="title.signUp" var="signUpTitle" />
<template:loggedOut htmlTitle="${signUpTitle}"
                    bodyTitle="${signUpTitle}">
    <spring:message code="message.signUp.instruction"  var="signUpInstruction"/>
    <spring:message code="field.signUp.username" var="username"/>
    <spring:message code="field.signUp.firstName" var="firstname" />
    <spring:message code="field.signUp.lastName" var="lastname"/>
    <spring:message code="field.signUp.password" var="password"/>
    <spring:message code="field.signUp.passwordVerification" var="passwordVerify" />
    <spring:message code="field.signUp.submit" var="submit" />
    <c:url value="/signup" var="signUpUrl"></c:url>
    <c:url value="/login" var="loginUrl"></c:url>
        <!-- Container Fluid starts -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-push-4 col-md-4 col-sm-push-3 col-sm-6 col-sx-12">
                    <div class="login-container">
                        <div class="login-wrapper animated flipInY">
                            <div id="register" class="form-action active">
                                <div class="login-header">
                                    <h4>Sign Up for Everest</h4>
                                </div>
                            <form:form action="${signUpUrl}" method="POST" modelAttribute="signUpForm">
                                <div class="form-group has-feedback">
                                    <form:label path="firstName" class="control-label" for="firstname">${firstname}</form:label>
                                    <form:input path="firstName" type="text" class="form-control" id="firstname" />
                                    <i class="fa fa-info-circle form-control-feedback"></i>
                                </div>
                                <div class="form-group has-feedback">
                                    <form:label path="lastName" class="control-label" for="firstname">${lastname}</form:label>
                                    <form:input path="lastName" type="text" class="form-control" id="firstname" />
                                    <i class="fa fa-info-circle form-control-feedback"></i>
                                </div>
                                <div class="form-group has-feedback">
                                    <form:label path="username" class="control-label" for="userName1">${username}</form:label>
                                    <form:input path="username" type="text" class="form-control" id="userName1"/>
                                    <i class="fa fa-user form-control-feedback"></i>
                                </div>
                                <div class="form-group has-feedback">
                                    <form:label path="password" class="control-label" for="password1">${password}</form:label>
                                    <form:input path="password" type="password" class="form-control" id="password1"/>
                                    <i class="fa fa-key form-control-feedback"></i>
                                </div>
                                <div class="form-group has-feedback">
                                    <form:label path="passwordVerification" class="control-label" for="password2">${passwordVerify}</form:label>
                                    <form:input path="passwordVerification" type="password" class="form-control" id="password2" />
                                    <i class="fa fa-key form-control-feedback"></i>
                                </div>
                                <input type="submit" value="${submit}" class="btn btn-danger btn-lg btn-block">
                            </form:form>
                            <a href="${loginUrl}">Already have an account? <span class="text-danger"> click here</span></a>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- Container Fluid ends -->
</template:loggedOut>


