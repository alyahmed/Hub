/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.linkedin;

import ca.ahmedaly.config.annotation.WebController;
import java.security.Principal;
import javax.inject.Inject;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.linkedin.api.LinkedIn;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ahmed
 */
@WebController

public class LinkedinProfileController {

    @Inject
    private ConnectionRepository connectionRepository;

    @RequestMapping(value = "/linkedin", method = RequestMethod.GET)
    public String home(Principal currentUser, Model model) {
        Connection<LinkedIn> connection = connectionRepository.findPrimaryConnection(LinkedIn.class);
        if (connection == null) {
            return "redirect:/connect/linkedin";
        }
        model.addAttribute("profile", connection.getApi().profileOperations().getUserProfileFull());
        model.addAttribute("skills", connection.getApi().profileOperations().getUserProfileFull().getSkills());
        model.addAttribute("connections", connection.getApi().connectionOperations().getConnections());
        
        return "linkedin/profile";
    }
}
