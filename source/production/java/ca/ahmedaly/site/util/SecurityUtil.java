package ca.ahmedaly.site.util;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.TestingAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.authentication.AuthenticationManagerFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import ca.ahmedaly.site.entities.UserPrincipal;

public class SecurityUtil {
	
	public static void logInUser(UserPrincipal user){
		UserDetails userDetails = (UserDetails) user;
		Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
		
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}

}
