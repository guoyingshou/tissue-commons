package com.tissue.commons.security.util;

import com.tissue.core.security.UserDetailsImpl;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.authentication.AnonymousAuthenticationToken;

public class SecurityUtil {

    public static String getViewerId() {
        UserDetailsImpl viewer = getViewer();
        return (viewer != null) ? viewer.getId() : null;
    }

    public static String getUsername() {
        UserDetailsImpl viewer = getViewer();
        return (viewer != null) ? viewer.getUsername() : null;
    }

    public static String getDisplayName() {
        UserDetailsImpl viewer = getViewer();
        return (viewer != null) ? viewer.getDisplayName() : null;
    }

    public static UserDetailsImpl getViewer() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return (auth instanceof AnonymousAuthenticationToken) ? null : (UserDetailsImpl)auth.getPrincipal();
    }

}
