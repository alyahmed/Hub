/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site;

import java.util.logging.Logger;

/**
 * Simple Class that represents a node on a user's Social Timeline.
 *
 * @author ahmed
 */
public class FacebookTimelineNode extends TimelineNode implements FacebookNode {

    public FacebookTimelineNode(String title, String content, String dateCreated) {
        setContent(content);
        setDateCreated(dateCreated);
        setTitle(title);
        setProviderId("facebook");
    }
}
