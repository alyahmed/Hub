
<spring:message code="title.hub.timeline" var="timelineTitle" />
<template:basic htmlTitle="${timelineTitle}"
                bodyTitle="${timelineTitle}">

    <div class="timeline animated">
        <div class="timeline-row active">
            <div class="timeline-time">
                <small>${node.time}</small>
            </div>
            <div class="timeline-icon">
                <div class="tw-profile">
                    <i class="fa fa-twitter"></i>
                </div>
            </div>
            <div class="panel timeline-content">
                <div class="panel-body">
                    <h2 class="text-info">${node.providerId}</h2>
                    <p>
                        ${node.content}
                    </p>
                </div>
            </div>
        </div>
        <c:forEach items="${nodes}" var="node"></c:forEach>
        </div>

</template:basic>
