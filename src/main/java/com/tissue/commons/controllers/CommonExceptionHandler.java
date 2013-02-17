package com.tissue.commons.controllers;

import com.tissue.core.NoRecordFoundException;
import com.tissue.commons.IllegalAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionHandler {

    @ExceptionHandler(NoRecordFoundException.class)
    public String handleNoRecordFoundException() {
        return "exceptions/pageNotFound";
    }

    @ExceptionHandler(IllegalAccessException.class)
    public String handleIllegalAccessException(IllegalAccessException exc) {
        exc.printStackTrace();
        return "exceptions/illegalAccess";
    }

}