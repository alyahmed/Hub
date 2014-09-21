package ca.ahmedaly.config;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.core.env.Environment;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.social.UserIdSource;
import org.springframework.social.config.annotation.ConnectionFactoryConfigurer;
import org.springframework.social.config.annotation.EnableSocial;
import org.springframework.social.config.annotation.SocialConfigurer;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.web.ReconnectFilter;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.social.twitter.connect.TwitterConnectionFactory;
import ca.ahmedaly.site.social.SocialConnectController;
import ca.ahmedaly.site.social.facebook.PostToWallAfterConnectInterceptor;
import ca.ahmedaly.site.social.twitter.TweetAfterConnectInterceptor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.connect.web.ConnectController;
import org.springframework.social.linkedin.api.LinkedIn;
import org.springframework.social.linkedin.connect.LinkedInConnectionFactory;

@Configuration
@EnableSocial
public class SocialConfiguration implements SocialConfigurer {

    @Inject
    private DataSource dataSource;

    /*
     * Social Configurer implementation methods
     * 
     * @see org.springframework.social.config.annotation.SocialConfigurer#
     * addConnectionFactories
     * (org.springframework.social.config.annotation.ConnectionFactoryConfigurer
     * , org.springframework.core.env.Environment)
     */
    //Social Media API keys
    private final String TWITTER_CONSUMER_KEY = "VtVh1EEoqYhHdau1bcpwNV4l5";
    private final String TWITTER_CONSUMER_SECRET = "LpAhCggISjXZrQUviS0ntOXzYym087IThp4uVO78HXOmQia0PU";

    private final String FACEBOOK_APP_ID = "346118278872946";
    private final String FACBOOK_APP_SECRET = "3a9f1899f2bb25b36db28317e07dcabf";

    private final String LINKEDIN_APP_KEY = "77eroyg7yrjq22";
    private final String LINKEDIN_APP_SECRET = "OfTYGuRZXFplowCN";
    private final String LINKEDIN_SCOPE = "r_fullprofile r_emailaddress r_network";

    @Override
    public void addConnectionFactories(ConnectionFactoryConfigurer cfConfig,
            Environment env) {
        cfConfig.addConnectionFactory(new TwitterConnectionFactory(
                TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET));
        cfConfig.addConnectionFactory(new FacebookConnectionFactory(
                FACEBOOK_APP_ID, FACBOOK_APP_SECRET));
        LinkedInConnectionFactory lcf = new LinkedInConnectionFactory(LINKEDIN_APP_KEY, LINKEDIN_APP_SECRET);
        lcf.setScope(LINKEDIN_SCOPE);
        cfConfig.addConnectionFactory(lcf);
    }

    @Override
    public UsersConnectionRepository getUsersConnectionRepository(
            ConnectionFactoryLocator connectionFactoryLocator) {
        return new JdbcUsersConnectionRepository(dataSource,
                connectionFactoryLocator, Encryptors.noOpText());
    }

    @Override
    public UserIdSource getUserIdSource() {
        return new UserIdSource() {
            @Override
            public String getUserId() {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                if (authentication == null) {
                    throw new IllegalStateException("Unable to get a ConnectionRepository: no user signed in");
                }
                return authentication.getName();
            }
        };
    }

    /*
     * Web Controller and Filter beans
     * 
     * Controller offers status view at /connect/status. Must implement own view
     * 
     * Filters handle connection to service providers and reconnection incase
     * token expires
     */
    @Bean
    public ConnectController connectController(
            ConnectionFactoryLocator connectionFactoryLocator,
            ConnectionRepository connectionRepository) {

        SocialConnectController controller = new SocialConnectController(connectionFactoryLocator, connectionRepository);
        controller.addInterceptor(new TweetAfterConnectInterceptor());
        controller.addInterceptor(new PostToWallAfterConnectInterceptor());
        return controller;
    }

    @Bean
    public ReconnectFilter apiExceptionHandler(UsersConnectionRepository usersConnectionRepository, UserIdSource userIdSource) {
        return new ReconnectFilter(usersConnectionRepository, userIdSource);
    }

    //
    // API Binding Beans
    //
    @Bean
    @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
    public Facebook facebook(ConnectionRepository repository) {
        Connection<Facebook> connection = repository
                .findPrimaryConnection(Facebook.class);
        return connection != null ? connection.getApi() : null;
    }

    @Bean
    @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
    public Twitter twitter(ConnectionRepository repository) {
        Connection<Twitter> connection = repository
                .findPrimaryConnection(Twitter.class);
        return connection != null ? connection.getApi() : null;
    }

    @Bean
    @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
    public LinkedIn linkedIn(ConnectionRepository repository) {
        Connection<LinkedIn> connection = repository.findPrimaryConnection(LinkedIn.class);
        return connection != null ? connection.getApi() : null;
    }


}
