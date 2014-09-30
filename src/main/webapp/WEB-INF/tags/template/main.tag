<%--@elvariable id="_csrf" type="org.springframework.security.web.csrf.CsrfToken"--%>
<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ attribute name="htmlTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ attribute name="bodyTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ attribute name="header" fragment="true" required="false" %>
<%@ attribute name="navigationContent" fragment="true" required="false" %>
<%@ include file="/WEB-INF/jsp/base.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <title><spring:message code="title.application" />
            <c:out value="${fn:trim(htmlTitle)}" /></title>
        <!-- Bootstrap core CSS -->
        <link href="<c:url value="/resource/css/bootstrap.css" /> " rel="stylesheet">
        <link href="<c:url value="/resource/css/animate.css" /> " rel="stylesheet">
        <link href="<c:url value="/resource/css/alertify/alertify.core.css" /> " rel="stylesheet">
        <link href="<c:url value="/resource/css/alertify/alertify.default.css" /> " rel="stylesheet">

        <!-- Main CSS -->
        <link href="<c:url value="/resource/css/main.css" /> " rel="stylesheet">
        <!-- Datepicker CSS -->
        <link href="<c:url value="/resource/css/datepicker.css" /> " rel="stylesheet">
        <!-- Font Awesome -->
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- HTML5 shiv and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="js/html5shiv.js"></script>
                <script src="js/respond.min.js"></script>
                <![endif]-->

        <script type="text/javascript" lang="javascript">
            var postInvisibleForm = function (url, fields) {
                var form = $('<form id="mapForm" method="post"></form>')
                        .attr({action: url, style: 'display: none;'});
                for (var key in fields) {
                    if (fields.hasOwnProperty(key))
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

    </head>
    <body>

        <!-- HEADER -->
        <jsp:invoke fragment="header" /><!-- HeaderBar -->
        <!-- Side Bar -->
        <jsp:invoke fragment="navigationContent" /> 
        <!-- Main Content -->
        <jsp:doBody /> <!-- Page Content -->
    </body>
    <!--End Container-->

    <!-- Javascript -->

    <!-- JQuery (necessary for Bootstrap's Javascript plugins) -->
    <script src="<c:url value="/resource/js/jquery.js" />"></script>


    <!-- jQuery UI JS -->
<!--    <script src="<c:url value="/resource/js/jquery-ui-v1.10.3.js" />"></script>-->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resource/js/bootstrap.min.js" />"></script>
    <!-- Sparkline graphs -->
    <script src="<c:url value="/resource/js/sparkline.js" />"></script>
    <!-- jquery ScrollUp JS -->
    <script src="<c:url value="/resource/js/scrollup//jquery.scrollUp.js" />"></script>
    <!-- Notifications JS -->
    <script src="<c:url value="/resource/js/alertify/alertify.js" />"></script>
    <script src="<c:url value="/resource/js/alertify/alertify-custom.js" />"></script>
<!--     Flot Charts 
    <script src="<c:url value="/resource/js/flot/jquery.flot.js" />"></script>
    <script src="<c:url value="/resource/js/flot/jquery.flot.tooltip.min.js" />"></script>
    <script src="<c:url value="/resource/js/flot/jquery.flot.resize.min.js" />"></script>
    <script src="<c:url value="/resource/js/flot/jquery.flot.stack.min.js" />"></script>
    <script src="<c:url value="/resource/js/flot/jquery.flot.orderBar.min.js" />"></script>
    <script src="<c:url value="/resource/js/flot/jquery.flot.pie.min.js" />"></script>-->

<!--     JVector Map 
    <script src="<c:url value="/resource/js/jvectormap/jquery-jvectormap-1.2.2.min.js" />"></script>
    <script src="<c:url value="/resource/js/jvectormap/jquery-jvectormap-usa.js" />"></script>-->
    <!-- Custom Index -->
    <script src="<c:url value="/resource/js/custom.js" />"></script>
    <script src="<c:url value="/resource/js/custom-index.js" />"></script>

    <script>
            // Fixes bootstrap.js issue where classes aren't added to navigation bar
            var url = window.location;
            // Will also work for relative and absolute hrefs
            $('ul.side-menu a').filter(function () {
                return this.href == url;
            }).parent().addClass('highlight').append("<span class='current-page'></span>");

    </script>

</html>
