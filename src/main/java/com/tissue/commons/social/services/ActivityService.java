package com.tissue.commons.social.services;

import com.tissue.core.social.Activity;
import com.tissue.core.social.dao.ActivityDao;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Component
public class ActivityService {

    @Autowired
    private ActivityDao activityDao;

    /**
    public List<Activity> getWatchedActivities(String userId, int num) {
        return activityDao.getWatchedActivities(userId, num);
    }

    public List<Activity> getUserActivities(String userId, int num) {
        return activityDao.getUserActivities(userId, num);
    }

    public List<Activity> getActivitiesForNewUser(int num) {
        return activityDao.getActivitiesForNewUser(num);
    }

    public List<Activity> getActivities(int num) {
        return activityDao.getActivities(num);
    }
    */

}
