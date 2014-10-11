/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.controller;

import ca.ahmedaly.config.annotation.WebController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.web.ProviderSignInController;
import org.springframework.social.connect.web.SignInAdapter;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author ahmedaly
 */
@WebController("/signin")
public class SocialProviderSignInController extends ProviderSignInController {
    
    @Autowired
    public SocialProviderSignInController(ConnectionFactoryLocator connectionFactoryLocator, UsersConnectionRepository usersConnectionRepository, SignInAdapter signInAdapter) {
        super(connectionFactoryLocator, usersConnectionRepository, signInAdapter);
    }
    
}
