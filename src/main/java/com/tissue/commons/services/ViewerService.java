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
import com.tissue.social.Invitation;
import com.tissue.plan.Topic;
import com.tissue.plan.Plan;
import com.tissue.plan.Post;
import com.tissue.social.dao.InvitationDao;
import com.tissue.plan.dao.TopicDao;
import com.tissue.plan.dao.PlanDao;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.List;
import java.security.AccessControlException;

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
    private InvitationDao invitationDao;

    @Autowired
    private TopicDao topicDao;

    @Autowired
    private PlanDao planDao;

    public boolean isMember(Topic topic, Account account) {

        if(account == null || topic == null) {
            logger.debug("Null account");
            return false;
        }

        if(!account.hasRole("ROLE_USER") || account.hasRole("ROLE_EVIL")) {
            logger.debug("ROLE_EVIL or No role of name: 'ROLE_USER'");
            return false;
        }

        Plan plan = topic.getActivePlan();
        if(plan == null) {
            logger.debug("Null plan");
            return false;
        }

        return planDao.isMember(plan.getId(), account.getId());
    }

    public void checkMembership(Topic topic, Account account) {
        if(!isMember(topic, account)) {
            throw new AccessControlException(account + " is not memeber of the active plan in " + topic);
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

    /**
    public User getUserByAccount(String accountId) {
        return userDao.getUserByAccount(accountId);
    }
    */

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

    public List<Plan> getViewerPlans() {
        return planDao.getPlansByAccount(SecurityUtil.getViewerAccountId());
    }

    public List<Invitation> getInvitationsReceived() {
        String viewerAccountId = SecurityUtil.getViewerAccountId();
        
        return viewerAccountId == null ? null: invitationDao.getInvitationsReceived(viewerAccountId);
    }
    
}
