package com.tissue.commons.util;

import com.tissue.domain.social.Event;
import com.tissue.domain.profile.User;
import com.tissue.domain.plan.Topic;
import com.tissue.domain.plan.Plan;
import com.tissue.domain.plan.Post;
import com.tissue.domain.plan.Answer;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

public class EventFactory {

    public static Event createEvent(Topic topic) {
        Event event = new Event();
        event.setType("topic");
        event.setPublished(topic.getCreateTime());

        User actor = topic.getUser();
        event.setActor(actor);

        Map<String, String> object = new HashMap();
        object.put("id", topic.getId());
        object.put("title", topic.getTitle());
        event.setObject(object);

        return event;
    }

    public static Event createEvent(Plan plan) {
        User actor = plan.getUser();

        Map object = new HashMap();
        object.put("id", plan.getId());
        object.put("duration", plan.getDuration());

        Map target = new HashMap();
        target.put("id", plan.getTopic().getId());
        target.put("title", plan.getTopic().getTitle());

        List<User> notifies = new ArrayList();
        User topicOwner = plan.getTopic().getUser();
        if(!actor.getId().equals(topicOwner.getId())) {
            notifies.add(topicOwner);
        }
 
        Event event = new Event();
        event.setType("plan");
        event.setPublished(plan.getCreateTime());
        event.setActor(actor);
        event.setObject(object);
        event.setTarget(target);
        event.setNotifies(notifies);

        return event;
    }

    public static Event createEvent(Post post) {
        User actor = post.getUser();

        Map object = new HashMap();
        object.put("id", post.getId());
        object.put("title", post.getTitle());

        Map target = new HashMap();
        target.put("id", post.getPlan().getTopic().getId());
        target.put("title", post.getPlan().getTopic().getTitle());

        //retrieve all users that need to be notified
        List<User> notifies = new ArrayList();
        User planOwner = post.getPlan().getUser();
        if(!actor.getId().equals(planOwner.getId())) {
            notifies.add(planOwner);
        }
        //a newly created plan may have no members
        List<User>  members = post.getPlan().getMembers();
        if(members != null) {
            for(User user : members) {
                if(!actor.getId().equals(user.getId())) {
                    notifies.add(user);
                }
            }
        }

        Event event = new Event();
        event.setType(post.getType());
        event.setPublished(post.getCreateTime());
        event.setActor(actor);
        event.setObject(object);
        event.setTarget(target);
        event.setNotifies(notifies);
 
        return event;
    }

    public static Event createEvent(Answer answer) {
        User actor = answer.getUser();

        Map object = new HashMap();
        object.put("id", answer.getQuestion().getId());
        object.put("title", answer.getQuestion().getTitle());

        Map target = new HashMap();
        target.put("id", answer.getQuestion().getPlan().getTopic().getId());
        target.put("title", answer.getQuestion().getPlan().getTopic().getTitle());

        //retrieve all users that need to be notified
        List<User> notifies = new ArrayList();
        User questionOwner = answer.getQuestion().getUser();

        System.out.println("actor: " + actor);
        System.out.println("owner: " + questionOwner);

        if(!actor.getId().equals(questionOwner.getId())) {
            notifies.add(questionOwner);
        }
        //a newly created plan may have no members
        List<User>  members = answer.getQuestion().getPlan().getMembers();
        if(members != null) {
            for(User user : members) {
                if(!actor.getId().equals(user.getId())) {
                    notifies.add(user);
                }
            }
        }

        Event event = new Event();
        event.setType("answer");
        event.setPublished(answer.getCreateTime());
        event.setActor(actor);

        event.setObject(object);
        event.setTarget(target);

        event.setNotifies(notifies);
 
        return event;

    }
}
