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
    <form:form action="${signUpUrl}" method="POST" modelAttribute="signUpForm">
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
        <h3 class="black_bg">
            <img src="<c:url value="/resource/img/logo.png" />" alt="">
            <br>Sign Up</h3>
        <p>
            <form:label path="firstName" class="uname" for="firstname" cssStyle="margin-bottom:0px;">
                <i class="livicon" data-name="info" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
                ${firstname}
            </form:label>
            <form:input path="firstName" type="text" id="firstname" placeholder="Enter your firstname"/>
        </p>
        <p>
            <form:label path="lastName" for="firstname" cssStyle="margin-bottom:0px;">
                <i class="livicon" data-name="info" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
                ${lastname}
            </form:label>
            <form:input path="lastName" type="text"  id="lastname" placeholder="Enter your lastname"/>
        </p>
        <p>
            <form:label path="username" for="userName" cssStyle="margin-bottom:0px;">
                <i class="livicon" data-name="user" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
                ${username}
            </form:label>
            <form:input path="username" type="text" id="usernamesignup"/>
        </p>
        <p>
            <form:label path="email" for="email" cssStyle="margin-bottom:0px;">
                <i class="livicon" data-name="mail" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
                ${username}
            </form:label>
            <form:input path="email" type="text" id="email" placeholder="example@gmail.com" />
        </p>
        <p>
            <form:label path="password" class="youpasswd" for="password1" cssStyle="margin-bottom:0px;">
                <i class="livicon" data-name="key" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
                ${password} 
            </form:label>
            <form:input id="passwordsignup" path="password" type="password" placeholder="eg. X8df!90EO"/>
        </p>
        <p>
            <form:label path="passwordVerification" class="control-label" for="password2" cssStyle="margin-bottom:0px;">
                <i class="livicon" data-name="key" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
                ${passwordVerify}
            </form:label>
            <form:input id="passwordsignup_confirm" path="passwordVerification" type="password" placeholder="eg. X8df!90EO" />
        </p>
        <p class="signin button">
            <input type="submit" class="btn btn-success" value="${submit}" />
        </p>
        <p class="change_link">
            <a href="${loginUrl}" class="to_register">
                <button type="button" class="btn btn-responsive botton-alignment btn-warning btn-sm">Back</button>
            </a>
        </p>
    </form:form>
</template:loggedOut>


