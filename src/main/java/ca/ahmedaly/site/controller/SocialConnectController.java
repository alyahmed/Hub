package ca.ahmedaly.site.controller;

import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import ca.ahmedaly.config.annotation.WebController;
import ca.ahmedaly.site.SocialConnectionHelper;
import ca.ahmedaly.site.social.ConnectionHelper;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.core.GenericTypeResolver;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactory;
import org.springframework.social.connect.ConnectionKey;
import org.springframework.social.connect.DuplicateConnectionException;
import org.springframework.social.connect.support.OAuth1ConnectionFactory;
import org.springframework.social.connect.support.OAuth2ConnectionFactory;
import org.springframework.social.connect.web.ConnectInterceptor;
import org.springframework.social.connect.web.ConnectSupport;
import org.springframework.social.connect.web.DisconnectInterceptor;
import org.springframework.social.connect.web.HttpSessionSessionStrategy;
import org.springframework.social.connect.web.SessionStrategy;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.UrlPathHelper;
import org.springframework.web.util.WebUtils;

@WebController()
@RequestMapping("/connect")
public class SocialConnectController implements InitializingBean {

    private final static Logger logger = LogManager.getLogger(SocialConnectController.class);

    private final ConnectionFactoryLocator connectionFactoryLocator;

    private final ConnectionRepository connectionRepository;

    private final MultiValueMap<Class<?>, ConnectInterceptor<?>> connectInterceptors = new LinkedMultiValueMap<Class<?>, ConnectInterceptor<?>>();

    private final MultiValueMap<Class<?>, DisconnectInterceptor<?>> disconnectInterceptors = new LinkedMultiValueMap<Class<?>, DisconnectInterceptor<?>>();

    private SocialConnectionHelper connectSupport;

    private final UrlPathHelper urlPathHelper = new UrlPathHelper();

    private String viewPath = "connect/";

    private SessionStrategy sessionStrategy = new HttpSessionSessionStrategy();

    @Inject
    public SocialConnectController(ConnectionFactoryLocator connectionFactoryLocator, ConnectionRepository connectionRepository) {
        this.connectionFactoryLocator = connectionFactoryLocator;
        this.connectionRepository = connectionRepository;
    }

    @Deprecated
    public void setInterceptors(List<ConnectInterceptor<?>> interceptors) {
        setConnectInterceptors(interceptors);
    }

    public void setConnectInterceptors(List<ConnectInterceptor<?>> interceptors) {
        for (ConnectInterceptor<?> interceptor : interceptors) {
            addInterceptor(interceptor);
        }
    }

    public void setDisconnectInterceptors(List<DisconnectInterceptor<?>> interceptors) {
        for (DisconnectInterceptor<?> interceptor : interceptors) {
            addDisconnectInterceptor(interceptor);
        }
    }

    public void setApplicationUrl(String applicationUrl) {
        connectSupport.setApplicationUrl(applicationUrl);
    }

    public void setViewPath(String viewPath) {
        this.viewPath = viewPath;
    }

    public void setSessionStrategy(SessionStrategy sessionStrategy) {
        this.sessionStrategy = sessionStrategy;
    }

    public void addInterceptor(ConnectInterceptor<?> interceptor) {
        Class<?> serviceApiType = GenericTypeResolver.resolveTypeArgument(interceptor.getClass(), ConnectInterceptor.class);
        connectInterceptors.add(serviceApiType, interceptor);
    }

    public void addDisconnectInterceptor(DisconnectInterceptor<?> interceptor) {
        Class<?> serviceApiType = GenericTypeResolver.resolveTypeArgument(interceptor.getClass(), DisconnectInterceptor.class);
        disconnectInterceptors.add(serviceApiType, interceptor);
    }

    @RequestMapping(method = RequestMethod.GET)
    public String connectionStatus(NativeWebRequest request, Model model) {
        setNoCache(request);
        processFlash(request, model);
        Map<String, List<Connection<?>>> connections = connectionRepository.findAllConnections();
        model.addAttribute("providerIds", connectionFactoryLocator.registeredProviderIds());
        model.addAttribute("connectionMap", connections);
        return connectView();
    }

    @RequestMapping(value = "/{providerId}", method = RequestMethod.GET)
    public String connectionStatus(@PathVariable String providerId, NativeWebRequest request, Model model) {
        logger.info("Page View /connect/" + providerId);
        setNoCache(request);
        processFlash(request, model);
        List<Connection<?>> connections = connectionRepository.findConnections(providerId);
        setNoCache(request);
        if (connections.isEmpty()) {
            return connectView(providerId);
        } else {
            model.addAttribute("connections", connections);
            return connectedView(providerId);
        }
    }

    @RequestMapping(value = "/{providerId}", method = RequestMethod.POST)
    public RedirectView connect(@PathVariable String providerId, NativeWebRequest request) {
        ConnectionFactory<?> connectionFactory = connectionFactoryLocator.getConnectionFactory(providerId);
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
        preConnect(connectionFactory, parameters, request);
        try {
            RedirectView authorizationUrl = new RedirectView(connectSupport.buildOAuthUrl(connectionFactory, request, parameters));
            return authorizationUrl;
        } catch (Exception e) {
            sessionStrategy.setAttribute(request, PROVIDER_ERROR_ATTRIBUTE, e);
            return connectionStatusRedirect(providerId, request);
        }
    }

    @RequestMapping(value = "/{providerId}", method = RequestMethod.GET, params = "oauth_token")
    public RedirectView oauth1Callback(@PathVariable String providerId, NativeWebRequest request) {
        try {
            OAuth1ConnectionFactory<?> connectionFactory = (OAuth1ConnectionFactory<?>) connectionFactoryLocator.getConnectionFactory(providerId);
            Connection<?> connection = connectSupport.completeConnection(connectionFactory, request);
            addConnection(connection, connectionFactory, request);
        } catch (Exception e) {
            sessionStrategy.setAttribute(request, PROVIDER_ERROR_ATTRIBUTE, e);
            logger.warn("Exception while handling OAuth1 callback (" + e.getMessage() + "). Redirecting to " + providerId + " connection status page.");
        }
        return connectionStatusRedirect(providerId, request);
    }

    @RequestMapping(value = "/{providerId}", method = RequestMethod.GET, params = "code")
    public RedirectView oauth2Callback(@PathVariable String providerId, NativeWebRequest request) {
        try {
            logger.info("Received code from: " + providerId);
            logger.info(request.getParameter("code"));
            logger.info(request.getParameterNames());
            OAuth2ConnectionFactory<?> connectionFactory = (OAuth2ConnectionFactory<?>) connectionFactoryLocator.getConnectionFactory(providerId);
            
            if (providerId.equals("instagram")) {
                Connection<?> connection = connectSupport.completeConnectionInstagram(connectionFactory, request);
                addConnection(connection, connectionFactory, request);
            } else {
                Connection<?> connection = connectSupport.completeConnection(connectionFactory, request);
                addConnection(connection, connectionFactory, request);
            }
        } catch (Exception e) {
            sessionStrategy.setAttribute(request, PROVIDER_ERROR_ATTRIBUTE, e);
            logger.warn("Exception while handling OAuth2 callback (" + e.getMessage() + "). Redirecting to " + providerId + " connection status page.");
        }
        return connectionStatusRedirect(providerId, request);
    }

    @RequestMapping(value = "/{providerId}", method = RequestMethod.GET, params = "error")
    public RedirectView oauth2ErrorCallback(@PathVariable String providerId,
            @RequestParam("error") String error,
            @RequestParam(value = "error_description", required = false) String errorDescription,
            @RequestParam(value = "error_uri", required = false) String errorUri,
            NativeWebRequest request) {
        Map<String, String> errorMap = new HashMap<String, String>();
        errorMap.put("error", error);
        if (errorDescription != null) {
            errorMap.put("errorDescription", errorDescription);
        }
        if (errorUri != null) {
            errorMap.put("errorUri", errorUri);
        }
        sessionStrategy.setAttribute(request, AUTHORIZATION_ERROR_ATTRIBUTE, errorMap);
        return connectionStatusRedirect(providerId, request);
    }

    @RequestMapping(value = "/{providerId}", method = RequestMethod.DELETE)
    public RedirectView removeConnections(@PathVariable String providerId, NativeWebRequest request) {
        ConnectionFactory<?> connectionFactory = connectionFactoryLocator.getConnectionFactory(providerId);
        preDisconnect(connectionFactory, request);
        connectionRepository.removeConnections(providerId);
        postDisconnect(connectionFactory, request);
        return connectionStatusRedirect(providerId, request);
    }

    @RequestMapping(value = "/{providerId}/{providerUserId}", method = RequestMethod.DELETE)
    public RedirectView removeConnection(@PathVariable String providerId, @PathVariable String providerUserId, NativeWebRequest request) {
        ConnectionFactory<?> connectionFactory = connectionFactoryLocator.getConnectionFactory(providerId);
        preDisconnect(connectionFactory, request);
        connectionRepository.removeConnection(new ConnectionKey(providerId, providerUserId));
        postDisconnect(connectionFactory, request);
        return connectionStatusRedirect(providerId, request);
    }

    protected String connectView() {
        return getViewPath() + "status";
    }

    protected String connectView(String providerId) {
        return getViewPath() + providerId + "Connect";
    }

    protected String connectedView(String providerId) {
        return getViewPath() + providerId + "Connected";
    }

    protected RedirectView connectionStatusRedirect(String providerId, NativeWebRequest request) {
        HttpServletRequest servletRequest = request.getNativeRequest(HttpServletRequest.class);
        String path = "/connect/" + providerId + getPathExtension(servletRequest);
        if (prependServletPath(servletRequest)) {
            path = servletRequest.getServletPath() + path;
        }
        return new RedirectView(path, true);
    }

    // From InitializingBean
    public void afterPropertiesSet() throws Exception {
        this.connectSupport = new SocialConnectionHelper(sessionStrategy);
    }

    // internal helpers
    private boolean prependServletPath(HttpServletRequest request) {
        return !this.urlPathHelper.getPathWithinServletMapping(request).equals("");
    }

    private String getPathExtension(HttpServletRequest request) {
        String fileName = WebUtils.extractFullFilenameFromUrlPath(request.getRequestURI());
        String extension = StringUtils.getFilenameExtension(fileName);
        return extension != null ? "." + extension : "";
    }

    private String getViewPath() {
        return viewPath;
    }

    private void addConnection(Connection<?> connection, ConnectionFactory<?> connectionFactory, WebRequest request) {
        try {
            connectionRepository.addConnection(connection);
            postConnect(connectionFactory, connection, request);
        } catch (DuplicateConnectionException e) {
            sessionStrategy.setAttribute(request, DUPLICATE_CONNECTION_ATTRIBUTE, e);
        }
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private void preConnect(ConnectionFactory<?> connectionFactory, MultiValueMap<String, String> parameters, WebRequest request) {
        for (ConnectInterceptor interceptor : interceptingConnectionsTo(connectionFactory)) {
            interceptor.preConnect(connectionFactory, parameters, request);
        }
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private void postConnect(ConnectionFactory<?> connectionFactory, Connection<?> connection, WebRequest request) {
        for (ConnectInterceptor interceptor : interceptingConnectionsTo(connectionFactory)) {
            interceptor.postConnect(connection, request);
        }
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private void preDisconnect(ConnectionFactory<?> connectionFactory, WebRequest request) {
        for (DisconnectInterceptor interceptor : interceptingDisconnectionsTo(connectionFactory)) {
            interceptor.preDisconnect(connectionFactory, request);
        }
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private void postDisconnect(ConnectionFactory<?> connectionFactory, WebRequest request) {
        for (DisconnectInterceptor interceptor : interceptingDisconnectionsTo(connectionFactory)) {
            interceptor.postDisconnect(connectionFactory, request);
        }
    }

    private List<ConnectInterceptor<?>> interceptingConnectionsTo(ConnectionFactory<?> connectionFactory) {
        Class<?> serviceType = GenericTypeResolver.resolveTypeArgument(connectionFactory.getClass(), ConnectionFactory.class);
        List<ConnectInterceptor<?>> typedInterceptors = connectInterceptors.get(serviceType);
        if (typedInterceptors == null) {
            typedInterceptors = Collections.emptyList();
        }
        return typedInterceptors;
    }

    private List<DisconnectInterceptor<?>> interceptingDisconnectionsTo(ConnectionFactory<?> connectionFactory) {
        Class<?> serviceType = GenericTypeResolver.resolveTypeArgument(connectionFactory.getClass(), ConnectionFactory.class);
        List<DisconnectInterceptor<?>> typedInterceptors = disconnectInterceptors.get(serviceType);
        if (typedInterceptors == null) {
            typedInterceptors = Collections.emptyList();
        }
        return typedInterceptors;
    }

    private void processFlash(WebRequest request, Model model) {
        convertSessionAttributeToModelAttribute(DUPLICATE_CONNECTION_ATTRIBUTE, request, model);
        convertSessionAttributeToModelAttribute(PROVIDER_ERROR_ATTRIBUTE, request, model);
        model.addAttribute(AUTHORIZATION_ERROR_ATTRIBUTE, sessionStrategy.getAttribute(request, AUTHORIZATION_ERROR_ATTRIBUTE));
        sessionStrategy.removeAttribute(request, AUTHORIZATION_ERROR_ATTRIBUTE);
    }

    private void convertSessionAttributeToModelAttribute(String attributeName, WebRequest request, Model model) {
        if (sessionStrategy.getAttribute(request, attributeName) != null) {
            model.addAttribute(attributeName, Boolean.TRUE);
            sessionStrategy.removeAttribute(request, attributeName);
        }
    }

    private void setNoCache(NativeWebRequest request) {
        HttpServletResponse response = request.getNativeResponse(HttpServletResponse.class);
        if (response != null) {
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 1L);
            response.setHeader("Cache-Control", "no-cache");
            response.addHeader("Cache-Control", "no-store");
        }
    }

    private static final String DUPLICATE_CONNECTION_ATTRIBUTE = "social_addConnection_duplicate";

    private static final String PROVIDER_ERROR_ATTRIBUTE = "social_provider_error";

    private static final String AUTHORIZATION_ERROR_ATTRIBUTE = "social_authorization_error";

}
