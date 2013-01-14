package com.tissue.commons;

import com.tissue.core.social.User;
import com.tissue.commons.security.util.SecurityUtil;
import com.tissue.commons.social.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import java.util.Locale;
import java.util.Map;

public class ViewerSetter {

    @Autowired
    protected UserService userService;

    @ModelAttribute("locale")
    public String setupLocale(Locale locale) {
        return locale.toString();
    }

    @ModelAttribute("viewer")
    public User prefetchViewer() {
        if(SecurityUtil.getViewer() == null) {
            return null;    
        }
        return userService.getUserById(SecurityUtil.getViewerId(), true);
    }

}
