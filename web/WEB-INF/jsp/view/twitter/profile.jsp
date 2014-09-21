
<spring:message code="title.twitter.profile" var="twitterProfile" />
<template:basic htmlTitle="${twitterProfile}"
                bodyTitle="${twitterProfile}">
    <c:url var="twitterTimelineUrl" value="/twitter/timeline" />
    <!-- Twitter Timeline -->
    <c:url var="twitterFriendsUrl" value="/twitter/friends" />
    <!-- Twitter Friends Page -->
    <c:url var="twitterTrendsUrl" value="/twitter/trends" />
    <!-- Twitter Global Trends -->
    <c:url var="twitterMessagesUrl" value="/twitter/messages" />
    <!-- Twitter Direct Messages -->
    <c:url var="twitterDisconnect" value="/disconnect/twitter" />
    
    <spring:message code="nav.item.social.twitter.timeline" var="twitterTimeline" />
    <spring:message code="nav.item.social.twitter.friends" var="twitterFriends" />
    <spring:message code="nav.item.social.twitter.trends" var="twitterTrends" />
    <spring:message code="nav.item.social.twitter.messages" var="twitterMessages"/>

    <div class="col-md-12 col-sm-12 col-sx-12">
        <div class="current-profile">
            <div class="user-bg"></div>
            <img src="/resource/img/profile-bg1.jpg" />
           
            <div class="user-details">
                <h4 class="user-name"> @${profile.screenName}</h4>
                <h5 class="description">${profile.description}</h5>
            </div>
            <div class="social-list">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="row">
                            <div class="col-md-3 col-sm-3 col-xs-3 center-align-text">
                                <h3>${profile.friendsCount}</h3>
                                <small>Friends</small>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 center-align-text">
                                <h3>${profile.followersCount}</h3>
                                <small>Followers</small>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 center-align-text">
                                <h3>${profile.statusesCount}</h3>
                                <small>Tweets</small>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 center-align-text">
                                <h3>189</h3>
                                <small>Contacts</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="btn-group btn-group-justified center-align-text">
        <a class="btn btn-warning btn-rounded"  href="${twitterTimelineUrl}" role="button" data-original-title="" title="">${twitterTimeline}</a>
        <a class="btn btn-success" role="button" href="${twitterFriendsUrl}" data-original-title="" title="">${twitterFriends}</a>
        <a class="btn btn-info" role="button"href="${twitterTrendsUrl}"  data-original-title="" title="">${twitterTrends}</a>
        <a class="btn btn-danger btn-rounded" role="button" data-original-title="" title="">Last</a>
    </div>
         <form id="disconnect" action="${twitterDisconnect}" method="POST">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit">Disconnect from Twitter</button>	
                <input type="hidden" name="_method" value="delete" />
            </form>

</template:basic>
