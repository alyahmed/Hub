<spring:message code="title.social.status" var="socialStatus" />
<spring:message code="title.social.status.notConnected" var="notConnectedStatus" />
<template:basic htmlTitle="${socialStatus}" bodyTitle="${socialStatus}">
    <c:url var="twitterProfileUrl" value="/twitter" /> <!-- Check out Twitter Profile -->
    <c:url var="facebookProfileUrl" value="/facebook" /> <!-- Check out Facebook Profile -->
    <c:url var="linkedinProfileUrl" value="/linkedin" /> <!-- Check out Twitter Profile -->
    <c:url var="googleProfileUrl" value="/google" /> <!-- Check out Instagram Profile -->
    <c:url var="profilePictureUrl" value="/resource/img/user4.jpg" /> 
    <c:url var="twitterConnectUrl" value="/connect/twitter"  />
    <c:url var="linkedinConnectUrl" value="/connect/linkedin"  />
    <c:url var="facebookConnectUrl" value="/connect/facebook" />
    <c:url var="googleConnectUrl" value="/connect/google" /> <!-- Check out Instagram Profile-->

    <div class="current-stats">
        <div class="row">
            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                <div class="twitter-bg center-align-text">
                    <div class="spacer-xs">
                        <i class="fa fa-twitter fa-2x"></i>
                        <small class="text-white">Twitter</small>
                        <c:choose>
                            <c:when test="${!empty connectionMap['twitter']}">
                                <h6 class="no-margin no-padding text-white"> <a href="${twitterProfileUrl}" class="label label-success"> View Profile </a> </h6>
                            </c:when>
                            <c:otherwise>
                                <form:form action="${twitterConnectUrl}" method="POST">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button type="submit" class="btn-danger">Connect</button>
                                </form:form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                <div class="info-bg center-align-text">
                    <div class="spacer-xs">
                        <i class="fa fa-facebook fa-2x"></i>
                        <small class="text-white">Facebook</small>
                        <c:choose>
                            <c:when test="${!empty connectionMap['facebook']}">
                                <h6 class="no-margin no-padding text-white"> <a href="${facebookProfileUrl}" class="label label-success"> View Profile </a> </h6>
                            </c:when>
                            <c:otherwise>
                                <form:form action="${facebookConnectUrl}" method="POST">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button type="submit" class="btn-danger">Connect</button>
                                </form:form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                <div class="linkedin-bg center-align-text">
                    <div class="spacer-xs">
                        <i class="fa fa-linkedin fa-2x"></i>
                        <small class="text-white">LinkedIn</small>
                        <c:choose>
                            <c:when test="${!empty connectionMap['linkedin']}">
                                <h6 class="no-margin no-padding text-white"> <a href="${linkedinProfileUrl}" class="label label-success"> View Profile </a> </h6>
                            </c:when>
                            <c:otherwise>
                                <form:form action="${linkedinConnectUrl}" method="POST">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button type="submit" class="btn-danger">Connect</button>
                                </form:form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                <div class="linkedin-bg center-align-text">
                    <div class="spacer-xs">
                        <i class="fa fa-google-plus fa-2x"></i>
                        <small class="text-white">Google</small>
                        <c:choose>
                            <c:when test="${!empty connectionMap['google']}">
                                <h6 class="no-margin no-padding text-white"> <a href="${googleProfileUrl}" class="label label-success"> View Profile </a> </h6>
                            </c:when>
                            <c:otherwise>
                                <form:form action="${googleConnectUrl}" method="POST">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button type="submit" class="btn-danger">Connect</button>
                                </form:form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="spacer">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <!-- Widget starts -->
                <div class="blog blog-info">
                    <div class="blog-header">
                        <h5 class="blog-title">Chats</h5>
                    </div>
                    <div class="blog-body">
                        <ul class="chats">
                            <li class="in">
                                <img class="avatar" alt="" src="img/user2.jpg">
                                <div class="message">
                                    <span class="arrow"></span>
                                    <a href="#" class="name" data-original-title="" title="">Sandy</a>
                                    <span class="date-time">
                                        at May 21st, 2014 12:0<i class="fa fa-clock-o"></i>
                                    </span>
                                    <div class="progress-stats clearfix">
                                        <i class="fa fa-camera-retro pull-left fa-lg text-info"></i>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            </div>
                                        </div>
                                    </div>
                                    <span class="body body-grey">
                                        Raw denim heard of them master cleanse.
                                    </span>
                                </div>
                            </li>
                            <li class="out">
                                <img class="avatar" alt="" src="img/user3.jpg">
                                <div class="message">
                                    <span class="arrow"></span>
                                    <a href="#" class="name" data-original-title="" title="">Peter</a>
                                    <span class="date-time">
                                        at May 14th, 2014 09:32<i class="fa fa-clock-o"></i>
                                    </span>
                                    <span class="body body-blue">
                                        Next level veard stumptown, thundercats <i class="fa fa-smile-o fa-lg text-primary"></i>
                                    </span>
                                </div>
                            </li>
                            <li class="in">
                                <img class="avatar" alt="" src="img/user4.jpg">
                                <div class="message">
                                    <span class="arrow"></span>
                                    <a href="#" class="name" data-original-title="" title="">Johnson</a>
                                    <span class="date-time">
                                        at Apr 28th, 2014 09:47<i class="fa fa-clock-o"></i>
                                    </span>
                                    <span class="body body-grey">
                                        Beard stumptown scenester farm-to-table.
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Widget ends -->
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <!-- Widget starts -->
                <div class="blog blog-danger">
                    <div class="blog-header">
                        <h5 class="blog-title">Clients List</h5>
                    </div>
                    <div class="blog-body">
                        <ul class="clients-list">
                            <li class="client clearfix">
                                <img src="img/user4.jpg" class="avatar" alt="Client">
                                <div class="client-details">
                                    <p>
                                        <span class="name">Peter</span>
                                        <span class="email">mail.smith@mail.ro</span>
                                    </p>
                                    <ul class="icons-nav">
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Delete">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Email">
                                                <i class="fa fa-envelope-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Contact">
                                                <i class="fa fa-phone"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="client clearfix">
                                <img src="img/user1.jpg" class="avatar" alt="Client">
                                <div class="client-details">
                                    <p>
                                        <span class="name">Willims</span>
                                        <span class="email">id.will@mail.io</span>
                                    </p>
                                    <ul class="icons-nav">
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Delete">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Email">
                                                <i class="fa fa-envelope-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Contact">
                                                <i class="fa fa-phone"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="client clearfix">
                                <img src="img/user2.jpg" class="avatar" alt="Client">
                                <div class="client-details">
                                    <p>
                                        <span class="name">Henreque</span>
                                        <span class="email">henrq@mail.ro</span>
                                    </p>
                                    <ul class="icons-nav">
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Delete">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Email">
                                                <i class="fa fa-envelope-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Contact">
                                                <i class="fa fa-phone"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="client clearfix">
                                <img src="img/user3.jpg" class="avatar" alt="Client">
                                <div class="client-details">
                                    <p>
                                        <span class="name">Samson</span>
                                        <span class="email">sams@mail.com</span>
                                    </p>
                                    <ul class="icons-nav">
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Delete">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Email">
                                                <i class="fa fa-envelope-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Contact">
                                                <i class="fa fa-phone"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="client clearfix">
                                <img src="img/user4.jpg" class="avatar" alt="Client">
                                <div class="client-details">
                                    <p>
                                        <span class="name">Valli</span>
                                        <span class="email">mail.val@mail.us</span>
                                    </p>
                                    <ul class="icons-nav">
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Delete">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Email">
                                                <i class="fa fa-envelope-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Contact">
                                                <i class="fa fa-phone"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="client clearfix">
                                <img src="img/user5.jpg" class="avatar" alt="Client">
                                <div class="client-details">
                                    <p>
                                        <span class="name">Jene</span>
                                        <span class="email">jason@mail.com</span>
                                    </p>
                                    <ul class="icons-nav">
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Delete">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Email">
                                                <i class="fa fa-envelope-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-toggle="tooltip" data-placement="left" title="" data-original-title="Contact">
                                                <i class="fa fa-phone"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Widget ends -->
            </div>
        </div>
    </div>


</template:basic>