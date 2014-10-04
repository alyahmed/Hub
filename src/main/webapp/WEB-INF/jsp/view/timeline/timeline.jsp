
<spring:message code="title.hub.timeline" var="timelineTitle" />
<template:basic htmlTitle="${timelineTitle}"
                bodyTitle="${timelineTitle}">

    <c:choose>
        <c:when test="${connectionsEmpty}">
            No Connections
        </c:when>
        <c:otherwise>
            <div class="timeline animated">
                <c:forEach items="${nodes}" var="node">
                    <div class="timeline-row active">
                        <div class="timeline-time">
                            <small>${node.dateCreated}</small>
                        </div>
                        <div class="timeline-icon">
                            <div class="tw-profile">
                                <i class="fa fa-${node.providerId}"></i>
                            </div>
                        </div>
                        <div class="panel timeline-content">
                            <div class="panel-body">
                                <h2 class="text-info">${node.title}</h2>
                                <p>
                                    ${node.content}
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</template:basic>
