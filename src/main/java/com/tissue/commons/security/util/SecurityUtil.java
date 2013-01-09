package com.tissue.commons.security.util;

import com.tissue.core.security.UserDetailsImpl;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.authentication.AnonymousAuthenticationToken;

public class SecurityUtil {

    public static String getUserId() {
        if(getUser() == null) {
            return null;
        }
        return getUser().getId();
    }

    public static String getUsername() {
        if(getUser() == null) {
            return null;
        }
        return getUser().getUsername();
    }

    public static String getDisplayName() {
        if(getUser() == null) {
            return null;
        }
        return getUser().getDisplayName();
    }

    public static UserDetailsImpl getUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if(auth instanceof AnonymousAuthenticationToken)
            return null;
        return (UserDetailsImpl)auth.getPrincipal();
    }

}
