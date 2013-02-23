package com.tissue.commons.controllers;

import com.tissue.core.social.User;
import com.tissue.core.social.Account;
import com.tissue.core.exceptions.NoRecordFoundException;
import com.tissue.commons.services.CommonService;
import com.tissue.commons.social.services.UserService;
import com.tissue.commons.exceptions.IllegalAccessException;
import com.tissue.commons.security.util.SecurityUtil;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Map;

public class AccessController {

    @Autowired
    private CommonService commonService;

    @Autowired
    private UserService userService;


    protected void checkAuthorizations(String rid) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();

        //if(!(SecurityUtil.getViewer().hasRole("ROLE_ADMIN") || commonService.isOwner(viewerId, rid))) {
        if(!(SecurityUtil.viewerHasRole("ROLE_ADMIN") || commonService.isOwner(viewerAccountId, rid))) {
            throw new IllegalAccessException("Not Authorized");
        }
    }

    protected void checkExistence(String rid) {
        if(!commonService.isResourceExist(rid)) {
            throw new NoRecordFoundException(rid);
        }
    }

    protected void checkOwnership(String rid) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();
        if(!commonService.isOwner(viewerAccountId, rid)) {
            throw new IllegalAccessException("Not Owner");
        }
    }

    @ModelAttribute("viewer")
    public User setupViewer(Map model) {
        return userService.getUserByAccount(SecurityUtil.getViewerAccountId());
    }

}
