package com.tissue.commons.controllers;

import com.orientechnologies.common.exception.OException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class OrientExceptionHandler {

    @ExceptionHandler(OException.class)
    public String handleOException(OException exc) {
        exc.printStackTrace(); 
        return "exceptions/orientException";
    }

}
