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
import org.springframework.web.bind.annotation.ControllerAdvice;

import java.util.Map;

@ControllerAdvice
public class AccessController {

    @Autowired
    private UserService userService;

    @ModelAttribute("viewerAccount")
    public Account setupViewer(Map model) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();
        if(viewerAccountId == null) {
            return null;
        }
        return userService.getAccount(viewerAccountId);
    }
 
}
