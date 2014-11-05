<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ attribute name="htmlTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ attribute name="bodyTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ include file="/WEB-INF/jsp/base.jspf" %>
<template:loggedOutMain htmlTitle="${htmlTitle}" bodyTitle="${bodyTitle}">
    <jsp:body>
        <div class="container">
            <div class="row vertical-offset-100">
                <div class="col-sm-6 col-sm-offset-3  col-md-5 col-md-offset-4 col-lg-4 col-lg-offset-4">
                    <div id="container_demo">
                        <a class="hiddenanchor" id="toregister"></a>
                        <a class="hiddenanchor" id="tologin"></a>
                        <a class="hiddenanchor" id="toforgot"></a>
                        <div id="wrapper">
                            <div id="login" class="animate form">
                                <jsp:doBody />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</template:loggedOutMain>
