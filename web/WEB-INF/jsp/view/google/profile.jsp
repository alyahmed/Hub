
<spring:message code="title.google.profile" var="googleProfile" />
<template:basic htmlTitle="${googleProfile}"
                bodyTitle="${googleProfile}">
    <c:url var="googleCalenderUrl" value="/google/calender" />
    <!--Google Calender  -->
    <c:url var="googleContactsUrl" value="/google/contacts" />
    <!-- Google Contacts-->
    <spring:message code="nav.item.social.google.calender" var="googleCalender" />
    <spring:message code="nav.item.social.google.contacts" var="googleContacts" />
    <div class="spacer"></div>
    <div class="col-md-12 col-sm-12 col-sx-12">
        <div class="current-profile">
            <div class="user-bg"></div>
            <div class="user-pic"> </div>
            <div class="user-details">
                <h4 class="user-name"> ${profile.displayName}</h4>
                <h5 class="description">${profile.aboutMe}</h5>
            </div>
            <div class="social-list">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="row">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="btn-group btn-group-justified center-align-text">
        <a class="btn btn-warning btn-rounded"  href="${googleCalenderUrl}" role="button" data-original-title="" title=""> ${googleCalender}</a>
        <a class="btn btn-success" role="button" href="${googleContactsUrl}" data-original-title="" title="">${googleContacts}</a>
    </div>

</template:basic>
