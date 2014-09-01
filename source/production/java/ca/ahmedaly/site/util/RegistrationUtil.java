package ca.ahmedaly.site.util;

import java.util.HashSet;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import ca.ahmedaly.site.SignUpForm;
import ca.ahmedaly.site.entities.UserAuthority;
import ca.ahmedaly.site.entities.UserPrincipal;

public class RegistrationUtil {
	
	private static final Logger log = LogManager.getLogger(RegistrationUtil.class);
	
	public static UserPrincipal createUser(SignUpForm form){
		
		UserPrincipal user = new UserPrincipal();
		
		// Set User Details
		user.setUsername(form.getUsername());
		user.setFirstName(form.getFirstName());
		user.setLastName(form.getLastName());
		
		// Set Security Permission
		user.setAccountNonExpired(true);
		user.setAccountNonLocked(true);
		user.setEnabled(true);
		user.setCredentialsNonExpired(true);
		
		
		
		// Set Authorization Permissions
		user.setAuthorities(defaultUserAuthorities());
		
		log.info("Creating New UserPrincipal: " + user);
		
		return user;
	}
	
	public static Set<UserAuthority> defaultUserAuthorities(){
		
		Set<UserAuthority> authorities = new HashSet<UserAuthority>();
		
		authorities.add(new UserAuthority("VIEW_TICKET"));
		authorities.add(new UserAuthority("VIEW_COMMENT"));
		authorities.add(new UserAuthority("VIEW_TICKETS"));
		authorities.add(new UserAuthority("VIEW_ATTACHMENT"));
		authorities.add(new UserAuthority("CREATE_TICKET"));
		authorities.add(new UserAuthority("CREATE_COMMENT"));
		
		return authorities;
		
	}
	
	
}
