/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site;

/**
 *
 * @author ahmedaly
 */
public class InstagramTimelineNode extends TimelineNode {

    public InstagramTimelineNode(String title, String content, String dateCreated) {
        setContent(content);
        setDateCreated(dateCreated);
        setTitle(title);
        setProviderId("instagram");
    }

}
