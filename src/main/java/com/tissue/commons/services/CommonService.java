package com.tissue.commons.services;

import com.tissue.core.orient.dao.CommonDao;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

@Component
public class CommonService {

    @Autowired
    private CommonDao commonDao;

    public boolean isResourceExist(String rid) {
       return commonDao.isResourceExist(rid);
    }

    public boolean isOwner(String userId, String rid) {
       return commonDao.isOwner(userId, rid);
    }

    public boolean isMemberOrOwner(String userId, String postId) {
       return commonDao.isMemberOrOwner(userId, postId);
    }

}
