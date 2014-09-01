package ca.ahmedaly.site.social;

import javax.inject.Inject;

import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.web.ConnectController;

import ca.ahmedaly.config.annotation.WebController;

@WebController("/connect")
public class SocialConnectController extends ConnectController {
	
	
	@Inject
	public SocialConnectController(
			ConnectionFactoryLocator connectionFactoryLocator,
			ConnectionRepository connectionRepository) {
		super(connectionFactoryLocator, connectionRepository);
	}
	
	
	
}