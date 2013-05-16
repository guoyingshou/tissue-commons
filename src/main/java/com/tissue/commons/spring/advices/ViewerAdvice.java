package com.tissue.commons.spring.advices;

import com.tissue.social.Invitation;
import com.tissue.commons.services.ViewerService;

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

import javax.annotation.Resource;
import java.util.Map;
import java.util.Locale;
import java.util.List;
import java.security.AccessControlException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@ControllerAdvice
public class ViewerAdvice {

    @Autowired
    private ViewerService viewerService;

    private static Logger logger = LoggerFactory.getLogger(ViewerAdvice.class);

    @ModelAttribute("locale")
    public String setupLocale(Locale locale) {
        return locale.toString();
    }

    /**
    @ModelAttribute("invitations")
    public List<Invitation> getInvitations(Map model) {
        return viewerService.getReceivedInvitations();
    }

    @ExceptionHandler(RuntimeException.class)
    public String handleRuntimeException(RuntimeException exc) {
        logger.warn(exc.getMessage());
        return "redirect:/badOperation";
    }
    */

    @ExceptionHandler(AccessControlException.class)
    public String handleAccessControlException(AccessControlException exc) {
        logger.warn(exc.getMessage());
        return "redirect:/accessDenied";
    }

}
