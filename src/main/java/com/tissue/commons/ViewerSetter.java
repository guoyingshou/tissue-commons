package com.tissue.commons;

import com.tissue.core.social.User;
import com.tissue.core.plan.Topic;
import com.tissue.commons.security.util.SecurityUtil;
import com.tissue.commons.social.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import java.util.Locale;
import java.util.Map;
import java.util.List;

public class ViewerSetter {

    @Autowired
    protected UserService userService;

    @ModelAttribute("locale")
    public String setupLocale(Locale locale) {
        return locale.toString();
    }

    @ModelAttribute("viewer")
    public User prefetchViewer(Map model) {
        String viewerId = SecurityUtil.getViewerId();
        List<Topic> newTopics = userService.getNewTopics(viewerId, 10);
        model.put("newTopics", newTopics);

        if(viewerId == null) {
            return null;    
        }
        return userService.getViewer(viewerId);
    }

}
