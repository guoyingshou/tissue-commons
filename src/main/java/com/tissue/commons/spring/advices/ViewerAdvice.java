package com.tissue.commons.spring.advices;

import com.tissue.core.User;
import com.tissue.core.Account;
import com.tissue.core.dao.AccountDao;
import com.tissue.commons.util.SecurityUtil;
import com.tissue.plan.Plan;
import com.tissue.plan.dao.PlanDao;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.orientechnologies.common.exception.OException;

import java.util.Map;
import java.util.Locale;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@ControllerAdvice
public class ViewerAdvice {

    private static Logger logger = LoggerFactory.getLogger(ViewerAdvice.class);

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private PlanDao planDao;

    @ModelAttribute("viewerAccount")
    public Account setupViewer(Map model) {
        String viewerAccountId = SecurityUtil.getViewerAccountId();
        logger.debug("current viewer account id: " + viewerAccountId);

        if(viewerAccountId == null) {
            return null;
        }
        return accountDao.getAccount(viewerAccountId);
    }

    @ModelAttribute("locale")
    public String setupLocale(Locale locale) {
        return locale.toString();
    }

    @ExceptionHandler(RuntimeException.class)
    public String handleRuntimeException(RuntimeException exc) {
        logger.warn(exc.getMessage());
        return "redirect:/badOperation";
    }


    /**
    @ExceptionHandler(OException.class)
    public HttpEntity<?> handleOException(OException exc) {
        logger.warn(exc.getMessage());
        return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public HttpEntity<?> handleIllegalArgumentException(IllegalArgumentException exc) {
        logger.warn(exc.getMessage());
        return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }
    */

}
