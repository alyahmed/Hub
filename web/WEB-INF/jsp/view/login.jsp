<%--@elvariable id="loginFailed" type="java.lang.Boolean"--%>
<%--@elvariable id="loginForm" type="com.wrox.site.AuthenticationController.Form"--%>
<%--@elvariable id="validationErrors" type="java.util.Set<javax.validation.ConstraintViolation>"--%>
<spring:message code="title.login" var="loginTitle" />
<template:loggedOut htmlTitle="${loginTitle}" bodyTitle="${loginTitle}">
    <div id="authenty_preview">
        <section id="signin_main" class="authenty signin-main">
            <div class="section-content">
                <div class="wrap">
                    <div class="container">
                        <div class="form-wrap">
                            <div class="row">
                                <div class="title" data-animation="fadeInDown"
                                     data-animation-delay=".8s">
                                    <h1>
                                        <spring:message code="title.login" />
                                    </h1>
                                    <h5>
                                        <spring:message code="title.login.subheader" />
                                    </h5>
                                </div>
                                <div id="form_1" data-animation="bounceIn">
                                    <div class="form-header">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <div class="form-main">
                                        <form:form method="POST" modelAttribute="loginForm"
                                                   autocomplete="off">
                                            <div class="form-group">
                                                <form:label path="username" cssClass="control-label">
                                                    <spring:message code="field.login.username" />
                                                </form:label>
                                                <form:input path="username" type="text" id="un_1"
                                                            class="form-control" placeholder="Username"
                                                            required="required"></form:input>
                                                <form:label path="password" cssClass="control-label">
                                                    <spring:message code="field.login.password" />
                                                </form:label>
                                                <form:input path="password" type="password" id="pw_1"
                                                            class="form-control" placeholder="password"
                                                            required="required"></form:input>
                                                </div>
                                                <input type="submit" class="btn btn-block signin" value="<spring:message code="field.login.submit" />" />
                                        </form:form>
                                    </div>
                                    <div class="form-footer">
                                        <div class="row">
                                            <div class="col-xs-7">
                                                <i class="fa fa-unlock-alt"></i> <a
                                                    href="#password_recovery" id="forgot_from_1">Forgot
                                                    password?</a>
                                            </div>
                                            <div class="col-xs-5">
                                                <i class="fa fa-check"></i> <a href="#signup_window"
                                                                               id="signup_from_1">Sign Up</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${param.containsKey('loginFailed')}">
                <b class="errors"><spring:message code="error.login.failed" /></b>
            </c:if>
            <c:if test="${param.containsKey('loggedOut')}">
                <i><spring:message code="message.login.loggedOut" /></i>
            </c:if>
        </section>

    </div>
</template:loggedOut>
