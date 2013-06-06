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
import com.tissue.plan.Plan;
import com.tissue.plan.dao.PlanDao;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

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
    private PlanDao planDao;

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

    public Boolean isFriend(String userId, Account viewerAccount) {
        if(viewerAccount == null) {
            return false;
        }
        return userDao.isFriend(userId, viewerAccount.getUser().getId());
    }

    public void removeRelation(String userId1, String userId2) {
        userDao.removeRelation(userId1, userId2);
    }

    public boolean isInvitable(String ownerId, Account viewerAccount) {

        if((viewerAccount == null) || viewerAccount.hasRole("ROLE_EVIL")) {
            return false;
        }

        boolean invitable = false;
        if(!ownerId.equals(viewerAccount.getUser().getId())) {
            int inviteLimit = viewerAccount.getUser().getInviteLimit();
            if(inviteLimit > 0) {
                invitable = userDao.isInvitable(ownerId, viewerAccount);
            }
        }
        return invitable;
    }
 
    public List<User> getFriends(String userId) {
        return userDao.getFriends(userId);
    }

    public List<Plan> getViewerPlans() {
        return planDao.getPlansByAccount(SecurityUtil.getViewerAccountId());
    }
   
}
