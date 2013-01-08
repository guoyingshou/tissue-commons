package com.tissue.commons.dao.social.orient;

import com.tissue.core.converter.ActivityConverter;
import com.tissue.core.util.OrientIdentityUtil;
import com.tissue.core.util.OrientDataSource;
import com.tissue.commons.dao.social.ActivityDao;
import com.tissue.domain.social.Activity;
import com.tissue.domain.social.ActivityObject;
import com.tissue.domain.profile.User;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import com.orientechnologies.orient.core.db.graph.OGraphDatabase;
import com.orientechnologies.orient.core.db.record.OIdentifiable;
import com.orientechnologies.orient.core.record.impl.ODocument;
import com.orientechnologies.orient.core.id.ORecordId;
import com.orientechnologies.orient.core.sql.query.OSQLSynchQuery;
import com.orientechnologies.orient.core.sql.OCommandSQL;

import com.orientechnologies.orient.core.command.traverse.OTraverse;
import com.orientechnologies.orient.core.command.OCommandPredicate;
import com.orientechnologies.orient.core.command.OCommandContext;
import com.orientechnologies.orient.core.record.ORecord;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Set;
import java.util.HashSet;

import com.google.common.collect.Multimap;
import com.google.common.collect.SortedSetMultimap;
import com.google.common.collect.TreeMultimap;

@Component
public class ActivityDaoImpl implements ActivityDao {

    @Autowired
    private OrientDataSource dataSource;

    public List<Activity> getTopicRelatedActivities(String userId, int num) {
        List<Activity> stream = null;

        String ridUser = OrientIdentityUtil.decode(userId);

        //String sql = "select from edgetopic where out in (select union(in[label='friend'].out, out[label='friend'].in) from " + ridUser + ")";
        
        String sql = "select from edgetopic order by createTime desc";

        OGraphDatabase db = dataSource.getDB();
        try {
            OSQLSynchQuery<ODocument> q = new OSQLSynchQuery(sql);
            List<ODocument> streamDoc = db.query(q);

            stream = ActivityConverter.buildStream(streamDoc);
        }
        catch(Exception exc) {
            //to do
            exc.printStackTrace();
        }
        finally {
            db.close();
        }
        return stream;
    }

    public List<Activity> getFriendsActivities(String userId, int num) {
        List<Activity> stream = null;

        /**
        String ridUser = OrientIdentityUtil.decode(userId);
        String sql = "select from event where type in ['accept', 'accepted'] and (actor in (select union(in[label='friend'].out, out[label='friend'].in) from " + ridUser + ") order by published desc limit " + num;

        OGraphDatabase db = dataSource.getDB();
        try {
            OSQLSynchQuery<ODocument> q = new OSQLSynchQuery(sql);
            List<ODocument> eventsDoc = db.query(q);

            events = EventConverter.buildEvents(eventsDoc);
        }
        catch(Exception exc) {
            //to do
            exc.printStackTrace();
        }
        finally {
            db.close();
        }
        */
        return stream;
 
    }

    public List<Activity> getLatestActivities(int num) {
        List<Activity> stream = null;

        /**
        String sql = "select from event where type in ['topic', 'plan', 'members'] order by published desc limit " + num;

        OGraphDatabase db = dataSource.getDB();
        try {
            OSQLSynchQuery<ODocument> q = new OSQLSynchQuery(sql);
            List<ODocument> eventsDoc = db.query(q);

            events = EventConverter.buildEvents(eventsDoc);
        }
        catch(Exception exc) {
            //to do
            exc.printStackTrace();
        }
        finally {
            db.close();
        }
        */
        return stream;
 
    }

}