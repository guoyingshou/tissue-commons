package com.tissue.commons.dao.social;

import com.tissue.domain.social.Activity;
import com.tissue.domain.social.ActivityObject;
import java.util.List;

public interface ActivityDao {
    List<Activity> getTopicRelatedActivities(String userId, int num);
    List<Activity> getFriendsActivities(String userId, int num);
    List<Activity> getLatestActivities(int num);
}
