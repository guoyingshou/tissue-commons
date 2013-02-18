package com.tissue.commons;

import com.tissue.core.social.User;
import com.tissue.core.plan.Topic;
import com.tissue.commons.security.util.SecurityUtil;
import com.tissue.commons.social.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.Locale;
import java.util.Map;
import java.util.List;

public class ViewerOwnerTopicSetter {

    @Autowired
    protected UserService userService;

    @ModelAttribute("locale")
    public String setupLocale(Locale locale) {
        return locale.toString();
    }

    @ModelAttribute("viewer")
    public User initViewer(@PathVariable("userId") String userId, Map model) {

        boolean invitable = false;

        String viewerId = SecurityUtil.getViewerId();
        User viewer = null;
        User owner = null;
        if(viewerId != null) {
            viewer = userService.getViewer(viewerId);
            if(userId.equals(viewerId)) {
                owner = viewer;
            }
            else {
                owner = userService.getUserById("#"+userId);
                invitable = userService.isInvitable(viewerId, "#"+userId);
            }
        }
        else {
            owner = userService.getUserById("#"+userId);
        }

        model.put("viewer", viewer);
        model.put("owner", owner);
        model.put("invitable", invitable);

        return viewer;
    }

    @ModelAttribute("newTopics")
    public List<Topic> initTopics(Map model) {
        String viewerId = SecurityUtil.getViewerId();
        return userService.getNewTopics(viewerId, 10);
    }
}
