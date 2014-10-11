package ca.ahmedaly.site.controller;

import ca.ahmedaly.config.annotation.WebController;
import static org.springframework.web.bind.annotation.RequestMethod.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.plus.ActivitiesPage;
import org.springframework.social.google.api.plus.Activity;
import org.springframework.social.google.api.plus.ActivityCommentsPage;
import org.springframework.social.google.api.plus.PeoplePage;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.moments.Moment;
import org.springframework.social.google.api.plus.moments.MomentsPage;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;

@WebController
@RequestMapping(value="/google/plus", method=GET)
public class GooglePlusController {

	private final Google google;
	
	@Autowired
	public GooglePlusController(Google google) {
		this.google = google;
	}
        
        @RequestMapping(method = RequestMethod.GET)
        public String googleHome(){
            return "google/home";
        }
        
        
	@ResponseBody
	@RequestMapping("/people")
	public PeoplePage searchPeople(String query, @RequestParam(required=false) String pageToken) {
		return google.plusOperations().searchPeople(query, pageToken);
	}
	
	@ResponseBody
	@RequestMapping("/people/{id}")
	public Person getPerson(@PathVariable String id) {
		return google.plusOperations().getPerson(id);
	}
	
	@ResponseBody
	@RequestMapping("/people/{id}/circles")
	public PeoplePage getCircles(@PathVariable String id, @RequestParam(required=false) String pageToken) {
		return google.plusOperations().getPeopleInCircles(id, pageToken);
	}
	
	@ResponseBody
	@RequestMapping("/people/{activityId}/plusoners")
	public PeoplePage getPlusOners(@PathVariable String activityId, @RequestParam(required=false) String pageToken) {
		return google.plusOperations().getActivityPlusOners(activityId, pageToken);
	}
	
	@ResponseBody
	@RequestMapping("/people/{activityId}/resharers")
	public PeoplePage getResharers(@PathVariable String activityId, @RequestParam(required=false) String pageToken) {
		return google.plusOperations().getActivityResharers(activityId, pageToken);
	}
	
	@ResponseBody
	@RequestMapping("/activities/search")
	public ActivitiesPage searchPublicActivities(String query, @RequestParam(required=false) String pageToken) {
		return google.plusOperations().searchPublicActivities(query, pageToken);
	}
	
	@ResponseBody
	@RequestMapping("/activities/list/{profileId}")
	public ActivitiesPage getActivities(@PathVariable String profileId, String pageToken) {
		return google.plusOperations().getActivities(profileId, pageToken);
	}
	
	@ResponseBody
	@RequestMapping("/activities/{id}")
	public Activity getActivity(@PathVariable String id) {
		return google.plusOperations().getActivity(id);
	}
	
	@ResponseBody
	@RequestMapping("/activities/{activityId}/comments")
	public ActivityCommentsPage getComments(@PathVariable String activityId, @RequestParam(required=false) String pageToken) {
		return google.plusOperations().getComments(activityId, pageToken);
	}
	
	@ResponseBody
	@RequestMapping("/moments/list")
	public MomentsPage listMoments(String pageToken) {
		return google.plusOperations().getMoments(pageToken);
	}
	
	@ResponseBody
	@RequestMapping(value="/moments/insert", method=POST)
	public Moment insertMoment(@RequestBody Moment moment) {
		return google.plusOperations().insertMoment(moment);
	}
	
	@ResponseBody
	@RequestMapping(value="/moments/delete", method=POST)
	public void deleteMoment(@RequestBody String id) {
		try{
		google.plusOperations().deleteMoment(id);
		}catch(HttpClientErrorException e) {
			System.out.println(e.getResponseBodyAsString());
		}
	}
}
