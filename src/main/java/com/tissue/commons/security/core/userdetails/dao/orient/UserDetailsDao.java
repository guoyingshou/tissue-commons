package com.tissue.commons.security.core.userdetails.dao.orient;

import com.tissue.commons.security.core.userdetails.UserDetailsImpl;
import com.tissue.core.util.OrientIdentityUtil;
import com.tissue.core.util.OrientDataSource;

import java.util.List;
import java.util.Date;
import java.util.Collection;
import java.util.LinkedList;
import java.nio.charset.Charset;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import com.orientechnologies.orient.core.db.graph.OGraphDatabase;
import com.orientechnologies.orient.core.sql.query.OSQLSynchQuery;
import com.orientechnologies.orient.core.record.impl.ODocument;

@Component
public class UserDetailsDao {

    private String byUsername = "select from User where username = ?";

    @Autowired
    private OrientDataSource dataSource;

    public void setDataSource(OrientDataSource dataSource) {
        this.dataSource = dataSource;
    }

    public UserDetailsImpl getUserByUsername(String username) {
        UserDetailsImpl user = null;

        OGraphDatabase db = dataSource.getDB();
        try {
            OSQLSynchQuery<ODocument> query = new OSQLSynchQuery(byUsername);
            List<ODocument> result = db.command(query).execute(username);
            if(result != null) {
                ODocument doc = result.get(0);
                user = new UserDetailsImpl();
                user.setUsername(username);
                user.setPassword(doc.field("password").toString());
                user.setDisplayName(doc.field("displayName").toString());

                user.setId(OrientIdentityUtil.encode(doc.getIdentity().toString()));
            }
        }
        catch(Exception exc) {
            //to do:
        }
        finally {
            db.close();
        }

        return user;
    }

}
