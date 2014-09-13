package ca.ahmedaly.site;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ca.ahmedaly.config.annotation.WebController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.linkedin.api.LinkedIn;

@WebController()
@RequestMapping("home")
public class HomeController {

    private static final Logger log = LogManager.getLogger();

    Twitter twitter;
    Facebook facebook;
    LinkedIn linkedin;

    @Autowired
    public HomeController(Twitter twitter, Facebook facebook, LinkedIn linkedin) {
        // Set up API bindings
        this.twitter = twitter;
        this.facebook = facebook;
        this.linkedin = linkedin;
    }

    @RequestMapping(value = {"", "dashboard"}, method = RequestMethod.GET)
    public String showDashboard(Model model) {

        log.debug("GET /home/dashboard - Displaying Home dashboard");
        log.debug("Attaching Social media API bindings");

        model.addAttribute("twitterFriends", twitter.friendOperations().getFriends());
        model.addAttribute("twitterFollowers", twitter.friendOperations()
                .getFollowers());
        model.addAttribute("twitterTimeline", twitter.timelineOperations()
                .getHomeTimeline());
        
        model.addAttribute("facebookFeed", facebook.feedOperations().getFeed());
        return "home/dashboard";
    }

    @RequestMapping(value = {"twitter/tweet"}, method = RequestMethod.POST)
    public String postTweet(String message) {
        twitter.timelineOperations().updateStatus(message);
        return "redirect:/";

    }

}
