package com.tissue.commons.controllers;

//import com.tissue.core.social.User;
import com.tissue.commons.security.util.SecurityUtil;
//import com.tissue.commons.social.services.UserService;
import com.tissue.core.exceptions.NoRecordFoundException;
import com.tissue.commons.exceptions.IllegalAccessException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.beans.factory.annotation.Autowired;

import com.orientechnologies.common.exception.OException;
import java.util.Locale;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@ControllerAdvice
public class CommonExceptionHandler {

    private static Logger logger = LoggerFactory.getLogger(CommonExceptionHandler.class);

    @ModelAttribute("locale")
    public String setupLocale(Locale locale) {
        return locale.toString();
    }

    @ExceptionHandler(NoRecordFoundException.class)
    public HttpEntity<?> handleNoRecordFoundException(NoRecordFoundException exc) {
        logger.warn(exc.getMessage());
        return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(IllegalAccessException.class)
    public HttpEntity<?> handleIllegalAccessException(IllegalAccessException exc) {
        logger.warn(exc.getMessage());
        return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }

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


}
