/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site;

import ca.ahmedaly.exception.NoUserConnectionsException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.google.api.Google;
import org.springframework.social.linkedin.api.LinkedIn;
import org.springframework.social.twitter.api.Tweet;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.stereotype.Service;

/**
 * Implementation responsible for providing controllers with packaged content regarding each users Social accounts.
 * @author ahmed
 */
@Service
public class DefaultTimelineService implements TimelineService{
    
    @Autowired ConnectionRepository ConnectionRepository;
    @Autowired Google google;
    @Autowired Twitter twitter;
    @Autowired Facebook facebook;
    @Autowired LinkedIn linkedin;
    
    
    @Override
    public List<TimeLineNode> getNodes() throws NoUserConnectionsException {
        
        if (emptyConnections()) throw new NoUserConnectionsException("No social accounts attached");
        
        List<Tweet> homeTimeline = twitter.timelineOperations().getHomeTimeline(10);
        
        List<TimeLineNode> nodes = extractContent(homeTimeline);
        
        return nodes;
    }
    
    
    private boolean emptyConnections(){
        if (google == null && twitter == null & facebook == null & linkedin == null){
            return true;
        }
        return false;
    }
    
    
    private List<TimeLineNode> extractContent(List<Tweet> tweets){
        List<TimeLineNode> nodes = new ArrayList<>();
        for (Tweet tweet : tweets) {
            TimeLineNode node = new TimeLineNode();
            node.setProviderId("twitter");
            node.setContent(tweet.getText());
            node.setTime(tweet.getCreatedAt().toString());
            nodes.add(node);
        }
        return nodes;
    }
    
    
}
