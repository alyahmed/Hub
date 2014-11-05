<spring:message code="title.social.status" var="socialStatus" />
<spring:message code="title.social.status.notConnected" var="notConnectedStatus" />
<template:basic htmlTitle="${socialStatus}" bodyTitle="${socialStatus}">
    <c:url var="twitterProfileUrl" value="/twitter" /> <!-- Check out Twitter Profile -->
    <c:url var="facebookProfileUrl" value="/facebook" /> <!-- Check out Facebook Profile -->
    <c:url var="linkedinProfileUrl" value="/linkedin" /> <!-- Check out Twitter Profile -->
    <c:url var="googleProfileUrl" value="/google" />  <!-- Check out Google Profile -->
    <c:url var="instagramProfileUrl" value="/instagram" /> <!-- Check out Instagram Profile -->
    <c:url var="profilePictureUrl" value="/resource/img/user4.jpg" /> 
    <c:url var="tumblrProfileUrl" value="/tumblr" />
    <c:url var="redditProfileUrl" value="/reddit" />

    <c:url var="twitterConnectUrl" value="/connect/twitter"  />
    <c:url var="linkedinConnectUrl" value="/connect/linkedin"  />
    <c:url var="facebookConnectUrl" value="/connect/facebook" />
    <c:url var="instagramConnectUrl" value="/connect/instagram" /> 
    <c:url var="googleConnectUrl" value="/connect/google" /> <!-- Check out Google Profile-->
    <c:url var="tumblrConnectUrl" value="/connect/tumblr" /> 
    <c:url var="redditConnectUrl" value="/connect/reddit" />

    <div class="row">
        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
            <div class="twitterbg no-radius">
                <div class="panel-body squarebox square_boxs">
                    <i class="livicon  pull-right" data-name="twitter" data-l="true" data-c="#fff" data-hc="#fff" data-s="70"></i>
                    <small class="text-white">Twitter</small>
                    <c:choose>
                        <c:when test="${!empty connectionMap['twitter']}">
                            <a href="${twitterProfileUrl}" class="btn btn-xs btn-success"> View Profile </a>
                        </c:when>
                        <c:otherwise>
                            <form:form action="${twitterConnectUrl}" method="POST">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-xs btn-danger">Connect</button>
                            </form:form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
            <div class="lightbluebg no-radius">
                <div class="panel-body squarebox square_boxs">
                    <i class="livicon  pull-right" data-name="facebook" data-l="true" data-c="#fff" data-hc="#fff" data-s="70"></i>
                    <small class="text-white">Facebook</small>
                    <c:choose>
                        <c:when test="${!empty connectionMap['facebook']}">
                            <a href="${facebookProfileUrl}" class="btn btn-xs btn-success"> View Profile </a>
                        </c:when>
                        <c:otherwise>
                            <form:form action="${facebookConnectUrl}" method="POST">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-xs btn-danger">Connect</button>
                            </form:form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
            <div class="redbg no-radius">
                <div class="panel-body squarebox square_boxs">
                    <i class="livicon  pull-right" data-name="google-plus" data-l="true" data-c="#fff" data-hc="#fff" data-s="70"></i>
                    <small class="text-white">Google</small>
                    <c:choose>
                        <c:when test="${!empty connectionMap['google']}">
                            <a href="${googleProfileUrl}" class="btn btn-xs btn-success"> View Profile </a>
                        </c:when>
                        <c:otherwise>
                            <form:form action="${googleConnectUrl}" method="POST">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-xs btn-danger">Connect</button>
                            </form:form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
            <div class="instagrambg no-radius">
                <div class="panel-body squarebox square_boxs">
                    <i class="livicon  pull-right" data-name="instagram" data-l="true" data-c="#fff" data-hc="#fff" data-s="70"></i>
                    <small class="text-white">Instagram</small>
                    <c:choose>
                        <c:when test="${!empty connectionMap['instagram']}">
                            <a href="${instagramProfileUrl}" class="btn btn-xs btn-success"> View Profile </a>
                        </c:when>
                        <c:otherwise>
                            <form:form action="${instagramConnectUrl}" method="POST">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-xs btn-danger">Connect</button>
                            </form:form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
            <div class="tumblrbg no-radius">
                <div class="panel-body squarebox square_boxs">
                    <i class="livicon  pull-right" data-name="tumblr" data-l="true" data-c="#fff" data-hc="#fff" data-s="70"></i>
                    <small class="text-white">Tumblr</small>
                    <c:choose>
                        <c:when test="${!empty connectionMap['tumblr']}">
                            <a href="${tumblrProfileUrl}" class="btn btn-xs btn-success"> View Profile </a>
                        </c:when>
                        <c:otherwise>
                            <form:form action="${tumblrConnectUrl}" method="POST">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-xs btn-danger">Connect</button>
                            </form:form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
            <div class="goldbg no-radius">
                <div class="panel-body squarebox square_boxs">
                    <i class="livicon  pull-right" data-name="reddit" data-l="true" data-c="#fff" data-hc="#fff" data-s="70"></i>
                    <small class="text-white">Reddit</small>
                    <c:choose>
                        <c:when test="${!empty connectionMap['reddit']}">
                            <a href="${redditProfileUrl}" class="btn btn-xs btn-success"> View Profile </a>
                        </c:when>
                        <c:otherwise>
                            <form:form action="${redditConnectUrl}" method="POST">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-xs btn-danger">Connect</button>
                            </form:form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

</template:basic>