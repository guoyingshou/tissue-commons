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

    public List<Event> getRelatedEvents(String userId) {
        return eventDao.getRelatedEvents(userId);
    }

    public List<Event> getFriendsEvents(String userId) {
        return eventDao.getFriendsEvents(userId);
    }

}
