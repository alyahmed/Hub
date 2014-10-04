package ca.ahmedaly.site.social;

import ca.ahmedaly.config.annotation.WebController;
import ca.ahmedaly.exception.NoUserConnectionsException;
import ca.ahmedaly.site.TimelineNode;
import ca.ahmedaly.site.TimelineService;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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
    
    private static final Logger LOG = LogManager.getLogger(TimelineController.class);

    @Autowired
    ConnectionRepository repository;
    
    @Autowired
    TimelineService timelineService;
    
    @RequestMapping(value = {""}, method = RequestMethod.GET)
    public String showTimeline(Model model) {
        
        try {
            LOG.info("Getting Nodes from TimlineService");
            List<TimelineNode> nodes = timelineService.getNodes(repository);
            LOG.info("Added Nodes " + nodes.toString() + " to model");
            model.addAttribute("nodes", nodes);
                
        } catch (NoUserConnectionsException e) {
            model.addAttribute("connectionsEmpty", true);
            LOG.info("No active User Connections found");
        }
        return "timeline/timeline";
        
    }

}
