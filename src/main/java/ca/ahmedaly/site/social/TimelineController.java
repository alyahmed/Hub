package ca.ahmedaly.site.social;

import ca.ahmedaly.config.annotation.WebController;
import ca.ahmedaly.exception.NoUserConnectionsException;
import ca.ahmedaly.site.TimeLineNode;
import ca.ahmedaly.site.TimelineService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.ConnectionRepository;
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
    
    @Autowired
    TimelineService timelineService;
    
    
    @RequestMapping(value = {""}, method = RequestMethod.GET)
    public String showTimeline(Model model) {
        
        try {
            List<TimeLineNode> nodes = timelineService.getNodes();
            model.addAttribute("nodes", nodes);
            
        } catch (NoUserConnectionsException e) {
            model.addAttribute("connectionsEmpty", true);
        }
        return "timeline/timeline";
        
    }

}
