package ca.ahmedaly.site;

import ca.ahmedaly.config.annotation.WebController;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@WebController
public class IndexController
{
    @RequestMapping("/")
    public View index()
    {
        return new RedirectView("/connect", true, false);
    }
}
