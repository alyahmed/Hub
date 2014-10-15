/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site;

/**
 *
 * @author ahmedaly
 */
import static java.util.Arrays.*;

import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactory;
import org.springframework.social.connect.support.OAuth1ConnectionFactory;
import org.springframework.social.connect.support.OAuth2ConnectionFactory;
import org.springframework.social.connect.web.HttpSessionSessionStrategy;
import org.springframework.social.connect.web.SessionStrategy;
import org.springframework.social.oauth1.AuthorizedRequestToken;
import org.springframework.social.oauth1.OAuth1Operations;
import org.springframework.social.oauth1.OAuth1Parameters;
import org.springframework.social.oauth1.OAuth1Version;
import org.springframework.social.oauth1.OAuthToken;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.WebRequest;

public class SocialConnectionHelper {

    private final static Logger logger = LogManager.getLogger(SocialConnectionHelper.class);

    private boolean useAuthenticateUrl;

    private String applicationUrl;

    private String callbackUrl;

    private SessionStrategy sessionStrategy;

    public SocialConnectionHelper() {
        this(new HttpSessionSessionStrategy());
    }

    public SocialConnectionHelper(SessionStrategy sessionStrategy) {
        this.sessionStrategy = sessionStrategy;
    }

    public void setUseAuthenticateUrl(boolean useAuthenticateUrl) {
        this.useAuthenticateUrl = useAuthenticateUrl;
    }

    public void setApplicationUrl(String applicationUrl) {
        this.applicationUrl = applicationUrl;
    }

    public void setCallbackUrl(String callbackUrl) {
        this.callbackUrl = callbackUrl;
    }

    public String buildOAuthUrl(ConnectionFactory<?> connectionFactory, NativeWebRequest request) {
        return buildOAuthUrl(connectionFactory, request, null);
    }

    public String buildOAuthUrl(ConnectionFactory<?> connectionFactory, NativeWebRequest request, MultiValueMap<String, String> additionalParameters) {
        if (connectionFactory instanceof OAuth1ConnectionFactory) {
            return buildOAuth1Url((OAuth1ConnectionFactory<?>) connectionFactory, request, additionalParameters);
        } else if (connectionFactory instanceof OAuth2ConnectionFactory) {
            return buildOAuth2Url((OAuth2ConnectionFactory<?>) connectionFactory, request, additionalParameters);
        } else {
            throw new IllegalArgumentException("ConnectionFactory not supported");
        }
    }

    public Connection<?> completeConnection(OAuth1ConnectionFactory<?> connectionFactory, NativeWebRequest request) {
        String verifier = request.getParameter("oauth_verifier");
        AuthorizedRequestToken requestToken = new AuthorizedRequestToken(extractCachedRequestToken(request), verifier);
        OAuthToken accessToken = connectionFactory.getOAuthOperations().exchangeForAccessToken(requestToken, null);
        return connectionFactory.createConnection(accessToken);
    }

    public Connection<?> completeConnection(OAuth2ConnectionFactory<?> connectionFactory, NativeWebRequest request) {
        
        if (connectionFactory.supportsStateParameter()) {
            verifyStateParameter(request);
        }
        logger.info("Completing Connection for OAuth2ConnectionFactory: " + connectionFactory);
        String code = request.getParameter("code");
        try {
            logger.info("code: [" + code + "]");
            logger.info("callbackUrl: [" + callbackUrl(request) + "]");
            AccessGrant accessGrant = connectionFactory.getOAuthOperations().exchangeForAccess(code, callbackUrl(request), null);
            logger.info("accessGrant: [" + accessGrant + "]");
            return connectionFactory.createConnection(accessGrant);
        } catch (HttpClientErrorException e) {
            logger.warn("HttpClientErrorException while completing connection: " + e.getMessage());
            logger.warn("      Response body: " + e.getResponseBodyAsString());
            logger.debug(e.toString() + " Thrown");
            throw e;
        }
    }

    public Connection<?> completeConnectionInstagram(OAuth2ConnectionFactory<?> connectionFactory, NativeWebRequest request) {
        if (connectionFactory.supportsStateParameter()) {
            verifyStateParameter(request);
        }

        String code = request.getParameter("code");
        try {
            logger.info(code);
            logger.info(callbackUrl(request));
            MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
            params.add("client_id", "0212f342b6ac49868a37deba6afb445a");
            params.add("client_secret", "4ebea6cf0c414934bdf8bcc01c01733f");
            AccessGrant accessGrant = connectionFactory.getOAuthOperations().exchangeForAccess(code, callbackUrl(request), params);
            logger.info(accessGrant);
            return connectionFactory.createConnection(accessGrant);
        } catch (HttpClientErrorException e) {
            logger.warn("HttpClientErrorException while completing connection: " + e.getMessage());
            logger.warn("      Response body: " + e.getResponseBodyAsString());
            throw e;
        }
    }
    
    public Connection<?> completeConnectionReddit(OAuth2ConnectionFactory<?> connectionFactory, NativeWebRequest request) {
        if (connectionFactory.supportsStateParameter()) {
            verifyStateParameter(request);
        }

        String code = request.getParameter("code");
        try {
            logger.info(code);
            logger.info(callbackUrl(request));
            MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
            params.add("client_id", "jhbp4UrDCMkpDg");
            params.add("client_secret", "mciZcOBPSuy_cvOidVt4z1EjR74");
            AccessGrant accessGrant = connectionFactory.getOAuthOperations().exchangeForAccess(code, callbackUrl(request), params);
            logger.info(accessGrant);
            return connectionFactory.createConnection(accessGrant);
        } catch (HttpClientErrorException e) {
            logger.warn("HttpClientErrorException while completing connection: " + e.getMessage());
            logger.warn("      Response body: " + e.getResponseBodyAsString());
            throw e;
        }
    }

    private void verifyStateParameter(NativeWebRequest request) {
        String state = request.getParameter("state");
        String originalState = extractCachedOAuth2State(request);
        if (state != null && !state.equals(originalState)) {
            throw new IllegalStateException("The OAuth2 'state' parameter doesn't match.");
        }
    }

    protected String callbackUrl(NativeWebRequest request) {
        if (callbackUrl != null) {
            return callbackUrl;
        }
        HttpServletRequest nativeRequest = request.getNativeRequest(HttpServletRequest.class);
        if (applicationUrl != null) {
            return applicationUrl + connectPath(nativeRequest);
        } else {
            return nativeRequest.getRequestURL().toString();
        }
    }

	// internal helpers
    private String buildOAuth1Url(OAuth1ConnectionFactory<?> connectionFactory, NativeWebRequest request, MultiValueMap<String, String> additionalParameters) {
        OAuth1Operations oauthOperations = connectionFactory.getOAuthOperations();
        MultiValueMap<String, String> requestParameters = getRequestParameters(request);
        OAuth1Parameters parameters = getOAuth1Parameters(request, additionalParameters);
        parameters.putAll(requestParameters);
        if (oauthOperations.getVersion() == OAuth1Version.CORE_10) {
            parameters.setCallbackUrl(callbackUrl(request));
        }
        OAuthToken requestToken = fetchRequestToken(request, requestParameters, oauthOperations);
        sessionStrategy.setAttribute(request, OAUTH_TOKEN_ATTRIBUTE, requestToken);
        return buildOAuth1Url(oauthOperations, requestToken.getValue(), parameters);
    }

    private OAuth1Parameters getOAuth1Parameters(NativeWebRequest request, MultiValueMap<String, String> additionalParameters) {
        OAuth1Parameters parameters = new OAuth1Parameters(additionalParameters);
        parameters.putAll(getRequestParameters(request));
        return parameters;
    }

    private OAuthToken fetchRequestToken(NativeWebRequest request, MultiValueMap<String, String> requestParameters, OAuth1Operations oauthOperations) {
        if (oauthOperations.getVersion() == OAuth1Version.CORE_10_REVISION_A) {
            return oauthOperations.fetchRequestToken(callbackUrl(request), requestParameters);
        }
        return oauthOperations.fetchRequestToken(null, requestParameters);
    }

    private String buildOAuth2Url(OAuth2ConnectionFactory<?> connectionFactory, NativeWebRequest request, MultiValueMap<String, String> additionalParameters) {
        logger.info("Building URL for " + connectionFactory.getProviderId());
        OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        logger.info("oAuthOPerations: " + oauthOperations);
        String defaultScope = connectionFactory.getScope();
        logger.info("scope: " + defaultScope);
        OAuth2Parameters parameters = getOAuth2Parameters(request, defaultScope, additionalParameters);
        logger.info("parameters: " + parameters.toString());
        String state = connectionFactory.generateState();
        parameters.add("state", state);
        logger.info("state: " + state);
        sessionStrategy.setAttribute(request, OAUTH2_STATE_ATTRIBUTE, state);
        if (useAuthenticateUrl) {
            logger.info("Proccessing Authenticate URL");
            return oauthOperations.buildAuthenticateUrl(parameters);
        } else {
            logger.info("Processing Authorize URL");
            return oauthOperations.buildAuthorizeUrl(parameters);
        }
    }

    private OAuth2Parameters getOAuth2Parameters(NativeWebRequest request, String defaultScope, MultiValueMap<String, String> additionalParameters) {
        OAuth2Parameters parameters = new OAuth2Parameters(additionalParameters);
        parameters.putAll(getRequestParameters(request, "scope"));
        parameters.setRedirectUri(callbackUrl(request));
        String scope = request.getParameter("scope");
        if (scope != null) {
            parameters.setScope(scope);
        } else if (defaultScope != null) {
            parameters.setScope(defaultScope);
        }
        return parameters;
    }

    private String connectPath(HttpServletRequest request) {
        String pathInfo = request.getPathInfo();
        return request.getServletPath() + (pathInfo != null ? pathInfo : "");
    }

    private String buildOAuth1Url(OAuth1Operations oauthOperations, String requestToken, OAuth1Parameters parameters) {
        if (useAuthenticateUrl) {
            return oauthOperations.buildAuthenticateUrl(requestToken, parameters);
        } else {
            return oauthOperations.buildAuthorizeUrl(requestToken, parameters);
        }
    }

    private OAuthToken extractCachedRequestToken(WebRequest request) {
        OAuthToken requestToken = (OAuthToken) sessionStrategy.getAttribute(request, OAUTH_TOKEN_ATTRIBUTE);
        sessionStrategy.removeAttribute(request, OAUTH_TOKEN_ATTRIBUTE);
        return requestToken;
    }

    private String extractCachedOAuth2State(WebRequest request) {
        String state = (String) sessionStrategy.getAttribute(request, OAUTH2_STATE_ATTRIBUTE);
        sessionStrategy.removeAttribute(request, OAUTH2_STATE_ATTRIBUTE);
        return state;
    }

    private MultiValueMap<String, String> getRequestParameters(NativeWebRequest request, String... ignoredParameters) {
        List<String> ignoredParameterList = asList(ignoredParameters);
        MultiValueMap<String, String> convertedMap = new LinkedMultiValueMap<String, String>();
        for (Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
            if (!ignoredParameterList.contains(entry.getKey())) {
                convertedMap.put(entry.getKey(), asList(entry.getValue()));
            }
        }
        return convertedMap;
    }

    private static final String OAUTH_TOKEN_ATTRIBUTE = "oauthToken";

    private static final String OAUTH2_STATE_ATTRIBUTE = "oauth2State";

}
