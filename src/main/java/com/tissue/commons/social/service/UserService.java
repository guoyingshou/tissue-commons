package com.tissue.commons.social.service;

import com.tissue.core.social.User;
import com.tissue.core.social.Impression;
import com.tissue.core.social.dao.UserDao;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Component("userService")
public class UserService {

    @Autowired
    private UserDao userDao;

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

    public List<Impression> getImpressions(String userId) {
        return userDao.getImpressions(userId);
    }

    /**
     * @param userId user id
    public User getUserById(String id, boolean withConnections) {
        return userDao.getUserById(id, withConnections);
    }
     */

    public User getUserById(String id) {
        return userDao.getUserById(id);
    }

    public User getUserDetailsById(String id) {
        return userDao.getUserDetailsById(id);
    }
 
}
