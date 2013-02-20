package com.tissue.commons.controllers;

import com.tissue.core.exceptions.NoRecordFoundException;
import com.tissue.commons.services.CommonService;
import com.tissue.commons.exceptions.IllegalAccessException;
import com.tissue.commons.security.util.SecurityUtil;

import org.springframework.beans.factory.annotation.Autowired;

public class AccessController {
    @Autowired
    private CommonService commonService;

    protected void checkAuthorizations(String rid) {
        String viewerId = SecurityUtil.getViewerId();

        if(!(SecurityUtil.getViewer().hasRole("ROLE_ADMIN") || commonService.isOwner(viewerId, rid))) {
            throw new IllegalAccessException("Not Authorized");
        }
    }

    protected void checkExistence(String rid) {
        if(!commonService.isResourceExist(rid)) {
            throw new NoRecordFoundException(rid);
        }
    }

    protected void checkOwnership(String rid) {
        String viewerId = SecurityUtil.getViewerId();
        if(!commonService.isOwner(viewerId, rid)) {
            throw new IllegalAccessException("Not Owner");
        }
    }
}
