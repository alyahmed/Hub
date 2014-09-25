package ca.ahmedaly.site.util;

import ca.ahmedaly.site.SignUpController;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

import ca.ahmedaly.site.entities.UserPrincipal;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;

public class SecurityUtil {

    private static final Logger log = LogManager.getLogger(SignUpController.class);
    
    
    // No longer static
    @Autowired
    AuthenticationManager authenticationManager;

    public void logInUser(UserPrincipal user, String password) {

        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user, password);
        Authentication authentication = authenticationManager.authenticate(token);
        getSecurityContext().setAuthentication(authentication);
        log.info("Authenticated User: " + user.getUsername() + " is now logged in");
        log.info("Current Authentication: " + getSecurityContext().getAuthentication().getName());
    }

    private SecurityContext getSecurityContext() {
        return SecurityContextHolder.getContext();
    }

}
