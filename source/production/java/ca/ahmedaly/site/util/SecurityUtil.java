package ca.ahmedaly.site.util;

import ca.ahmedaly.site.SignUpController;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

import ca.ahmedaly.site.entities.UserPrincipal;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SecurityUtil {
    
    private static final Logger log = LogManager.getLogger(SignUpController.class);
    
    public static void logInUser(UserPrincipal user) {
        SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(user.getId(), null, user.getAuthorities()));
        log.info("Authenticated User: " + user.getUsername() + " is now logged in");
    }

}
