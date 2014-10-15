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
		UserPrincipal user = UserPrincipal.getBuilder()
                        .username(form.getUsername())
                        .firstName(form.getFirstName())
                        .lastName(form.getLastName())
                        .accountNonExpired(true)
                        .accountNonLocked(true)
                        .credentialsNonExpired(true)
                        .enabled(true)
                        .authorities(defaultUserAuthorities())
                        .build();
		return user;
	}
	
	public static Set<UserAuthority> defaultUserAuthorities(){
		
		Set<UserAuthority> authorities = new HashSet<>();
		authorities.add(new UserAuthority("VIEW_TICKET"));
		authorities.add(new UserAuthority("VIEW_COMMENT"));
		authorities.add(new UserAuthority("VIEW_TICKETS"));
		authorities.add(new UserAuthority("VIEW_ATTACHMENT"));
		authorities.add(new UserAuthority("CREATE_TICKET"));
		authorities.add(new UserAuthority("CREATE_COMMENT"));
		return authorities;
		
	}
	
	
}
