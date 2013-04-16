package com.tissue.commons.spring.advices;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import org.springframework.security.access.AccessDeniedException;

import com.orientechnologies.common.exception.OException;

import java.util.Map;
import java.util.Locale;
import java.util.List;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@ControllerAdvice
public class ViewerAdvice {

    private static Logger logger = LoggerFactory.getLogger(ViewerAdvice.class);

    @ModelAttribute("locale")
    public String setupLocale(Locale locale) {
        return locale.toString();
    }

    @ExceptionHandler(RuntimeException.class)
    public String handleRuntimeException(RuntimeException exc) {
        logger.warn(exc.getMessage());
        return "redirect:/badOperation";
    }


    @ExceptionHandler(AccessDeniedException.class)
    public String handleAccessDeniedException(AccessDeniedException exc) {
        logger.warn(exc.getMessage());
        return "redirect:/accessDenied";
    }

}
