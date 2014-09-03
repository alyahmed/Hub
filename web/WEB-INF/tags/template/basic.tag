<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ attribute name="htmlTitle" type="java.lang.String"
	rtexprvalue="true" required="true"%>
<%@ attribute name="bodyTitle" type="java.lang.String"
	rtexprvalue="true" required="true"%>
<%@ include file="/WEB-INF/jsp/base.jspf"%>
<template:main htmlTitle="${htmlTitle}" bodyTitle="${bodyTitle}">
	<jsp:attribute name="navigationContent">
	
		<c:url var="homeUrl" value="/home" /> <!-- Dashboard Console -->
        <c:url var="socialConnect" value="/connect" /> <!-- Check List of all active social media connections -->
		<c:url var="listSessions" value="/session/list" /> <!-- List of current Sessions -->
		<c:url var="logoutUrl" value="/logout" /> <!-- Log out of application -->
		<c:url var="twitterProfile" value="/twitter" /> <!-- Check out Twitter Profile -->
		<!-- Sidebar -->
      <nav class="navbar navbar-inverse navbar-fixed-top"
			role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle"
					data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${homeUrl}"> <spring:message
						code="title.application" /> </a>
        </div>
		
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
            <li class="active"><a href="${socialConnect}"><i
							class="fa fa-dashboard"></i>   <spring:message
								code="nav.item.social.status" /></a></li>
							
			
			
			
			<security:authorize access="hasAuthority('VIEW_USER_SESSIONS')">
            <li>
	            <a href="${listSessions}">
		            <i class="fa fa-bar-chart-o"></i> 
		            <spring:message code="nav.item.list.session" />
	            </a>
	        </li>
			</security:authorize>
			
			<!-- Twitter Specific Links -->
              	<li><a href="${twitterProfile}"><spring:message
								code="nav.item.social.twitter" /></a></li>
          </ul>
		
		<ul class="nav navbar-nav navbar-right navbar-user">
            <li class="dropdown messages-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-envelope"></i> Messages <span class="badge">7</span> <b
							class="caret"></b></a>
              <ul class="dropdown-menu">
                <li class="dropdown-header">7 New Messages</li>
                <li class="message-preview">
                  <a href="#">
                    <span class="avatar"><img
										src="http://placehold.it/50x50"></span>
                    <span class="name">John Smith:</span>
                    <span class="message">Hey there, I wanted to ask you something...</span>
                    <span class="time"><i class="fa fa-clock-o"></i> 4:34 PM</span>
                  </a>
                </li>
                <li class="divider"></li>
                <li class="message-preview">
                  <a href="#">
                    <span class="avatar"><img
										src="http://placehold.it/50x50"></span>
                    <span class="name">John Smith:</span>
                    <span class="message">Hey there, I wanted to ask you something...</span>
                    <span class="time"><i class="fa fa-clock-o"></i> 4:34 PM</span>
                  </a>
                </li>
                <li class="divider"></li>
                <li class="message-preview">
                  <a href="#">
                    <span class="avatar"><img
										src="http://placehold.it/50x50"></span>
                    <span class="name">John Smith:</span>
                    <span class="message">Hey there, I wanted to ask you something...</span>
                    <span class="time"><i class="fa fa-clock-o"></i> 4:34 PM</span>
                  </a>
                </li>
                <li class="divider"></li>
                <li><a href="#">View Inbox <span class="badge">7</span></a></li>
              </ul>
            </li>
            <li class="dropdown alerts-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-bell"></i> Alerts <span class="badge">3</span> <b
							class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Default <span
									class="label label-default">Default</span></a></li>
                <li><a href="#">Primary <span
									class="label label-primary">Primary</span></a></li>
                <li><a href="#">Success <span
									class="label label-success">Success</span></a></li>
                <li><a href="#">Info <span
									class="label label-info">Info</span></a></li>
                <li><a href="#">Warning <span
									class="label label-warning">Warning</span></a></li>
                <li><a href="#">Danger <span
									class="label label-danger">Danger</span></a></li>
                <li class="divider"></li>
                <li><a href="#">View All</a></li>
              </ul>
            </li>
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-user"></i> <security:authentication
								property="principal.username" /> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
                <li><a href="#"><i class="fa fa-envelope"></i> Inbox <span
									class="badge">7</span></a></li>
                <li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
                <li class="divider"></li>
                <li><a href="javascript:void 0;"
								onclick="postInvisibleForm('<c:url value="/logout" />', { });"><i
									class="fa fa-power-off"></i> <spring:message
										code="nav.item.logout" /> </a></li>
              </ul>
            </li>
          </ul>
        </div>
      </nav>	
		
    </jsp:attribute>
	<jsp:body>
		<div id="page-wrapper">
			<jsp:doBody />
		</div>
        
    </jsp:body>
</template:main>
