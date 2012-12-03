package com.tissue.commons.dao.social.orient;

import com.tissue.core.converter.EventConverter;
import com.tissue.core.util.OrientIdentityUtil;
import com.tissue.core.util.OrientDataSource;
import com.tissue.commons.dao.social.EventDao;
import com.tissue.domain.social.Event;
import com.tissue.domain.profile.User;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import com.orientechnologies.orient.core.db.graph.OGraphDatabase;
import com.orientechnologies.orient.core.db.record.OIdentifiable;
import com.orientechnologies.orient.core.record.impl.ODocument;
import com.orientechnologies.orient.core.id.ORecordId;
import com.orientechnologies.orient.core.sql.query.OSQLSynchQuery;
import com.orientechnologies.orient.core.sql.OCommandSQL;

import java.util.List;
import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;

@Component
public class EventDaoImpl implements EventDao {

    @Autowired
    private OrientDataSource dataSource;

    public void addEvent(Event ... events) {

        OGraphDatabase db = dataSource.getDB();
        try {
            for(Event event : events) {
                ODocument eventDoc = EventConverter.convertEvent(event);
                eventDoc.save();
            }
        }
        catch(Exception exc) {
            //to do
            exc.printStackTrace();
        }
        finally {
            db.close();
        }
    }

    public List<Event> getTopicRelatedEvents(String userId) {
        List<Event> events = null;

        String ridUser = OrientIdentityUtil.decode(userId);
        String sql = "select from event where type not in ['accept', 'accepted'] and (actor in (select union(in[label='friend'].out, out[label='friend'].in) from " + ridUser + ") or " + ridUser + " in notifies)";

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
        return events;
    }

    public List<Event> getFriendsEvents(String userId) {
        List<Event> events = null;

        String ridUser = OrientIdentityUtil.decode(userId);
        String sql = "select from event where type in ['accept', 'accepted'] and (actor in (select union(in[label='friend'].out, out[label='friend'].in) from " + ridUser + ")";

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
        return events;
 
    }
}
