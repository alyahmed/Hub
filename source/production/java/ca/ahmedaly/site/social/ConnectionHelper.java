/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.social;

import java.util.Map;
import org.springframework.social.connect.Connection;

/**
 * Finds and returns all active connections back to the controller to avoid null pointer errors.
 * @author ahmed
 */
public  class ConnectionHelper {
    
    
    public static void getActiveConnections(Map<String, Connection<?>> connections)
    {
        connections.size();
        
        
    }
    
    private boolean isNullConnection(Connection connection)
    {
        return true;
    }
    
}
