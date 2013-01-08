package com.tissue.commons.service;

import com.tissue.domain.social.Activity;
import com.tissue.commons.dao.social.ActivityDao;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Component
public class ActivityService {

    @Autowired
    private ActivityDao activityDao;

    public List<Activity> getTopicRelatedActivities(String userId, int num) {
        return activityDao.getTopicRelatedActivities(userId, num);
    }

    /**
    public List<Event> getFriendsEvents(String userId, int num) {
        return eventDao.getFriendsEvents(userId, num);
    }

    public List<Event> getLatestEvents(int num) {
        return eventDao.getLatestEvents(num);
    }

    public void test(String tid) {
        eventDao.test(tid);
    }
    */

}