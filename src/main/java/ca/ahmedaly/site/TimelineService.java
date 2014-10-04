/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site;

import ca.ahmedaly.exception.NoUserConnectionsException;
import java.util.List;
import org.springframework.social.connect.ConnectionRepository;

/**
 *
 * @author ahmed
 */

public interface TimelineService {
    
   public List<TimelineNode> getNodes(ConnectionRepository connectionRepository) throws NoUserConnectionsException;
   
}
