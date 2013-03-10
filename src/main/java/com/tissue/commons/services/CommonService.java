package com.tissue.commons.services;

import com.tissue.core.exceptions.NoRecordFoundException;
import com.tissue.core.orient.dao.CommonDao;
import com.tissue.core.social.Account;
import com.tissue.core.social.User;
import com.tissue.core.plan.Plan;
import com.tissue.core.social.dao.UserDao;
import com.tissue.commons.security.util.SecurityUtil;
import com.tissue.commons.exceptions.IllegalAccessException;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;
import java.util.List;

@Component
public class CommonService {

    @Autowired
    private CommonDao commonDao;

    @Autowired
    private UserDao userDao;

    public void checkAuthorizations(String rid) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();

        if(!(SecurityUtil.viewerHasRole("ROLE_ADMIN") || commonDao.isOwner(viewerAccountId, rid))) {
            throw new IllegalAccessException("Not Authorized");
        }
    }

    public void checkExistence(String rid) {
        if(!commonDao.isResourceExist(rid)) {
            throw new NoRecordFoundException(rid);
        }
    }

    public void checkOwnership(String rid) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();
        if(!commonDao.isOwner(viewerAccountId, rid)) {
            throw new IllegalAccessException("Not Owner");
        }
    }

    public Account getAccount(String accountId) {
        return userDao.getAccount(accountId);
    }

    public List<User> getNewUsers(String excludingUserId, int limit) {
        return userDao.getNewUsers(excludingUserId, limit);
    }
 
}
