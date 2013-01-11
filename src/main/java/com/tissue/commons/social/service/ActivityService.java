package com.tissue.commons.social.service;

import com.tissue.core.social.Activity;
import com.tissue.core.social.dao.ActivityDao;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Component
public class ActivityService {

    @Autowired
    private ActivityDao activityDao;

    public List<Activity> getFriendsActivities(String userId, int num) {
        return activityDao.getFriendsActivities(userId, num);
    }

    public List<Activity> getUserActivities(String userId, int num) {
        return activityDao.getUserActivities(userId, num);
    }

    /**
    public List<Event> getLatestEvents(int num) {
        return eventDao.getLatestEvents(num);
    }
    */

}
