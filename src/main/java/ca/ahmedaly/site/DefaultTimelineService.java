/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site;

import ca.ahmedaly.exception.NoUserConnectionsException;
import java.util.ArrayList;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.twitter.api.Tweet;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.stereotype.Service;

/**
 * Implementation responsible for providing controllers with packaged content regarding each users Social accounts.
 * @author ahmed
 */
@Service
public class DefaultTimelineService implements TimelineService {
    
    
    private static final Logger LOG = LogManager.getLogger(DefaultTimelineService.class);
    
    
    @Override
    public List<TimelineNode> getNodes(ConnectionRepository repository) throws NoUserConnectionsException {
        
        LOG.info("Checking Connections status " + emptyConnections(repository));
        if (emptyConnections(repository)) {
            LOG.debug("No Users Connection Found - Empty Connections Repository");
            throw new NoUserConnectionsException("No social accounts attached");
        }
        
        List<Tweet> homeTimeline = repository.findPrimaryConnection(Twitter.class).getApi().timelineOperations().getHomeTimeline();
        List<TimelineNode> nodes = extractContent(homeTimeline);
        return nodes;
    }
    
    
    private boolean emptyConnections(ConnectionRepository repository){
        
        if (repository.findAllConnections().isEmpty()){
            LOG.debug("No Connections Found for User");
            return true;
        }
        return false;
    }
    
    
    private List<TimelineNode> extractContent(List<Tweet> tweets){
        List<TimelineNode> nodes = new ArrayList<>();
        for (Tweet tweet : tweets) {
            TimelineNode node =
                    new TwitterTimelineNode("Tweet by: " + tweet.getFromUser(), tweet.getText(), tweet.getCreatedAt().toString());
            nodes.add(node);
        }
        LOG.info("Serving TimelineNodes to TimelineController for User: " + SecurityContextHolder.getContext().getAuthentication());
        return nodes;
    }
    
    
}
