package com.tissue.commons.social.service;

import com.tissue.core.social.User;
import com.tissue.core.plan.Plan;
import com.tissue.core.plan.Post;
import com.tissue.core.social.Impression;
import com.tissue.core.social.Invitation;
import com.tissue.core.social.dao.UserDao;
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
    private PlanDao planDao;

    @Autowired
    private PostDao postDao;

    public User addUser(User user) {
        return userDao.create(user);
    }

    public User updateUser(User user) {
        return userDao.update(user);
    }

    public void addResume(String userId, String resume) {
        userDao.addResume(userId, resume);
    }

    public void addImpression(Impression impression) {
        userDao.addImpression(impression);
    }

    /**
    public List<Impression> getImpressions(String userId) {
        return userDao.getImpressions(userId);
    }
    */

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
 
    public User getUserContainsFriends(String userId) {
        User user = userDao.getUserById(userId);

        List<User> friends = userDao.getFriends(userId);
        user.setFriends(friends);

        return user;
    }

    public User getUserContainsImpressions(String userId) {
        User user = userDao.getUserById(userId);

        List<Impression> impressions = userDao.getImpressions(userId);
        user.setImpressions(impressions);

        return user;
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

    public void acceptInvitation(String invitationId) {
        userDao.acceptInvitation(invitationId);
    }

    public void declineInvitation(String invitationId) {
        userDao.declineInvitation(invitationId);
    }

}
