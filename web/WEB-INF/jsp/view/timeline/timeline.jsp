<spring:message code="title.social.timeline" var="timelineTitle" />
<template:basic htmlTitle="${timelineTitle}"
                bodyTitle="${timelineTitle}">
    <c:url value="/connect" var="connectUrl" />
    <c:choose>
        <c:when test="${connectionsEmpty}">
            <div class="alert alert-danger no-margin">
                <strong> No Active Connections </strong>
            </div>
            <a href="${connectUrl}" class="btn btn-link"> Connect </a>
        </c:when>
        <c:otherwise>
            <div class="timeline animated no-padding">
                <div class="timeline-row active">
                    <div class="timeline-time">
                        7:51 PM<small>Aug 28</small>
                    </div>
                    <div class="timeline-icon">
                        <div class="danger-bg">
                            <i class="fa fa-pencil"></i>
                        </div>
                    </div>
                    <div class="panel timeline-content">
                        <div class="panel-body">
                            <h2>
                                Heading
                            </h2>
                            <p>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="timeline-row active">
                    <div class="timeline-time">
                        6:32 PM<small>Aug 21</small>
                    </div>
                    <div class="timeline-icon">
                        <div class="warning-bg">
                            <i class="fa fa-quote-right"></i>
                        </div>
                    </div>
                    <div class="panel timeline-content">
                        <div class="panel-body">
                            <p>
                                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="timeline-row active">
                    <div class="timeline-time">
                        6:00 AM<small>Aug 15</small>
                    </div>
                    <div class="timeline-icon">
                        <div class="success-bg">
                            <i class="fa fa-image"></i>
                        </div>
                    </div>
                    <div class="panel timeline-content">
                        <div class="panel-body">
                            <h2>Timeline Title</h2>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                                    <img class="img-responsive" src="img/user3.jpg" alt="User">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                                    <img class="img-responsive" src="img/user7.jpg" alt="User">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                                    <img class="img-responsive" src="img/user8.jpg" alt="User">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                                    <img class="img-responsive" src="img/user9.jpg" alt="User">
                                </div>
                            </div>
                            <p>
                                It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="timeline-row active">
                    <div class="timeline-time">
                        5:23 PM<small>Aug 12</small>
                    </div>
                    <div class="timeline-icon">
                        <div class="brown-bg">
                            <i class="fa fa-pencil"></i>
                        </div>
                    </div>
                    <div class="panel timeline-content">
                        <div class="panel-body">
                            <h2>
                                Timeline post
                            </h2>
                            <p>
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="timeline-row active">
                    <div class="timeline-time">
                        6:14 PM<small>Aug 9</small>
                    </div>
                    <div class="timeline-icon">
                        <div class="fb-bg">
                            <i class="fa fa-facebook"></i>
                        </div>
                    </div>
                    <div class="panel timeline-content">
                        <div class="panel-body">
                            <h2>Timeline Post</h2>
                            <p>
                                Lorem ipsum velit ullamco anim pariatur proident eu deserunt laborum. Lorem ipsum ad in nostrud adipisicing cupidatat anim officia ad id cupidatat veniam quis elit ullamco.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="timeline-row active">
                    <div class="timeline-time">
                        12:00 AM<small>Aug 6</small>
                    </div>
                    <div class="timeline-icon">
                        <div class="linkedin-bg">
                            <i class="fa fa-image"></i>
                        </div>
                    </div>
                    <div class="panel timeline-content">
                        <div class="panel-body">
                            <img class="img-responsive" src="img/user7.jpg" alt="User">
                            <p>
                                Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </c:otherwise>    
    </c:choose>


</template:basic>