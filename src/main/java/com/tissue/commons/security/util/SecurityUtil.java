package com.tissue.commons.security.util;

import com.tissue.core.security.UserDetailsImpl;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.authentication.AnonymousAuthenticationToken;

public class SecurityUtil {

    public static String getViewerAccountId() {
        UserDetailsImpl userDetails = getUserDetails();
        return (userDetails != null) ? userDetails.getId() : null;
    }

    public static Boolean viewerHasRole(String role) {
        return getUserDetails().hasRole(role);
    }

    private static UserDetailsImpl getUserDetails() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return (auth instanceof AnonymousAuthenticationToken) ? null : (UserDetailsImpl)auth.getPrincipal();
    }

}
