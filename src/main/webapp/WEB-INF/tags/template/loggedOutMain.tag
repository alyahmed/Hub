<%--@elvariable id="_csrf" type="org.springframework.security.web.csrf.CsrfToken"--%>
<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ attribute name="htmlTitle" type="java.lang.String"
              rtexprvalue="true" required="true"%>
<%@ attribute name="bodyTitle" type="java.lang.String"
              rtexprvalue="true" required="true"%>
<%@ include file="/WEB-INF/jsp/base.jspf"%>
<!DOCTYPE html>
<html>
    <head>
        <title><spring:message code="title.application" /> <c:out
                value="${fn:trim(htmlTitle)}" /></title>
        <!-- Bootstrap core CSS -->
        <link href="<c:url value="/resource/css/bootstrap.min.css" /> "
              rel="stylesheet">
        <!-- Login page Specific CSS -->
        <!-- Main CSS -->
        <link href="<c:url value="/resource/css/pages/login.css" />"
              rel="stylesheet">
        <!-- Animate CSS -->
        <link href="<c:url value="/resource/css/pages/animate-custom.css" /> "
              rel="stylesheet">

        <!-- CSRF TOKEN DO NOT TOUCH -->
        <script type="text/javascript" lang="javascript">
            var postInvisibleForm = function (url, fields) {
                var form = $('<form id="mapForm" method="post"></form>').attr({
                    action: url,
                    style: 'display: none;'
                });
                for (var key in fields) {
                    if (fields.hasOwnProperty(key))
                        form.append($('<input type="hidden">').attr({
                            name: key,
                            value: fields[key]
                        }));
                }
                form.append($('<input type="hidden">').attr({
                    name: '${_csrf.parameterName}        ',
                    value: '${_csrf.token}'
                }));
                $('body').append(form);
                form.submit();
            };
        </script>

    </head>
    <body>
        <jsp:doBody />
    </body>
    <!--End Container-->

    <!-- Login Page Specific Javascript -->
    <script src="<c:url value="/resource/js/jquery-1.11.1.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resource/js/bootstrap.min.js" />" type="text/javascript"></script>


    <!--livicons-->
    <script src="<c:url value="/resource/vendors/livicons/minified/raphael-min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resource/vendors/livicons/minified/livicons-1.3.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resource/js/josh.js" />" type="text/javascript" ></script>
    <script src="<c:url value="/resource/js/metisMenu.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resource/vendors/holder-master/holder.js" />" type="text/javascript" ></script>
    <!-- end of global js -->
</html>
