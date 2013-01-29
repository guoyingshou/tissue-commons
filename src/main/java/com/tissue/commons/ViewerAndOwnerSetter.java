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

public class ViewerAndOwnerSetter {

    @Autowired
    protected UserService userService;

    @ModelAttribute("locale")
    public String setupLocale(Locale locale) {
        return locale.toString();
    }

    @ModelAttribute("viewer")
    public User prefetchViewer(@PathVariable("userId") String userId, Map model) {

        String viewerId = SecurityUtil.getViewerId();

        boolean invitable = userService.isInvitable(viewerId, userId);
        model.put("invitable", invitable);

        List<Topic> newTopics = userService.getNewTopics(viewerId, 10);
        model.put("newTopics", newTopics);

        User viewer = null;
        if(viewerId != null) {
            viewer = userService.getViewer(viewerId);
        }

        if((viewer != null) && userId.equals(viewerId)) {
            model.put("owner", viewer);
        }
        else {
            model.put("owner", userService.getUserById(userId));
        }

        return viewer;
    }

}
