package com.tissue.commons.security.web.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    /**
     * Common login request process for all application.
     * Every application which need to process login request
     * should include this class. 
     * The "login" view will come from the macro.
     */
    @RequestMapping(value="/login")
    public String showLoginForm() {
        return "login";
    }
}


