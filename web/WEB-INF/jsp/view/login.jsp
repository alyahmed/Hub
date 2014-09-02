<%--@elvariable id="loginFailed" type="java.lang.Boolean"--%>
<%--@elvariable id="loginForm" type="com.wrox.site.AuthenticationController.Form"--%>
<%--@elvariable id="validationErrors" type="java.util.Set<javax.validation.ConstraintViolation>"--%>
<spring:message code="title.login" var="loginTitle" />
<template:loggedOut htmlTitle="${loginTitle}" bodyTitle="${loginTitle}">


    <div id="page-login" class="row">
        <c:if test="${param.containsKey('loginFailed')}">
            <b class="errors"><spring:message code="error.login.failed" /></b><br />
        </c:if><c:if test="${param.containsKey('loggedOut')}">
        <i><spring:message code="message.login.loggedOut" /></i><br /><br />
         </c:if>
        <div class="col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
            <div class="text-right">
                <a href="<c:url value="/user/register" />" class="txt-default"> <spring:message code="field.signUp.submit" /> </a>
            </div>
            <div class="box">
                <div class="box-content">
                    <div class="text-center">
                        <h3 class="page-header"> <spring:message code="message.login.instruction" /> </h3>
                    </div>
                    <form:form method="POST" modelAttribute="loginForm" autocomplete="off">
                        <div class="form-group">
                            <form:label path="username" cssClass="control-label"><spring:message code="field.login.username" /></form:label>
                            <form:input path="username" cssClass="form-control" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <form:label path="password" cssClass="control-label"><spring:message code="field.login.password" /></form:label>
                            <form:password path="password" cssClass="form-control" autocomplete="off" />
                        </div>
                        <div class="text-center">
                            <input type="submit" class="btn btn-primary" value="<spring:message code="field.login.submit" />" />
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>





</template:loggedOut>
