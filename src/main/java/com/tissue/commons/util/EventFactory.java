package com.tissue.commons.util;

import com.tissue.domain.social.Event;
import com.tissue.domain.profile.User;
import com.tissue.domain.plan.Topic;
import com.tissue.domain.plan.Plan;
import com.tissue.domain.plan.Post;
import com.tissue.domain.plan.PostMessage;
import com.tissue.domain.plan.PostMessageComment;
import com.tissue.domain.plan.QuestionComment;
import com.tissue.domain.plan.Answer;
import com.tissue.domain.plan.AnswerComment;

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

    public static Event createEvent(PostMessage postMessage) {
        User actor = postMessage.getUser();

        Map object = new HashMap();
        object.put("id", postMessage.getPost().getId());
        object.put("title", postMessage.getPost().getTitle());

        Map target = new HashMap();
        target.put("id", postMessage.getPost().getPlan().getTopic().getId());
        target.put("title", postMessage.getPost().getPlan().getTopic().getTitle());

        //retrieve all users that need to be notified
        List<User> notifies = new ArrayList();
        User postMessageOwner = postMessage.getPost().getUser();

        if(!actor.getId().equals(postMessageOwner.getId())) {
            notifies.add(postMessageOwner);
        }
        //a newly created plan may have no members
        List<User>  members = postMessage.getPost().getPlan().getMembers();
        if(members != null) {
            for(User user : members) {
                if(!actor.getId().equals(user.getId())) {
                    notifies.add(user);
                }
            }
        }

        Event event = new Event();
        event.setType("postMessage");
        event.setPublished(postMessage.getCreateTime());
        event.setActor(actor);

        event.setObject(object);
        event.setTarget(target);
        event.setNotifies(notifies);
 
        return event;
    }

    public static Event createEvent(PostMessageComment postMessageComment) {
        User actor = postMessageComment.getUser();

        Map object = new HashMap();
        object.put("id", postMessageComment.getPostMessage().getPost().getId());
        object.put("title", postMessageComment.getPostMessage().getPost().getTitle());

        Map target = new HashMap();
        target.put("id", postMessageComment.getPostMessage().getPost().getPlan().getTopic().getId());
        target.put("title", postMessageComment.getPostMessage().getPost().getPlan().getTopic().getTitle());

        //retrieve all users that need to be notified
        List<User> notifies = new ArrayList();
        User postMessageCommentOwner = postMessageComment.getPostMessage().getPost().getUser();

        if(!actor.getId().equals(postMessageCommentOwner.getId())) {
            notifies.add(postMessageCommentOwner);
        }
        //a newly created plan may have no members
        List<User>  members = postMessageComment.getPostMessage().getPost().getPlan().getMembers();
        if(members != null) {
            for(User user : members) {
                if(!actor.getId().equals(user.getId())) {
                    notifies.add(user);
                }
            }
        }

        Event event = new Event();
        event.setType("postMessageComment");
        event.setPublished(postMessageComment.getCreateTime());
        event.setActor(actor);

        event.setObject(object);
        event.setTarget(target);

        event.setNotifies(notifies);
 
        return event;

    }

    public static Event createEvent(QuestionComment questionComment) {
        User actor = questionComment.getUser();

        Map object = new HashMap();
        object.put("id", questionComment.getQuestion().getId());
        object.put("title", questionComment.getQuestion().getTitle());

        Map target = new HashMap();
        target.put("id", questionComment.getQuestion().getPlan().getTopic().getId());
        target.put("title", questionComment.getQuestion().getPlan().getTopic().getTitle());

        //retrieve all users that need to be notified
        List<User> notifies = new ArrayList();
        User questionCommentOwner = questionComment.getQuestion().getUser();

        if(!actor.getId().equals(questionCommentOwner.getId())) {
            notifies.add(questionCommentOwner);
        }
        //a newly created plan may have no members
        List<User>  members = questionComment.getQuestion().getPlan().getMembers();
        if(members != null) {
            for(User user : members) {
                if(!actor.getId().equals(user.getId())) {
                    notifies.add(user);
                }
            }
        }

        Event event = new Event();
        event.setType("questionComment");
        event.setPublished(questionComment.getCreateTime());
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

    public static Event createEvent(AnswerComment answerComment) {
        User actor = answerComment.getUser();

        Map object = new HashMap();
        object.put("id", answerComment.getAnswer().getQuestion().getId());
        object.put("title", answerComment.getAnswer().getQuestion().getTitle());

        Map target = new HashMap();
        target.put("id", answerComment.getAnswer().getQuestion().getPlan().getTopic().getId());
        target.put("title", answerComment.getAnswer().getQuestion().getPlan().getTopic().getTitle());

        //retrieve all users that need to be notified
        List<User> notifies = new ArrayList();
        User answerCommentOwner = answerComment.getAnswer().getQuestion().getUser();

        if(!actor.getId().equals(answerCommentOwner.getId())) {
            notifies.add(answerCommentOwner);
        }
        //a newly created plan may have no members
        List<User>  members = answerComment.getAnswer().getQuestion().getPlan().getMembers();
        if(members != null) {
            for(User user : members) {
                if(!actor.getId().equals(user.getId())) {
                    notifies.add(user);
                }
            }
        }

        Event event = new Event();
        event.setType("answerComment");
        event.setPublished(answerComment.getCreateTime());
        event.setActor(actor);

        event.setObject(object);
        event.setTarget(target);

        event.setNotifies(notifies);
 
        return event;

    }
}
