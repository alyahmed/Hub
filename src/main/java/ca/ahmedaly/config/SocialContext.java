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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.connect.web.ConnectController;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.linkedin.api.LinkedIn;
import org.springframework.social.linkedin.connect.LinkedInConnectionFactory;

@Configuration
@EnableSocial
@PropertySource("classpath:application.properties")
public class SocialContext implements SocialConfigurer {

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
    @Value("${twitter.consumer.key}")
    private String TWITTER_CONSUMER_KEY;
    @Value("${twitter.consumer.secret}")
    private String TWITTER_CONSUMER_SECRET;
    @Value("${facebook.app.id}")
    private String FACEBOOK_APP_ID;
    @Value("${facebook.app.secret}")
    private String FACBOOK_APP_SECRET;
    @Value("${facebook.scope}")
    private String FACEBOOK_SCOPE;
    @Value("${linkedin.app.key}")
    private String LINKEDIN_APP_KEY;
    @Value("${linkedin.app.secret}")
    private String LINKEDIN_APP_SECRET;
    @Value("${linkedin.app.scope}")
    private String LINKEDIN_SCOPE;
    @Value("${google.client.id}")
    private String GOOGLE_CLIENT_ID;
    @Value("${google.client.secret}")
    private String GOOGLE_CLIENT_SECRET;
    @Value("${google.scope}")
    private String GOOGLE_SCOPE;

    @Override
    public void addConnectionFactories(ConnectionFactoryConfigurer cfConfig,
            Environment env) {

        cfConfig.addConnectionFactory(new TwitterConnectionFactory(
                TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET));
        FacebookConnectionFactory facebookConnectionFactory = new FacebookConnectionFactory(
                FACEBOOK_APP_ID, FACBOOK_APP_SECRET);
        
        facebookConnectionFactory.setScope(FACEBOOK_SCOPE);
        LinkedInConnectionFactory linkedinConnectionFactory = new LinkedInConnectionFactory(LINKEDIN_APP_KEY, LINKEDIN_APP_SECRET);
        linkedinConnectionFactory.setScope(LINKEDIN_SCOPE);
        GoogleConnectionFactory googleConnectionFactory = new GoogleConnectionFactory(GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET);
        googleConnectionFactory.setScope(GOOGLE_SCOPE);
        cfConfig.addConnectionFactory(facebookConnectionFactory);
        cfConfig.addConnectionFactory(linkedinConnectionFactory);
        cfConfig.addConnectionFactory(googleConnectionFactory);
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

    /**
     * API Binding Bean
     *
     * @param repository
     * @return
     */
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

    @Bean
    @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
    public Google google(ConnectionRepository repository) {
        Connection<Google> connection = repository.findPrimaryConnection(Google.class);
        return connection != null ? connection.getApi() : null;
    }

}
