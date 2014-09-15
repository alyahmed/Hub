package ca.ahmedaly.site.social;

import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.web.ConnectController;
import ca.ahmedaly.config.annotation.WebController;
import org.springframework.beans.factory.annotation.Autowired;

@WebController("/connect")
public class SocialConnectController extends ConnectController {

    @Autowired
    public SocialConnectController(
            ConnectionFactoryLocator connectionFactoryLocator,
            ConnectionRepository connectionRepository) {
        super(connectionFactoryLocator, connectionRepository);
    }
}
