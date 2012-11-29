package com.tissue.commons.dao.social;

import com.tissue.domain.social.Event;
import java.util.List;

public interface EventDao {
    Event addEvent(Event event);
    List<Event> getFriendsEvents(String userId);
}
