package com.tissue.commons.spring.advices;

import com.tissue.core.Account;
import com.tissue.commons.services.ViewerService;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

@Controller
public class AccessController {

    @Autowired
    private ViewerService viewerService;

    @RequestMapping(value="/accessDenied")
    public String denieAccess(Map model) {
        Account viewerAccount = viewerService.getViewerAccount();
        model.put("viewerAccount", viewerAccount);
        return "accessDenied";
    }

    @RequestMapping(value="/badOperation")
    public String badOperation(Map model) {
        Account viewerAccount = viewerService.getViewerAccount();
        model.put("viewerAccount", viewerAccount);
        return "badOperation";
    }

    @RequestMapping(value="/signin")
    public String loginForm(@RequestParam(value="t", required=false) String t, Map model) {
        model.put("t", t);
        return "signin";
    }
 
    @RequestMapping(value="/signout")
    public String signout(Map model) {
        model.clear();
        return "cleanup";
    }
 
    @RequestMapping(value="/cleanup")
    public HttpEntity<?> cleanup(HttpSession ses, HttpServletRequest req, HttpServletResponse res, Map model) {
        model.clear();
        ses.invalidate();
        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for(Cookie cookie : cookies) {
                cookie.setValue("");
                cookie.setPath("/");
                cookie.setMaxAge(0);
                res.addCookie(cookie);
            }
        }
        return HttpEntity.EMPTY;
    }
 
}


