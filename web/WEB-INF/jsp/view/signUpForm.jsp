<%--@elvariable id="loginFailed" type="java.lang.Boolean"--%>
<%--@elvariable id="loginForm" type="com.wrox.site.AuthenticationController.Form"--%>
<%--@elvariable id="validationErrors" type="java.util.Set<javax.validation.ConstraintViolation>"--%>
<spring:message code="title.signUp" var="signUpTitle" />
<template:loggedOut htmlTitle="${signUpTitle}"
	bodyTitle="${signUpTitle}">
	<spring:message code="message.signUp.instruction" />
	<br />
		<c:url var="registerUrl" value="/user/register" />
		<form:form method="post" modelAttribute="signUpForm" action="${registerUrl} }">
		
		<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		
		<form:label path="username">
				<spring:message code="field.signUp.username" />
			</form:label>
			<br />
			<form:input path="username"/>
			<br />
			<form:label path="firstName">
				<spring:message code="field.signUp.firstName" />
			</form:label>
			<br />
			<form:input path="firstName"/>
			<br />
			<form:label path="lastName">
				<spring:message code="field.signUp.lastName" />
			</form:label>
			<br />
			<form:input path="lastName"/>
			<br />
			<form:label path="password">
				<spring:message code="field.signUp.password" />
			</form:label>
			<br />
			<form:password path="password"/>
			<form:label path="passwordVerification">
				<spring:message code="field.signUp.passwordVerification" />
			</form:label>
			<br />
			<form:password path="passwordVerification"/>
			<br />
			<input type="submit"
				value="<spring:message code="field.signUp.submit" />" />
		</form:form>
		
</template:loggedOut>
