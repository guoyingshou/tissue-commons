package com.tissue.commons.spring.advices;

//import com.tissue.core.Account;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.*;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

@Controller
public class AccessController {

    /**
    @Autowired
    protected AboutService aboutService;
    */

    @RequestMapping(value="/accessDenied")
    //public String denieAccess(Map model, @ModelAttribute("viewerAccount") Account viewerAccount) {
    public String denieAccess(Map model) {
        return "accessDenied";
    }

}


