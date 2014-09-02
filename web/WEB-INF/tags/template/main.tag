<%--@elvariable id="_csrf" type="org.springframework.security.web.csrf.CsrfToken"--%>
<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ attribute name="htmlTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ attribute name="bodyTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ attribute name="headContent" fragment="true" required="false" %>
<%@ attribute name="navigationContent" fragment="true" required="true" %>
<%@ include file="/WEB-INF/jsp/base.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <title><spring:message code="title.customer.support" />
            <c:out value="${fn:trim(htmlTitle)}" /></title>
        <link href="<c:url value="/resource/plugins/bootstrap/bootstrap.css" /> " rel="stylesheet">
        <link href="<c:url value="/resource/plugins/jquery-ui/jquery-ui.min.css" /> " rel="stylesheet">


        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>


        <link href="<c:url value="/resource/plugins/fancybox/jquery.fancybox.css" />" rel="stylesheet">
        <link href="<c:url value="/resource/plugins/fullcalendar/fullcalendar.css" />" rel="stylesheet">
        <link href="<c:url value="/resource/plugins/xcharts/xcharts.min.css" />" rel="stylesheet">
        <link href="<c:url value="/resource/plugins/select2/select2.css" />" rel="stylesheet">
        <link href="<c:url value="/resource/css/style.css" />" rel="stylesheet">

        <script type="text/javascript" lang="javascript">
            var postInvisibleForm = function(url, fields) {
                var form = $('<form id="mapForm" method="post"></form>')
                        .attr({ action: url, style: 'display: none;' });
                for(var key in fields) {
                    if(fields.hasOwnProperty(key))
                        form.append($('<input type="hidden">').attr({
                            name: key, value: fields[key]
                        }));
                }
                form.append($('<input type="hidden">').attr({
                    name: '${_csrf.parameterName}', value: '${_csrf.token}'
                }));
                $('body').append(form);
                form.submit();
            };
        </script>
        <jsp:invoke fragment="headContent" />
    </head>
    <body>
        <h1><spring:message code="title.company" /></h1>
        <!-- HEADER -->

        <div id="main" class="container-fluid">
                <jsp:doBody />
        </div>
    </body>
    <!--End Container-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!--<script src="http://code.jquery.com/jquery.js"></script>-->
    <script src="<c:url value="/resource/plugins/jquery/jquery-2.1.0.min.js" />"></script>
    <script src="<c:url value="/resource/plugins/jquery-ui/jquery-ui.min.js" />"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resource/plugins/bootstrap/bootstrap.min.js" />"></script>


    <script src="<c:url value="/resource/plugins/justified-gallery/jquery.justifiedgallery.min.js" />"></script>
    <script src="<c:url value="/resource/plugins/tinymce/tinymce.min.js" />"></script>
    <script src="<c:url value="/resource/plugins/tinymce/jquery.tinymce.min.js" />"></script>

    <!-- All functions for this theme + document.ready processing -->

</html>
