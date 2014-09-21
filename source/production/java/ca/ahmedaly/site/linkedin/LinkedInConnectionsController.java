/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.linkedin;

import ca.ahmedaly.config.annotation.WebController;
import javax.inject.Inject;
import org.springframework.social.linkedin.api.LinkedIn;
import org.springframework.social.linkedin.api.NetworkStatistics;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ahmed
 */
@WebController
public class LinkedInConnectionsController {
    private LinkedIn linkedIn;

	@Inject
	public LinkedInConnectionsController(LinkedIn linkedIn) {
		this.linkedIn = linkedIn;
	}
		
	@RequestMapping(value="/linkedin/connections", method=RequestMethod.GET)
	public String connections(Model model) {
		NetworkStatistics statistics = linkedIn.connectionOperations().getNetworkStatistics();
		model.addAttribute("firstDegreeCount", statistics.getFirstDegreeCount());
		model.addAttribute("secondDegreeCount", statistics.getSecondDegreeCount());
		model.addAttribute("connections", linkedIn.connectionOperations().getConnections());
		return "linkedin/connections";
	}
}
