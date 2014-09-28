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
<link href="<c:url value="/resource/css/bootstrap.css" /> "
	rel="stylesheet">
<!-- Login page Specific CSS -->
<!-- Animate CSS -->
<link href="<c:url value="/resource/css/animate.css" />"
	rel="stylesheet">
<!-- Main CSS -->
<link href="<c:url value="/resource/css/main.css" /> "
	rel="stylesheet">
<!-- Main CSS -->
<link href="<c:url value="/resource/css/login.css" /> "
	rel="stylesheet">
<!-- Font Awesome -->
<link href="<c:url value="/resource/fonts/font-awesome.min.css" /> "
	rel="stylesheet">

<!-- HTML5 shiv and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="js/html5shiv.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->

<!-- Font Awesome CDN -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">

<!-- Google Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,700'
	rel='stylesheet' type='text/css'>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<!-- CSRF TOKEN DO NOT TOUCH -->
<script type="text/javascript" lang="javascript">
	var postInvisibleForm = function(url, fields) {
		var form = $('<form id="mapForm" method="post"></form>').attr({
			action : url,
			style : 'display: none;'
		});
		for ( var key in fields) {
			if (fields.hasOwnProperty(key))
				form.append($('<input type="hidden">').attr({
					name : key,
					value : fields[key]
				}));
		}
		form.append($('<input type="hidden">').attr({
			name : '${_csrf.parameterName}',
			value : '${_csrf.token}'
		}));
		$('body').append(form);
		form.submit();
	};
</script>

</head>
<body>
    <!-- Container Fluid starts -->
		<jsp:doBody />
</body>
<!--End Container-->

<!-- Login Page Specific Javascript -->
<script src="<c:url value="/resource/js/jquery.js" />"></script>
<script src="<c:url value="/resource/js/bootstrap.min.js" />"></script>
<!-- Preview Script -->
<script type="text/javascript">
			(function($) {
				// constants
				var SHOW_CLASS = 'show',
					HIDE_CLASS = 'hide',
					ACTIVE_CLASS = 'active';
				
				$('a').on('click', function(e){
					e.preventDefault();
					var a = $(this),
					href = a.attr('href');
				
					$('.active').removeClass(ACTIVE_CLASS);
					a.addClass(ACTIVE_CLASS);

					$('.show')
					.removeClass(SHOW_CLASS)
					.addClass(HIDE_CLASS)
					.hide();
					
					$(href)
					.removeClass(HIDE_CLASS)
					.addClass(SHOW_CLASS)
					.hide()
					.fadeIn(550);
				});
			})(jQuery);
		</script>
</html>
