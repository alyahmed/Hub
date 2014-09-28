package ca.ahmedaly.site;

import ca.ahmedaly.config.annotation.WebController;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.authentication.AnonymousAuthenticationToken;

/**
 *
 * @author ahmed Simple Controller for authenticating user information.
 */
@WebController
public class AuthenticationController {

    private static final Logger log = LogManager.getLogger(AuthenticationController.class);

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView login(Map<String, Object> model) {
        if (!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
            log.info("User is already logged in, redirecting to homepag");
            return new ModelAndView(new RedirectView("/connect", true, false));
        }
        model.put("loginForm", new LoginForm());
        log.info("Authentication Controller: " + SecurityContextHolder.getContext().getAuthentication().getName());
        log.info("Authentication Controller: " + SecurityContextHolder.getContext().getAuthentication().getPrincipal());

        return new ModelAndView("login", model);
    }

    public static class LoginForm {

        private String username;
        private String password;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }
    }

}
