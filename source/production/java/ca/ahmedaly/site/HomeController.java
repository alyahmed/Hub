package ca.ahmedaly.site;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ca.ahmedaly.config.annotation.WebController;
import ca.ahmedaly.site.social.twitter.TweetForm;

@WebController()
@RequestMapping("home")
public class HomeController {

	private static final Logger log = LogManager.getLogger();

	Twitter twitter;
	Facebook facebook;

	@Autowired
	public HomeController(Twitter twitter, Facebook facebook) {
		this.twitter = twitter;
		this.facebook = facebook;
	}

	@RequestMapping(value = { "", "dashboard" }, method = RequestMethod.GET)
	public String showDashboard(Model model) {
		
		log.debug("GET /home/dashboard - Displaying Home dashboard");
		log.debug("Attaching Social media API bindings");
		model.addAttribute("friends", twitter.friendOperations().getFriends());
		model.addAttribute("followers", twitter.friendOperations()
				.getFollowers());
		model.addAttribute("timeline", twitter.timelineOperations()
				.getHomeTimeline());
		return "home/dashboard";
	}

	@RequestMapping(value = { "twitter/tweet" }, method = RequestMethod.POST)
	public String postTweet(String message) {
		twitter.timelineOperations().updateStatus(message);
		return "redirect:/";

	}

}
