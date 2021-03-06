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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.instagram.api.Instagram;
import org.springframework.social.instagram.connect.InstagramConnectionFactory;
import org.springframework.social.linkedin.api.LinkedIn;
import org.springframework.social.linkedin.connect.LinkedInConnectionFactory;
import org.springframework.social.reddit.api.Reddit;
import org.springframework.social.reddit.connect.RedditConnectionFactory;
import org.springframework.social.tumblr.api.Tumblr;
import org.springframework.social.tumblr.connect.TumblrConnectionFactory;

@Configuration
@EnableSocial
@PropertySource("classpath:application.properties")
public class SocialContext implements SocialConfigurer {

    @Inject
    private DataSource dataSource;

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
    
    @Value("${instagram.client.id}")
    private String INSTAGRAM_CLIENT_ID;
    
    @Value("${instagram.client.secret}")
    private String INSTAGRAM_CLIENT_SECRET;
    
    @Value("${instagram.scope}")
    private String INSTAGRAM_SCOPE;
    
    
    @Value("${tumblr.consumer.id}")
    private String TUMBLR_CONSUMER_ID;
    @Value("${tumblr.consumer.secret}")
    private String TUMBLR_CONSUMER_SECRET;
    
    
    @Value("${reddit.client.id}")
    private String REDDIT_CLIENT_ID;
    @Value("${reddit.client.secret}")
    private String REDDIT_CLIENT_SECRET;
    @Value("${reddit.scope}")
    private String REDDIT_SCOPE;
    
    @Value("${flickr.app.key}")
    private String FLICKR_APP_KEY;
    
    @Value("${flickr.app.secret}")
    private String FLICKR_APP_SECRET;
    
    @Override
    public void addConnectionFactories(ConnectionFactoryConfigurer cfConfig,
            Environment env) {

        cfConfig.addConnectionFactory(new TwitterConnectionFactory(
                TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET));
        
        FacebookConnectionFactory facebookConnectionFactory = new FacebookConnectionFactory(
                FACEBOOK_APP_ID, FACBOOK_APP_SECRET);
        
        TumblrConnectionFactory tumblrConnectionFactory = 
                new TumblrConnectionFactory(TUMBLR_CONSUMER_ID, TUMBLR_CONSUMER_SECRET);
        
        LinkedInConnectionFactory linkedinConnectionFactory = new LinkedInConnectionFactory(LINKEDIN_APP_KEY, LINKEDIN_APP_SECRET);
        linkedinConnectionFactory.setScope(LINKEDIN_SCOPE);
        InstagramConnectionFactory instagramConnectionFactory
                = new InstagramConnectionFactory(INSTAGRAM_CLIENT_ID, INSTAGRAM_CLIENT_SECRET);
        instagramConnectionFactory.setScope(INSTAGRAM_SCOPE);
            
        
        GoogleConnectionFactory googleConnectionFactory = new GoogleConnectionFactory(GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET);
        googleConnectionFactory.setScope(GOOGLE_SCOPE);
        
        RedditConnectionFactory redditConnectionFactory = new RedditConnectionFactory(REDDIT_CLIENT_ID, REDDIT_CLIENT_SECRET);
        redditConnectionFactory.setScope(REDDIT_SCOPE);
        
        
        cfConfig.addConnectionFactory(facebookConnectionFactory);
        cfConfig.addConnectionFactory(linkedinConnectionFactory);
        cfConfig.addConnectionFactory(googleConnectionFactory);
        cfConfig.addConnectionFactory(instagramConnectionFactory);
        cfConfig.addConnectionFactory(tumblrConnectionFactory);
        cfConfig.addConnectionFactory(redditConnectionFactory);
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

    @Bean
    @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
    public Instagram instagram(ConnectionRepository repository) {
        Connection<Instagram> connection = repository.findPrimaryConnection(Instagram.class);
        return connection != null ? connection.getApi() : null;
    }
    
    @Bean
    @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
    public Tumblr tumblr(ConnectionRepository repository) {
        Connection<Tumblr> connection = repository.findPrimaryConnection(Tumblr.class);
        return connection != null ? connection.getApi() : null;
    }
    
    @Bean
    @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
    public Reddit reddit(ConnectionRepository repository)
    {
        Connection<Reddit> connection = repository.findPrimaryConnection(Reddit.class);
        return connection != null ? connection.getApi() : null;
    }
    
    

}
