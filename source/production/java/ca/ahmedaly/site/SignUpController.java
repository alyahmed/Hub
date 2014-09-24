package ca.ahmedaly.site;

import java.util.Map;

import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import ca.ahmedaly.config.annotation.WebController;
import ca.ahmedaly.site.entities.UserPrincipal;
import ca.ahmedaly.site.util.RegistrationUtil;
import org.springframework.web.servlet.view.RedirectView;

@WebController()
@SessionAttributes("signUpForm")
public class SignUpController {

    private static final Logger log = LogManager.getLogger(SignUpController.class);

    UserService userService;

    @Autowired
    public SignUpController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = {"/signup"}, method = RequestMethod.GET)
    public ModelAndView showSignUpForm(WebRequest request, Map<String, Object> model) {

        log.info("GET /signup ----------- Placing new SignUpForm Object in model");
        model.put("signUpForm", new SignUpForm());

        return new ModelAndView("/signUpForm", model);
    }

    @RequestMapping(value = {"/signup"}, method = RequestMethod.POST)
    public ModelAndView registerUser(@Valid @ModelAttribute("signUpForm") SignUpForm signUpForm,
            BindingResult result,
            WebRequest request) {

        if (SecurityContextHolder.getContext().getAuthentication() instanceof UserPrincipal) {
            return new ModelAndView(new RedirectView("/connect", true, false));
        }

        if (result.hasErrors()) {
            log.info("Errors in result: " + result);
            return new ModelAndView("/signup");
        }

        UserPrincipal user = RegistrationUtil.createUser(signUpForm);

        log.info("POST /signup --------- processing user: " + user);
        if (user == null) {
            log.debug("User is null: " + user);
            return new ModelAndView("/signup");
        }

        userService.saveUserAndAuthenticate(user, signUpForm.getPassword());

        log.info("Saving User: " + user);
        log.info("Current Authentication: " + SecurityContextHolder.getContext().getAuthentication());
        log.info("Allowing user into the application");
        return new ModelAndView("/connect");

    }

}
