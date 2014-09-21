/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site;

import java.util.List;
import org.springframework.social.connect.Connection;
import org.springframework.util.MultiValueMap;

/**
 *
 * @author ahmed
 */
public interface ConnectionService {
    
    public MultiValueMap<String, Connection<?>> findAllConnections();
    
    public List<Connection<?>> findConnections(String providerId);
    
    
    
}
