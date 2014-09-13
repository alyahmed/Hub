/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site;

import ca.ahmedaly.config.annotation.WebController;
import javax.inject.Inject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ahmed
 */
@WebController()
@RequestMapping("user")
public class UserProfileController {

    private static final Logger log = LogManager.getLogger();
    
    @Inject UserService userService;
    
    
    @RequestMapping(value = {"", "profile"}, method = RequestMethod.GET)
    public String showProfile(Model model){
        
        log.debug("GET /user/profile - Returning User Profile View Page");
        return "user/profile";
    }
    
    
    
}
