package ca.ahmedaly.site.social;

import ca.ahmedaly.config.annotation.WebController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
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

        Connection<Facebook> connection3 = repository.findPrimaryConnection(Facebook.class);
        if (connection3 != null) {
            model.addAttribute("facebook", connection3);
        }
        
        if(connection == null && connection2 == null && connection3 == null)
            model.addAttribute("connectionsEmpty", true);
        
        model.addAttribute("connections", repository.findAllConnections());
        return "timeline/timeline";
    }

}
