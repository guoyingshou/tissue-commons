package com.tissue.commons.security.services;

import com.tissue.core.security.UserDetailsImpl;
import com.tissue.core.security.dao.UserDetailsDao;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Arrays;

//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;

public class UserDetailsServiceImpl implements UserDetailsService {
    //private static Log log = LogFactory.getLog(UserDetailsServiceImpl.class);

    private UserDetailsDao userDetailsDao;

    public void setUserDetailsDao(UserDetailsDao userDetailsDao) {
        this.userDetailsDao = userDetailsDao;
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        UserDetailsImpl userDetails = userDetailsDao.getUserByUsername(username);
        if(userDetails == null) {
            throw new UsernameNotFoundException(username + " not exist");
        }
        return userDetails;
    }
}
