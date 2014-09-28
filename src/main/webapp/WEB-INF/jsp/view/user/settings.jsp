<%--@elvariable id="profiles" type="org.springframework.social.twitter.api.Twitter.friendOperations()"--%>
<spring:message code="title.user.settings" var="userSettings" />
<template:basic htmlTitle="${userSettings}"
                bodyTitle="${userSettings}">

        <security:authentication var="userName" property="principal.username" /> 
        <security:authentication var="firstName" property="principal.firstName" />  
        <security:authentication var="lastName" property="principal.lastName" />
</div>
</template:basic>
