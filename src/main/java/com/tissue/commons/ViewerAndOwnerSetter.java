package com.tissue.commons;

import com.tissue.core.social.User;
import com.tissue.commons.security.util.SecurityUtil;
import com.tissue.commons.social.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.Locale;
import java.util.Map;

public class ViewerAndOwnerSetter {

    @Autowired
    protected UserService userService;

    @ModelAttribute("locale")
    public String setupLocale(Locale locale) {
        return locale.toString();
    }

    @ModelAttribute("viewer")
    public User prefetchViewer(@PathVariable("userId") String userId, Map model) {
        User viewer = userService.getViewer(SecurityUtil.getViewerId());

        if(userId.equals(SecurityUtil.getViewerId())) {
            model.put("owner", viewer);
        }
        else {
            model.put("owner", userService.getUserById(userId));
        }

        if(SecurityUtil.getViewer() == null) {
            return null;    
        }

        return viewer;

        //return userService.getViewer(SecurityUtil.getViewerId());
    }

}
