package ca.ahmedaly.site.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ca.ahmedaly.config.annotation.WebController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.ConnectionRepository;

@WebController()
@RequestMapping("home")
public class HomeController {

    private static final Logger log = LogManager.getLogger();
    
    @Autowired ConnectionRepository ConnectionRepository;
    
    @RequestMapping(value = {"", "dashboard"}, method = RequestMethod.GET)
    public String showDashboard(Model model) {
        log.debug("GET /home/dashboard - Displaying Home dashboard");
        log.debug("Attaching Social Media ConnectionRepository instance");
        model.addAttribute("connectionMap", ConnectionRepository.findAllConnections());
        return "home/dashboard";
    }

}
