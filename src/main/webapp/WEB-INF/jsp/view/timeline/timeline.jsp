<spring:message code="title.hub.timeline" var="timelineTitle" />
<template:basic htmlTitle="${timelineTitle}"
                bodyTitle="${timelineTitle}">

    <c:choose>
        <c:when test="${connectionsEmpty}">
            No Connections
        </c:when>
        <c:otherwise>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        </div>
                        <div class="panel-body">
                            <!--timeline-->
                            <div class="row">
                                <ul class="timeline">
                                    <c:forEach items="${nodes}" var="node">
                                        <li>
                                            <div class="timeline-badge info">
                                                <i class="livicon" data-name="${node.providerId}" data-c="#fff" data-hc="#fff" data-size="40" data-loop="true"></i>
                                            </div>
                                            <div class="timeline-panel" style="display:inline-block;">
                                                <div class="timeline-heading">
                                                    <h4 class="timeline-title">${node.title}</h4>
                                                    <p>
                                                        <small class="text-muted">
                                                            <i class="livicon" data-name="bell" data-c="#f89a14" data-hc="#f89a14" data-size="18" data-loop="true"></i>
                                                            ${node.dateCreated} ago via Twitter
                                                        </small>
                                                    </p>
                                                </div>
                                                <div class="timeline-body">
                                                    <p>
                                                        ${node.content}
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</template:basic>
