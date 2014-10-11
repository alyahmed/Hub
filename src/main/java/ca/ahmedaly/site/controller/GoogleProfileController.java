/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.controller;

import ca.ahmedaly.config.annotation.WebController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.api.Google;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ahmed
 */
@WebController
@RequestMapping("/google")
public class GoogleProfileController {
    @Autowired Google google;
    
    
    @RequestMapping(method = RequestMethod.GET)
    public String showProfile(Model model){
        model.addAttribute("profile", google.plusOperations().getGoogleProfile());
        return "google/profile";
    }
    
}
