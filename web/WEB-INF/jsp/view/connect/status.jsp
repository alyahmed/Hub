<spring:message code="title.social.status" var="socialStatus" />
<template:basic htmlTitle="${socialStatus}" bodyTitle="${socialStatus}">

	
	
		
		<div id="content">
			<h3> ${socialStatus} </h3>
			<div class="accountConnection" th:each="providerId : ${providerIds}">
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