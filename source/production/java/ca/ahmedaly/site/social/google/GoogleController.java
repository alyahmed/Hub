/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.social.google;

import ca.ahmedaly.config.annotation.WebController;
import java.security.Principal;
import javax.inject.Inject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.social.google.api.Google;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Simple Controller that provides use specific google information
 *
 * @author ahmed
 */
@WebController()
@RequestMapping("google")
public class GoogleController {

    private static final Logger log = LogManager.getLogger();

    @Inject
    private Google google;
    
    @RequestMapping(value = {"", "profile"}, method = RequestMethod.GET)
    public String showProfile(Principal currentUser, Model model) {
        model.addAttribute("profile", google.plusOperations().getGoogleProfile());
        return "google/profile";
    }
    
    @RequestMapping(value = "contacts", method = RequestMethod.GET)
    public String showContacts(Principal currentUser, Model model) {
        model.addAttribute("contacts", google.plusOperations().getGoogleProfile().getEmails());
        model.addAttribute("contacts", google.taskOperations().getTaskLists());
        return "google/contacts";
    }

    @RequestMapping(value = "calender", method = RequestMethod.GET)
    public String showCalender(Principal currentUser, Model model) {
        log.info("GET - /google/calender    Displaying Contacts for User: " + "[" + currentUser + "]");
        model.addAttribute("calender", google.plusOperations().getGoogleProfile().getEmails());
        return "google/calender";
    }


}
