package com.tissue.commons.services;

import com.tissue.core.Account;
import com.tissue.core.User;
import com.tissue.core.dao.UserDao;
import com.tissue.core.command.UserCommand;
import com.tissue.core.command.EmailCommand;
import com.tissue.core.command.PasswordCommand;
import com.tissue.core.dao.AccountDao;
import com.tissue.commons.util.SecurityUtil;
import com.tissue.plan.Topic;
import com.tissue.plan.Plan;
import com.tissue.plan.Post;
import com.tissue.plan.dao.TopicDao;
import com.tissue.plan.dao.PlanDao;
import com.tissue.plan.dao.PostDao;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.List;

@Component
public class ViewerService {

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private TopicDao topicDao;

    @Autowired
    private PlanDao planDao;

    @Resource(name="postDaoImpl")
    private PostDao postDao;

    public Account getViewerAccount() {
        return accountDao.getAccount(SecurityUtil.getViewerAccountId());
    }

    public void updateHeadline(UserCommand command) {
        userDao.updateHeadline(command);
    }

    public User getUser(String userId) {
        return userDao.getUser(userId);
    }

    public User getUserByAccount(String accountId) {
        return userDao.getUserByAccount(accountId);
    }

    public Boolean isFriend(String userId, Account viewerAccount) {
        if(viewerAccount == null) {
            return false;
        }
        return userDao.isFriend(userId, viewerAccount.getUser().getId());
    }

    public void removeRelation(String userId1, String userId2) {
        userDao.removeRelation(userId1, userId2);
    }

    public List<User> getFriends(String userId) {
        return userDao.getFriends(userId);
    }

    public List<Topic> getNewTopics(String excludingUserId, int limit) {
        return topicDao.getNewTopics(excludingUserId, limit);
    }

    public List<Plan> getViewerPlans() {
        return planDao.getPlansByAccount(SecurityUtil.getViewerAccountId());
    }

    /**
    public long getPostsCountByUser(String userId) {
        return postDao.getPostsCountByUser(userId);
    }

    public List<Post> getPagedPostsByUser(String userId, int page, int size) {
        return postDao.getPagedPostsByUser(userId, page, size);
    }
    */
 
}
