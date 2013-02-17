package com.tissue.commons.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HttpErrorController {
    @RequestMapping("pageNotFound")
    public String pageNotFound() {
        return "exception/pageNotFound";
    }
}