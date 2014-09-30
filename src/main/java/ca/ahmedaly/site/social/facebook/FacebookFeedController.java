/*
 * Copyright 2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package ca.ahmedaly.site.social.facebook;


import org.springframework.social.facebook.api.Facebook;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ca.ahmedaly.config.annotation.WebController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;

@WebController
public class FacebookFeedController {

    @Autowired
    private ConnectionRepository connectionRepository;

    @RequestMapping(value = "/facebook/feed", method = RequestMethod.GET)
    public String showFeed(Model model) {
        Connection<Facebook> connection = connectionRepository.findPrimaryConnection(Facebook.class);
        model.addAttribute("feed", connection.getApi().feedOperations().getFeed());
        model.addAttribute("timeline", connection.getApi().feedOperations().getHomeFeed());
        model.addAttribute("api", connection.getApi());
        return "facebook/feed";
    }

    @RequestMapping(value = "/facebook/feed", method = RequestMethod.POST)
    public String postUpdate(String message) {
        return "redirect:/facebook/feed";
    }

}
