/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.social;

import ca.ahmedaly.config.annotation.WebController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.google.api.Google;
import org.springframework.social.linkedin.api.LinkedIn;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ahmed
 */
@WebController()
@RequestMapping("timeline")
public class TimelineController {

    @Autowired
    ConnectionRepository repository;

    @RequestMapping(value = {""}, method = RequestMethod.GET)
    public String showTimeline(Model model) {

        /*
         Works but is extremely ugly.
         The point is to catch null API bindings here before they make it to the view.
                        
        
         TODO: Refactor this out to a helper method (ConnectionHelper)
        
         */
        model.addAttribute("connectionMap", repository.findAllConnections());
        Connection<Twitter> connection = repository
                .findPrimaryConnection(Twitter.class);
        if (connection != null) {
            model.addAttribute("twitterTimeline", connection.getApi().timelineOperations().getHomeTimeline());
        }

        Connection<LinkedIn> connection2 = repository.findPrimaryConnection(LinkedIn.class);
        if (connection2 != null) {
            model.addAttribute("linkedin", connection2);
        }

        Connection<Google> connection3 = repository.findPrimaryConnection(Google.class);
        if (connection3 != null) {
            model.addAttribute("googleTasks", connection3.getApi().taskOperations().getTaskLists().getItems().get(0));
        }

        Connection<Facebook> connection4 = repository.findPrimaryConnection(Facebook.class);
        if (connection4 != null) {
            model.addAttribute("facebook", connection4);
        }
        return "timeline/timeline";
    }

}
