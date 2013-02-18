package com.tissue.commons.social.service;

import com.tissue.core.social.command.UserCommand;
import com.tissue.core.social.User;
import com.tissue.core.plan.Topic;
import com.tissue.core.plan.Plan;
import com.tissue.core.plan.Post;
import com.tissue.core.social.Impression;
import com.tissue.core.social.Invitation;
import com.tissue.core.social.dao.UserDao;
import com.tissue.core.plan.dao.TopicDao;
import com.tissue.core.plan.dao.PlanDao;
import com.tissue.core.plan.dao.PostDao;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Component("userService")
public class UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private TopicDao topicDao;

    @Autowired
    private PlanDao planDao;

    @Autowired
    private PostDao postDao;

    public String addUser(UserCommand userCommand) {
        return userDao.create(userCommand);
    }

    public void updateUser(UserCommand userCommand) {
        userDao.update(userCommand);
    }

    public void updateEmail(UserCommand userCommand) {
        userDao.updateEmail(userCommand);
    }

    public void changePassword(UserCommand userCommand) {
        userDao.changePassword(userCommand);
    }

    public boolean isUserIdExist(String userId) {
        return userDao.isUserIdExist(userId);
    }

    public boolean isUsernameExist(String username) {
        return userDao.isUsernameExist(username);
    }

    public boolean isEmailExist(String email) {
        return userDao.isEmailExist(email);
    }

    public boolean isEmailExist(String excludingUserId, String email) {
        return userDao.isEmailExist(excludingUserId, email);
    }

    public void addResume(String userId, String resume) {
        userDao.addResume(userId, resume);
    }

    public void addImpression(Impression impression) {
        userDao.addImpression(impression);
    }

    public User getUserById(String id) {
        return userDao.getUserById(id);
    }

    public User getViewer(String viewerId) {
        User user = userDao.getUserById(viewerId);

        List<User> friends = userDao.getFriends(viewerId);
        user.setFriends(friends);

        List<Invitation> invitations = userDao.getInvitationsReceived(viewerId);
        user.setInvitationsReceived(invitations);

        return user;
    }
 
    public List<User> getFriends(String userId) {
        return userDao.getFriends(userId);
    }

    public List<Impression> getImpressions(String userId) {
        return userDao.getImpressions(userId);
    }

    public List<Plan> getPlansByUserId(String userId) {
        return planDao.getPlansByUserId(userId);
    }

    public long getPostsCountByUserId(String userId) {
        return postDao.getPostsCountByUserId(userId);
    }

    public List<Post> getPagedPostsByUserId(String userId, int page, int size) {
        return postDao.getPagedPostsByUserId(userId, page, size);
    }
    
    public void inviteFriend(String fromId, String toId, String content) {
        userDao.inviteFriend(fromId, toId, content);
    }

    public boolean isInvitable(String userId1, String userId2) {
        return userDao.isInvitable(userId1, userId2);
    }

    public void acceptInvitation(String invitationId) {
        userDao.acceptInvitation(invitationId);
    }

    public void declineInvitation(String invitationId) {
        userDao.declineInvitation(invitationId);
    }

    public List<User> getNewUsers(String excludingUserId, int limit) {
        return userDao.getNewUsers(excludingUserId, limit);
    }

    public List<Topic> getNewTopics(String excludingUserId, int limit) {
        return topicDao.getNewTopics(excludingUserId, limit);
    }
}
