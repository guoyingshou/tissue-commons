package com.tissue.commons.services;

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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserDetailsServiceImpl implements UserDetailsService {

    private static Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

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
