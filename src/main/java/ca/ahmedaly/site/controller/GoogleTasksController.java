/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.controller;

import ca.ahmedaly.config.annotation.WebController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.tasks.TaskListsPage;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ahmed
 */
@WebController
@RequestMapping("/google/tasks")
public class GoogleTasksController {

    private final Google google;
    
    @Autowired
    public GoogleTasksController(Google google) {
        this.google = google;
    }

    @RequestMapping(value = "/list", method = GET)
    public String getTaskLists(@RequestParam(required = false) String pageToken, Model model) {
        TaskListsPage taskLists = google.taskOperations().getTaskLists(pageToken);
        model.addAttribute("tasks", taskLists);
        return "google/tasks/list";
    }
}
