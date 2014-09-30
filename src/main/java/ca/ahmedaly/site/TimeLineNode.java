/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site;

import java.util.logging.Logger;

/**
 * Simple Class that represents a node on a user's Social Timeline.
 * @author ahmed
 */
public class TimeLineNode {
   
    private static final Logger LOG = Logger.getLogger(TimeLineNode.class.getName());
    /**
     *
     */
    protected String Title;

    /**
     *
     */
    protected String date;

    /**
     *
     */
    protected String time;

    /**
     *
     */
    protected String Content;

    /**
     *
     */
    protected String providerId;

    /**
     *
     * @return
     */
    public String getTitle() {
        return Title;
    }

    /**
     *
     * @param Title
     */
    public void setTitle(String Title) {
        this.Title = Title;
    }

    /**
     *
     * @return
     */
    public String getDate() {
        return date;
    }

    /**
     *
     * @param date
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     *
     * @return
     */
    public String getTime() {
        return time;
    }

    /**
     *
     * @param time
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     *
     * @return
     */
    public String getContent() {
        return Content;
    }

    /**
     *
     * @param Content
     */
    public void setContent(String Content) {
        this.Content = Content;
    }

    /**
     *
     * @return
     */
    public String getProviderId() {
        return providerId;
    }

    /**
     *
     * @param providerId
     */
    public void setProviderId(String providerId) {
        this.providerId = providerId;
    }
   
   
   
}
