package com.tissue.commons.controllers;

import com.tissue.commons.util.SecurityUtil;

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
