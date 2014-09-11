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
<link href="<c:url value="/resource/css/animation.css" />"
	rel="stylesheet">
<link href="<c:url value="/resource/css/checkbox/orange.css" /> "
	rel="stylesheet">
<link href="<c:url value="/resource/css/preview.css" /> "
	rel="stylesheet">
<link href="<c:url value="/resource/css/authenty.css" /> "
	rel="stylesheet">

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
		<jsp:doBody />
</body>
<!--End Container-->
<!-- js library -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.0/jquery-ui.min.js"></script>

<!-- Javascript -->
<script src="<c:url value="/resource/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resource/js/jquery.icheck.min.js" />"></script>
<script src="<c:url value="/resource/js/waypoints.min.js" />"></script>
<!-- Page JS -->
<script src="<c:url value="/resource/js/authenty.js" />"></script>

<!-- Preview Scripts -->
<script src="<c:url value="/resource/js/preview/jquery.malihu.PageScroll2id.js" />"></script>
<script src="<c:url value="/resource/js/preview/jquery.address-1.6.min.js" />"></script>
<script src="<c:url value="/resource/js/preview/scrollTo.min.js" />"></script>
<script src="<c:url value="/resource/js/preview/init.js" />"></script>
<!-- preview scripts -->
		<script>
			(function($) {
				
				// get full window size
				$(window).on('load resize', function(){
				    var w = $(window).width();
				    var h = $(window).height();

				    $('section').height(h);
				});		

				// scrollTo plugin
				$('#signup_from_1').scrollTo({ easing: 'easeInOutQuint', speed: 1500 });
				$('#forgot_from_1').scrollTo({ easing: 'easeInOutQuint', speed: 1500 });
				$('#signup_from_2').scrollTo({ easing: 'easeInOutQuint', speed: 1500 });
				$('#forgot_from_2').scrollTo({ easing: 'easeInOutQuint', speed: 1500 });
				$('#forgot_from_3').scrollTo({ easing: 'easeInOutQuint', speed: 1500 });
				
				
				// set focus on input
				var firstInput = $('section').find('input[type=text], input[type=email]').filter(':visible:first');
        
				if (firstInput != null) {
            firstInput.focus();
        }
				
				$('section').waypoint(function (direction) {
					var target = $(this).find('input[type=text], input[type=email]').filter(':visible:first');
					target.focus();
				}, {
	          offset: 300
	      }).waypoint(function (direction) {
					var target = $(this).find('input[type=text], input[type=email]').filter(':visible:first');
			  	target.focus();
	      }, {
	          offset: -400
	      });
				
				
				// animation handler
				$('[data-animation-delay]').each(function () {
	          var animationDelay = $(this).data("animation-delay");
	          $(this).css({
	              "-webkit-animation-delay": animationDelay,
	              "-moz-animation-delay": animationDelay,
	              "-o-animation-delay": animationDelay,
	              "-ms-animation-delay": animationDelay,
	              "animation-delay": animationDelay
	          });
	      });
				
	      $('[data-animation]').waypoint(function (direction) {
	          if (direction == "down") {
	              $(this).addClass("animated " + $(this).data("animation"));
	          }
	      }, {
	          offset: '90%'
	      }).waypoint(function (direction) {
	          if (direction == "up") {
	              $(this).removeClass("animated " + $(this).data("animation"));
	          }
	      }, {
	          offset: '100%'
	      });
			
			})(jQuery);
		</script>

</html>
