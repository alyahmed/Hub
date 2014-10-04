package ca.ahmedaly.site.social.twitter;

import javax.inject.Inject;

import org.springframework.social.twitter.api.Twitter;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ca.ahmedaly.config.annotation.WebController;

@WebController
public class TwitterFriendsController {

	private final Twitter twitter;
	
	@Inject
	public TwitterFriendsController(Twitter twitter) {
		this.twitter = twitter;
	}
	
	@RequestMapping(value="/twitter/friends", method=RequestMethod.GET)
	public String friends(Model model) {
		model.addAttribute("profiles", twitter.friendOperations().getFriends());
		return "twitter/friends";
	}

	@RequestMapping(value="/twitter/followers", method=RequestMethod.GET)
	public String followers(Model model) {
		model.addAttribute("profiles", twitter.friendOperations().getFollowers());
		return "twitter/friends";
	}
	
	
}
