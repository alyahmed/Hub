/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.social;

import ca.ahmedaly.config.annotation.WebController;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.social.connect.ConnectionKey;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.web.SignedRequestException;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ahmed
 */
@WebController
@RequestMapping("disconnect")
public class DisconnectController {
    
    @Autowired ConnectionRepository connectionRepository;
    
    
    @RequestMapping(value = "{providerId}", method = RequestMethod.POST)
    public String disConnect(@PathVariable("providerId") String providerId){
         connectionRepository.removeConnections(providerId);
         
         
         return "redirect:/";
    }
    
}
