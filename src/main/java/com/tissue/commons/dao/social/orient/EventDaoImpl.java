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

    public Event addEvent(Event event) {

        String ridActor = OrientIdentityUtil.decode(event.getActor().getId());

        OGraphDatabase db = dataSource.getDB();
        try {
            ODocument eventDoc = new ODocument("Event");
            eventDoc.field("published", event.getPublished());
            eventDoc.field("type", event.getType());
            eventDoc.field("actor", new ORecordId(ridActor));
            eventDoc.field("object", event.getObject());

            List<User> users = event.getNotifies();
            if(users != null) {
                Set<ORecordId> notifiesDoc = new HashSet();
                for(User user : users) {
                    String ridUser = OrientIdentityUtil.decode(user.getId());
                    notifiesDoc.add(new ORecordId(ridUser));
                }
                eventDoc.field("notifies", notifiesDoc);
            }
            eventDoc.save();
            event.setId(OrientIdentityUtil.encode(eventDoc.getIdentity().toString()));
        }
        catch(Exception exc) {
            //to do
            exc.printStackTrace();
        }
        finally {
            db.close();
        }
        return event;
    }

    public List<Event> getFriendsEvents(String userId) {
        List<Event> events = new ArrayList();

        String ridUser = OrientIdentityUtil.decode(userId);

        String sqlFriend = "select union(in[label='friend'].out, out[label='friend'].in) from " + ridUser;
        String sqlEvent = "select from event where actor in ";

        OGraphDatabase db = dataSource.getDB();
        try {
            //get friends
            OSQLSynchQuery<ODocument> q = new OSQLSynchQuery(sqlFriend);
            List<ODocument> result = db.query(q);
            ODocument doc = result.get(0);
            List<String> uni = doc.field("union");
            System.out.println("union" + uni);
            System.out.println("union" + uni.size());

            //get friends' event
            sqlEvent = sqlEvent + uni;
            System.out.println("event query str: " + sqlEvent);

            q = new OSQLSynchQuery(sqlEvent);
            result = db.query(q);
            System.out.println(">>> events doc: " + result);
            for(ODocument eventDoc : result) {
                Event event = EventConverter.buildEvent(eventDoc);
                events.add(event);
            }

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
