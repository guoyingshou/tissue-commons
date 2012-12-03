package com.tissue.commons.dao.social;

import com.tissue.domain.social.Event;
import java.util.List;

public interface EventDao {
    void addEvent(Event ... event);
    List<Event> getTopicRelatedEvents(String userId);
    List<Event> getFriendsEvents(String userId);
}
