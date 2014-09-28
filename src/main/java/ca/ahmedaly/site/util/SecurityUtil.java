package ca.ahmedaly.site.util;

import ca.ahmedaly.site.SignUpController;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

import ca.ahmedaly.site.entities.UserPrincipal;
import ca.ahmedaly.site.repositories.UserRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.userdetails.UserDetails;

public class SecurityUtil {

    private static final Logger log = LogManager.getLogger(SignUpController.class);
    
    @Autowired UserRepository userRepository;
    
    
    public static void logInUser(String username, String password) {
        
        log.info("Authenticated User: " + username + " is now logged in");
    }

    private static SecurityContext getSecurityContext() {
        return SecurityContextHolder.getContext();
    }
    

}
