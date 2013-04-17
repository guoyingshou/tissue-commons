package com.tissue.commons.services;

import com.tissue.core.Account;
import com.tissue.core.User;
import com.tissue.core.UserGeneratedContent;
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

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;

import javax.annotation.Resource;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class ViewerService {

    private static Logger logger = LoggerFactory.getLogger(ViewerService.class);

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private TopicDao topicDao;

    @Autowired
    private PlanDao planDao;

    public void checkOwnership(UserGeneratedContent resource, Account account) {
        if((account != null) && (resource.isOwner(account) || account.hasRole("ROLE_ADMIN"))) {
            return;
        }
        throw new AccessDeniedException("Not owner of resource: " + resource + ", account: " + account);
    }

    public boolean isMember(Topic topic, Account account) {
        Plan plan = topic.getActivePlan();
        if((plan == null) || (account == null)) {
            logger.debug("plan: " + plan + ", account: " + account);
            return false;
        }
        return planDao.isMember(plan.getId(), account.getId());
    }

    public void checkMembership(Topic topic, Account account) {
        if(!isMember(topic, account)) {
            throw new AccessDeniedException("Not memeber of topic: " + topic + ", account: " + account);
        }
    }

    public Account getViewerAccount() {
        String viewerAccountId = SecurityUtil.getViewerAccountId();
        if(viewerAccountId == null) 
            return null;
        return accountDao.getAccount(viewerAccountId);
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

    /**
    public List<Topic> getNewTopics(String excludingUserId, int limit) {
        return topicDao.getNewTopics(excludingUserId, limit);
    }
    */

    public List<Plan> getViewerPlans() {
        return planDao.getPlansByAccount(SecurityUtil.getViewerAccountId());
    }
 
}
