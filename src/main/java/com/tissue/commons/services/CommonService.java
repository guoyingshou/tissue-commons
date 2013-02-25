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

    /**
    public boolean isResourceExist(String rid) {
       return commonDao.isResourceExist(rid);
    }

    public boolean isOwner(String userId, String rid) {
       return commonDao.isOwner(userId, rid);
    }

    public boolean isMemberOrOwner(String userId, String postId) {
       return commonDao.isMemberOrOwner(userId, postId);
    }
    */

    protected void checkAuthorizations(String rid) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();

        if(!(SecurityUtil.viewerHasRole("ROLE_ADMIN") || commonDao.isOwner(viewerAccountId, rid))) {
            throw new IllegalAccessException("Not Authorized");
        }
    }

    protected void checkExistence(String rid) {
        if(!commonDao.isResourceExist(rid)) {
            throw new NoRecordFoundException(rid);
        }
    }

    protected void checkOwnership(String rid) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();
        if(!commonDao.isOwner(viewerAccountId, rid)) {
            throw new IllegalAccessException("Not Owner");
        }
    }

    /**
    public void setupViewer(Map model) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();
        User viewer = userDao.getUserByAccount(viewerAccountId);
        model.put("viewer", viewer);
    }
 
    public void setupViewerOwner(String userId, Map model) {
        setupPlans(userId, model);

        String viewerAccountId = SecurityUtil.getViewerAccountId();
        if(viewerAccountId != null) {
             User viewer = userDao.getUserByAccount(viewerAccountId);
             model.put("viewer", viewer);

             Boolean invitable = false;
             User owner = null;
             if(!userId.equals(viewer.getId())) {
                 invitable = userDao.isInvitable(viewer.getId(), userId);
                 owner = userDao.getUser(userId);
             }
             else {
                 owner = viewer;
             }
             model.put("owner", owner);
             model.put("invitable", invitable);
        }
    }
 
    public void setupPlans(String userId, Map model) {
        List<Plan> plans = userDao.getPlans(userId);
        model.put("plans", plans);
    }

    public Boolean isFriend(String userId, Map model) {
        //need real implementation
        return true; 
    }
    */

}
