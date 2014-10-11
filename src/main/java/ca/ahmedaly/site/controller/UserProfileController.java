/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.controller;

import ca.ahmedaly.config.annotation.WebController;
import ca.ahmedaly.site.ConnectionService;
import ca.ahmedaly.site.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
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
    
    @Autowired ConnectionService connectionService;
    
    @Autowired UserService userService;
    
    
    @RequestMapping(value = {"", "profile"}, method = RequestMethod.GET)
    public String showProfile(Model model){
        log.debug("GET /user/profile - Returning User Profile View Page");
        return "user/profile";
    }
    
    @RequestMapping(value ="settings", method = RequestMethod.GET)
    public String showSettings(Model model){
        log.debug("GET /user/settings - Returning Social Configuration Settings");
        MultiValueMap<String, Connection<?>> connectionMap = connectionService.findAllConnections();
        model.addAttribute("connectionMap", connectionMap);
        return "user/settings";
    }
    
    
    
}
