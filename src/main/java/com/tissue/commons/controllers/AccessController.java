package com.tissue.commons.controllers;

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

    @ModelAttribute("viewer")
    public Account prefetchViewer(Map model) {
        return userService.getUserAccount(SecurityUtil.getViewerId());
    }

}
