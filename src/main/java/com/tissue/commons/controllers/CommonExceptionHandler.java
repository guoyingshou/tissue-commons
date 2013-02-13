package com.tissue.commons.controllers;

import com.tissue.core.NoRecordFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionHandler {

    @ExceptionHandler(NoRecordFoundException.class)
    public String handleNoRecordFoundException() {
        System.out.println("In common exception handler");
        return "pageNotFound";
    }

}
