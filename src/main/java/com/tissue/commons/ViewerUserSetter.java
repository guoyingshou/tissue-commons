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

public class ViewerUserSetter {

    @Autowired
    protected UserService userService;

    @ModelAttribute("locale")
    public String setupLocale(Locale locale) {
        return locale.toString();
    }

    @ModelAttribute("viewer")
    public User initViewer(Map model) {
        String viewerId = SecurityUtil.getViewerId();
        if(viewerId == null) {
            return null;    
        }
        return userService.getViewer(viewerId);
    }

    @ModelAttribute("users")
    public List<User> initUsers() {
        String viewerId = SecurityUtil.getViewerId();
        return userService.getNewUsers(viewerId, 15);
    }

}
