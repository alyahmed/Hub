package ca.ahmedaly.site;

import ca.ahmedaly.config.annotation.WebController;
import ca.ahmedaly.site.entities.UserPrincipal;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.Map;

@WebController
public class AuthenticationController
{
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView login(Map<String, Object> model)
    {
        if(SecurityContextHolder.getContext().getAuthentication() instanceof
                UserPrincipal)
            return new ModelAndView(new RedirectView("/connect", true, false));

        model.put("loginForm", new LoginForm());
        return new ModelAndView("login");
    }

    public static class LoginForm
    {
        private String username;
        private String password;

        public String getUsername()
        {
            return username;
        }

        public void setUsername(String username)
        {
            this.username = username;
        }

        public String getPassword()
        {
            return password;
        }

        public void setPassword(String password)
        {
            this.password = password;
        }
    }
}
