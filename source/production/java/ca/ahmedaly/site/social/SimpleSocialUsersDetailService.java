package ca.ahmedaly.site.social;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.social.security.SocialUser;
import org.springframework.social.security.SocialUserDetails;
import org.springframework.social.security.SocialUserDetailsService;

import ca.ahmedaly.site.repositories.UserRepository;

public class SimpleSocialUsersDetailService implements SocialUserDetailsService {
	
	private UserDetailsService userDetailsService;
	
	
	@Inject private UserRepository repository;
	
	public SimpleSocialUsersDetailService(UserDetailsService userDetailsService) {
		this.userDetailsService = userDetailsService;
	}

	@Override
	public SocialUserDetails loadUserByUserId(String userId) throws UsernameNotFoundException, DataAccessException {
		String username = repository.findOne(Long.parseLong(userId)).getUsername();
		UserDetails userDetails = userDetailsService.loadUserByUsername(username);
		return new SocialUser(userDetails.getUsername(), userDetails.getPassword(), userDetails.getAuthorities());
	}


}
