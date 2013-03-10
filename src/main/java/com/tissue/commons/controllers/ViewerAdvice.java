package com.tissue.commons.controllers;

import com.tissue.core.social.User;
import com.tissue.core.social.Account;
import com.tissue.core.exceptions.NoRecordFoundException;
import com.tissue.commons.services.CommonService;
import com.tissue.commons.exceptions.IllegalAccessException;
import com.tissue.commons.security.util.SecurityUtil;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ControllerAdvice;

import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@ControllerAdvice
public class ViewerAdvice {

    private static Logger logger = LoggerFactory.getLogger(ViewerAdvice.class);

    @Autowired
    private CommonService commonService;

    @ModelAttribute("viewerAccount")
    public Account setupViewer(Map model) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();
        logger.debug("current viewer account id: " + viewerAccountId);

        if(viewerAccountId == null) {
            return null;
        }
        return commonService.getAccount(viewerAccountId);
    }
}
