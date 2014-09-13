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
        <!-- Custom CSS -->
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="<c:url value="/resource/css/sb-admin.css" /> " rel="stylesheet">
        <!-- Morris Graphs-->
        <link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
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

        <div id="wrapper">
            <jsp:invoke fragment="navigationContent" /> <!-- Side Bar -->
            <jsp:doBody /> <!-- Page Content -->
        </div>
    </body>
    <!--End Container-->

    <!-- Javascript -->
    <script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>

    <script src="<c:url value="/resource/js/jquery-1.10.2.js" />"></script>
    <script src="<c:url value="/resource/js/bootstrap.js" />"></script>
    <script src="<c:url value="/resource/js/morris/chart-data-morris.js" />"></script>
    <script src="<c:url value="/resource/js/tablesorter/jquery.tablesorter.js" />"></script>
    <script src="<c:url value="/resource/js/tablesorter/tables.js" />"></script>
    <script>
            // Fixes bootstrap.js issue where classes aren't added to navigation bar
            var url = window.location;
            // Will only work if string in href matches with location
            $('ul.nav a[href="' + url + '"]').parent().addClass('active');

            // Will also work for relative and absolute hrefs
            $('ul.nav a').filter(function () {
                return this.href == url;
            }).parent().addClass('active');
    </script>




</html>
