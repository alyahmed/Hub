<spring:message code="title.linkedin.profile" var="linkedinProfile" />
<template:basic htmlTitle="${linkedinProfile}"
                bodyTitle="${linkedinProfile}">
    <c:url var="linkedinDisconnect" value="/disconnect/linkedin" />

    <div class="col-md-12 col-sm-12 col-sx-12">
        <div class="current-profile">
            <div class="user-bg"></div>
            <div class="user-pic">&nbsp;</div>
            <div class="user-details">
                <h4 class="user-name"> ${profile.firstName} <i>!</i></h4>
                <h5 class="description">${profile.headline}</h5>
            </div>
            <div class="social-list">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="row">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form id="disconnect" action="${linkedinDisconnect}" method="POST">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit">Disconnect from LinkedIn</button>	
        <input type="hidden" name="_method" value="delete" />
    </form>

    <div class="panel-group no-margin" id="accordion">
        <div class="panel">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="text-danger" data-original-title="" title="">
                        Skills
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in" style="height: auto;">
                <div class="panel-body">
                    ${skills}
                </div>
            </div>
        </div>
    </div>

    <div class="blog blog-success">
        <div class="blog-header">
            <h5 class="blog-title">${profile.numConnections} Connections </h5>
        </div>
        <div class="blog-body">
            <ul class="clients-list">
                <c:forEach items="${connections}" var="connection">
                    <li class="client clearfix">
                        <img src="${connection.profilePictureUrl}" class="avatar" alt="Client">
                        <div class="client-details">
                            <p>
                                <span class="name">${connection.firstName} ${connection.lastName}</span>
                                <span class="email"> ${connection.industry}</span>

                            </p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>


</template:basic>
