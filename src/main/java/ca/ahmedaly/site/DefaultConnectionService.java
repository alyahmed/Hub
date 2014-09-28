/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;

/**
 *
 * @author ahmed
 */
@Service
public class DefaultConnectionService implements ConnectionService{
    
    @Autowired ConnectionRepository connectionRepository;

    @Override
    public MultiValueMap<String, Connection<?>> findAllConnections() {
        return connectionRepository.findAllConnections();
    }

    @Override
    public List<Connection<?>> findConnections(String providerId) {
        return connectionRepository.findConnections(providerId);
    }
    
}
