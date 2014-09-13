<spring:message code="title.social.status" var="socialStatus" />
<spring:message code="title.social.status.notConnected" var="notConnectedStatus" />
<template:basic htmlTitle="${socialStatus}" bodyTitle="${socialStatus}">
    <div id="content">
        <h1> ${socialStatus} </h1>
        <div class="accountConnection">
            <!-- Check if User is connected to any Service Provider first-->
            <c:forEach items="${providerIds}" var="providerId">
                <p>
                    <span> Connect to <a
                            href="<c:url value="/connect/${providerId}" />">
                            ${providerId}</a>

                    </span>
                </p>
            </c:forEach>
        </div>
    </div>
</template:basic>