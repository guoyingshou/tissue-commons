package com.tissue.commons.controllers;

import com.tissue.core.User;
import com.tissue.core.Account;
import com.tissue.core.dao.AccountDao;
import com.tissue.commons.util.SecurityUtil;

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
    private AccountDao accountDao;

    @ModelAttribute("viewerAccount")
    public Account setupViewer(Map model) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();
        logger.debug("current viewer account id: " + viewerAccountId);

        if(viewerAccountId == null) {
            return null;
        }
        return accountDao.getAccount(viewerAccountId);
    }
}
