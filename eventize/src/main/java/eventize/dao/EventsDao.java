

package eventize.dao;

import java.util.ArrayList;
import java.util.Date;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import eventize.model.Events;



public class EventsDao {
	
	private static DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();;
	public static String EVENTS_KIND = "EVENTS";
	
	
	public EventsDao(){
		
	}
	
	
	public void addEvents(Events events)
	{
		Entity eventsEntity = new Entity(EVENTS_KIND);
		eventsEntity.setProperty("eventName", events.getEventName());
		eventsEntity.setProperty("eventTagline", events.getEventTagline());
		eventsEntity.setProperty("eventDate", events.getEventDate());
		eventsEntity.setProperty("eventTime", events.getEventTime());
		eventsEntity.setProperty("duration", events.getDuration());
		eventsEntity.setProperty("eventType", events.getEventType());
		eventsEntity.setProperty("eventHost", events.getEventHost());
		eventsEntity.setProperty("purpose", events.getPurpose());
		eventsEntity.setProperty("department", events.getDepartment());
		eventsEntity.setProperty("capacity", events.getCapacity());
		eventsEntity.setProperty("location", events.getLocation());
		eventsEntity.setProperty("description", events.getDescription());

		eventsEntity.setProperty("createrName", events.getCreaterName());
		eventsEntity.setProperty("createrEmail", events.getCreaterEmail());
		eventsEntity.setProperty("createrRole", events.getCreaterRole());
		datastore.put(eventsEntity);
	}
	
	
	
}
