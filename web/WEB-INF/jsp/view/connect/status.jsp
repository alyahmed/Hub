<spring:message code="title.social.status" var="socialStatus" />
<spring:message code="title.social.status.notConnected" var="notConnectedStatus" />
<template:basic htmlTitle="${socialStatus}" bodyTitle="${socialStatus}">
    
    <c:url var="twitterProfileUrl" value="/twitter" /> <!-- Check out Twitter Profile -->
    <c:url var="facebookProfileUrl" value="/facebook" /> <!-- Check out Facebook Profile -->
    <c:url var="linkedinProfileUrl" value="/linkedin" /> <!-- Check out Twitter Profile -->
    <c:url var="instagramProfileUrl" value="#" /> <!-- Check out Instagram Profile -->
    <c:url var="redditProfileUrl" value="#" /> <!-- Check out Reddit profile -->
    <c:url var="googleProfileUrl" value="/google" />
    <c:url var="twitterConnectUrl" value="/connect/twitter"  />
    <c:url var="facebookConnectUrl" value="/connect/facebook" />
    <c:url var="linkedinConnectUrl" value="/connect/linkedin" />
    <c:url var="googleConnectUrl" value="/connect/google" />
    <c:url var="instagramConnectUrl" value="#" /> <!-- Check out Instagram Profile-->
    <c:url var="redditConnectUrl" value="#" /> <!-- Check out reddit Profile -->
    <c:url var="profilePictureUrl" value="/resource/img/user4.jpg" /> 
    <div class="current-stats">
        <div class="row">
            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                <div class="info-bg center-align-text">
                    <div class="spacer-xs">
                        <i class="fa fa-instagram fa-2x"></i>
                        <small class="text-white"> Instagram </small>
                        <c:choose>
                            <c:when test="${!empty connectionMap['instagram']}">
                                <h6 class="no-margin no-padding text-white"> <a ${instagramPorfileUrl} class="label label-success"> View Profile </a> </h6>
                            </c:when>
                            <c:otherwise>
                                <h6 class="no-margin no-padding text-white"><a href="${instagramConnectUrl}" class="label label-danger"> Connect </a></h6>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
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
                                <h6 class="no-margin no-padding text-white"><a href="${twitterConnectUrl}" class="label label-danger"> Connect </a></h6>
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
                                <h6 class="no-margin no-padding text-white"><a href="${facebookConnectUrl}" class="label label-danger"> Connect </a></h6>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                <div class="bg-danger center-align-text">
                    <div class="spacer-xs">
                        <i class="fa fa-google-plus fa-2x"></i>
                        <small class="text-white">Google Plus</small>
                        <c:choose>
                            <c:when test="${!empty connectionMap['google']}">
                                <h6 class="no-margin no-padding text-white"> <a href="${googleProfileUrl}" class="label label-success"> View Profile </a> </h6>
                            </c:when>
                            <c:otherwise>
                                <h6 class="no-margin no-padding text-white"><a href="${googleConnectUrl}" class="label label-danger"> Connect </a></h6>
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
                                <h6 class="no-margin no-padding text-white"><a href="${linkedinConnectUrl}" class="label label-danger"> Connect </a></h6>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                <div class="brown-bg center-align-text">
                    <div class="spacer-xs">
                        <i class="fa fa-reddit fa-2x"></i>
                        <small class="text-white"> Reddit </small>
                        <c:choose>
                            <c:when test="${!empty connectionMap['reddit']}">
                                <h6 class="no-margin no-padding text-white"> <a href="${redditProfileUrl}" class="label label-success"> View Profile </a> </h6>
                            </c:when>
                            <c:otherwise>
                                <h6 class="no-margin no-padding text-white"><a href="${redditConnectUrl}" class="label label-danger"> Connect </a></h6>
                            </c:otherwise>
                        </c:choose>   
                    </div>
                </div>
            </div>
        </div>
    </div>

</template:basic>