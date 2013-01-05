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

    public List<Event> getTopicRelatedEvents(String userId, int num) {
        List<Event> events = null;

        String ridUser = OrientIdentityUtil.decode(userId);
        String sql = "select from event where type not in ['accept', 'accepted'] and (actor in (select union(in[label='friend'].out, out[label='friend'].in) from " + ridUser + ") or " + ridUser + " in notifies) order by published desc limit " + num;

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

    public List<Event> getFriendsEvents(String userId, int num) {
        List<Event> events = null;

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
        return events;
 
    }

    public List<Event> getLatestEvents(int num) {
        List<Event> events = null;

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
        return events;
 
    }

    public void test(String targetId) {
        OGraphDatabase db = dataSource.getDB();

        //final SortedSetMultimap<String, Set<ODocument>> multi = TreeMultimap.create();

        final Set<ODocument> published = new HashSet();

        OCommandPredicate p = new OCommandPredicate() {
            public Object evaluate(ORecord<?> iRecord, ODocument cur, OCommandContext ctx) {

                System.out.println(ctx);

                Object depth = ctx.getVariable("depth");
                System.out.println("depth class: " + depth.getClass());
                System.out.println("depth object: " + depth);

                Object path = ctx.getVariable("path");
                System.out.println("path class: " + path.getClass());
                System.out.println("path object: " + path);

                Object stack = ctx.getVariable("stack");
                System.out.println("stack class: " + stack.getClass());
                System.out.println("stack object: " + stack);
                for(Object obj : (List)stack) {
                    System.out.print("element class: " + obj.getClass() + ", " + "element object: " + obj + ";    ");
                }
                System.out.println();


        //        List<String> allowed = Arrays.asList("User", "Friend", "Publish", "Topic", "Plan", "Member");
                List<String> allowed = Arrays.asList("User", "Friend", "Publish", "Topic");

                ODocument doc = (ODocument)iRecord;
                String className = doc.getClassName();

                return true;

                /**
                if(allowed.contains(className)) {
                    if("Publish".equals(className)) {
                        published.add(doc);
                    }
                    return true;
                }
                return false;
                */
            }
        };

        String rid = OrientIdentityUtil.decode(targetId);
        OTraverse t = new OTraverse();
        t.field("out").field("in").field("topic").target(new ORecordId(rid)).predicate(p);

        try {
            System.out.println("===============>>>>>>>");
            for(OIdentifiable id : t) {
                System.out.println("++++" + id);
                System.out.println();
            }
            System.out.println("<<<<<<<<<=============");
        }
        catch(Exception exc) {
            //to do
            exc.printStackTrace();
        }
        finally {
            db.close();
        }

        System.out.println("----------------------------------");
        System.out.println(published.size());
    }
}
