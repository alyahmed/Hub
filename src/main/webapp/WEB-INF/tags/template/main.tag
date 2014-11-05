<%--@elvariable id="_csrf" type="org.springframework.security.web.csrf.CsrfToken"--%>
<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ attribute name="htmlTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ attribute name="bodyTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ attribute name="header" fragment="true" required="false" %>
<%@ attribute name="navigationContent" fragment="true" required="false" %>
<%@ attribute name="pageStyleResources" fragment="true" required="false" %>
<%@ attribute name="pageScriptResources" fragment="true" required="false" %>
<%@ include file="/WEB-INF/jsp/base.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <title><spring:message code="title.application" />
            <c:out value="${fn:trim(htmlTitle)}" /></title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <!-- global css -->

        <link href="<c:url value="/resource/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="<c:url value="/resource/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resource/css/styles/black.css" />" rel="stylesheet" type="text/css" id="colorscheme" />

        <link rel="stylesheet" href="<c:url value="/resource/css/panel.css" />" />
        <link rel="stylesheet" href="<c:url value="/resource/css/metisMenu.css" />" />    
        <link rel="stylesheet" href="<c:url value="/resource/css/only_dashboard.css" />" />   
        <!-- end of global css -->    
        <!--page level css -->
        <jsp:invoke fragment="pageStyleResources" />
        <!--end of page level css-->

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
    <body class="skin-josh">
        <!-- HEADER -->
        <header class="header">
            <jsp:invoke fragment="header" />
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <aside class="left-side sidebar-offcanvas">
                <!-- Side Bar -->
                <jsp:invoke fragment="navigationContent" /> 
            </aside>
            <!-- Main Content -->
            <jsp:doBody /> 
        </div> <!--End Container-->
    </body>


    <!-- Javascript -->
    <!-- global js -->
    <script src="<c:url value="/resource/js/jquery-1.11.1.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resource/js/bootstrap.min.js" />" type="text/javascript"></script>
    <!--livicons-->
    <script src="<c:url value="/resource/vendors/livicons/minified/raphael-min.js" />"></script>
    <script src="<c:url value="/resource/vendors/livicons/minified/livicons-1.3.min.js" />"></script>
    <script src="<c:url value="/resource/js/josh.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resource/js/metisMenu.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resource/vendors/holder-master/holder.js" />"></script>
    <!-- end of global js -->

    <jsp:invoke fragment="pageStyleResources" />


    <script>
            // Fixes bootstrap.js issue where classes aren't added to navigation bar
            var url = window.location;
            // Will also work for relative and absolute hrefs
            $('ul.page-sidebar-menu a').filter(function () {
                return this.href == url;
            }).parent().addClass('active').append("<span class='current-page'></span>");

    </script>

</html>
