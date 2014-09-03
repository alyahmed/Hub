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
        <link href="<c:url value="/resource/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
        <link href="<c:url value="/resource/css/sb-admin.css" /> " rel="stylesheet">
		<!-- Morris Graphs-->
   		<link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
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
    <script src="<c:url value="/resource/js/jquery-1.10.2.js" />"></script>
    <script src="<c:url value="/resource/js/bootstrap.js" />"></script>
   

</html>
