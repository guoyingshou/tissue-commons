package com.tissue.commons.service;

import com.tissue.domain.social.Event;
import com.tissue.commons.dao.social.EventDao;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Component
public class EventService {

    @Autowired
    private EventDao eventDao;

    public List<Event> getTopicRelatedEvents(String userId, int num) {
        return eventDao.getTopicRelatedEvents(userId, num);
    }

    public List<Event> getFriendsEvents(String userId, int num) {
        return eventDao.getFriendsEvents(userId, num);
    }

    public List<Event> getLatestEvents(int num) {
        return eventDao.getLatestEvents(num);
    }


}
