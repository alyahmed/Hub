<%--@elvariable id="profiles" type="org.springframework.social.twitter.api.Twitter.friendOperations()"--%>
<spring:message code="title.user.profile" var="userProfile" />
<template:basic htmlTitle="${userProfile}"
                bodyTitle="${userProfile}">

    <form class="form" action="##" method="post" id="registrationForm">

        <security:authentication var="userName" property="principal.username" /> 
        <security:authentication var="firstName" property="principal.firstName" />  
        <security:authentication var="lastName" property="principal.lastName" />

        <div class="form-group">

            <div class="col-xs-6">
                <label for="first_name"><h4>User Name</h4></label>
                <input type="text" class="form-control" name="first_name" id="user_name" placeholder="${userName}" title="enter your first name if any.">
            </div>
        </div>
        <div class="form-group">

            <div class="col-xs-6">
                <label for="last_name"><h4>First Name</h4></label>
                <input type="text" class="form-control" name="last_name" id="first_name" placeholder="${firstName}" title="enter your last name if any.">
            </div>
        </div>
        <div class="form-group">

            <div class="col-xs-6">
                <label for="last_name"><h4>Last Name</h4></label>
                <input type="text" class="form-contro   l" name="last_name" id="last_name" placeholder="${lastName}" title="enter your last name if any.">
            </div>
        </div>


        <div class="form-group">

            <div class="col-xs-6">
                <label for="password"><h4>Password</h4></label>
                <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-12">
                <br>
                <button class="btn btn-lg btn-success" type="submit"><i class="fa fa-save"></i> Save</button>
            </div>
        </div>
    </form>

</div>
</template:basic>
