package calsync.resources;

import java.util.ArrayList;
import java.util.Date;
import java.util.List; 
import java.util.logging.Level;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;

import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import com.google.appengine.api.taskqueue.TaskOptions;
import calsync.model.Events;

import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.FilterOperator;

import com.google.appengine.api.memcache.ErrorHandlers;
import com.google.appengine.api.memcache.Expiration;
import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;

import com.google.appengine.api.users.*;

@Path("/events")
public class EventsResource {
	
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	UserService userService = UserServiceFactory.getUserService();

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Events> getEvents()
	{
		
		
			ArrayList<Events> events = new ArrayList<Events>();
			Events events;
			Query q = new Query("EVENTS");
			PreparedQuery pq = datastore.prepare(q);
			for (Entity eventsEntity : pq.asIterable()) 
			{
				events = new Events();
			
				events.setEventName((String)eventsEntity.getProperty("eventName"));
				events.setEventTagline((String)eventsEntity.getProperty("eventTagline"));
				events.setEventDate((String)eventsEntity.getProperty("eventDate"));
				events.setEventTime((String)eventsEntity.getProperty("eventTime"));
				events.setDuration((String)eventsEntity.getProperty("duration"));
				events.setEventType((String)eventsEntity.getProperty("eventType"));
				events.setEventHost((String)eventsEntity.getProperty("eventHost"));
				events.setPurpose((String)eventsEntity.getProperty("purpose"));
				events.setDepartment((String)eventsEntity.getProperty("department"));
				events.setCapacity((int)eventsEntity.getProperty("capacity"));				
				events.setLocation((String)eventsEntity.getProperty("location"));				
				events.setDescription((String)eventsEntity.getProperty("description"));

				events.setCreaterName((String)eventsEntity.getProperty("createrName"));
				events.setCreaterEmail((String)eventsEntity.getProperty("createrEmail"));
				events.setCreaterRole((String)eventsEntity.getProperty("createrRole"));	

				events.setOwnerId((String)eventsEntity.getProperty("ownerId"));	
				
				events.add(events);
			}
			return events;
	}



	@GET
	@Path("/byOwner")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Events> getEventsbyOwner()
    {
		
			ArrayList<Events> events= new ArrayList<Events>();
			if(userService.getCurrentUser()!=null)

			{
				Events events;
				Filter byOwner = new FilterPredicate("ownerId", FilterOperator.EQUAL, userService.getCurrentUser().getUserId());
        		Query q = new Query("EVENTS").setFilter(byOwner);
				PreparedQuery pq = datastore.prepare(q);
				for (Entity eventsEntity : pq.asIterable()) 
				{
					events = new Events();
						
				events.setEventName((String)eventsEntity.getProperty("eventName"));
				events.setEventTagline((String)eventsEntity.getProperty("eventTagline"));
				events.setEventDate((String)eventsEntity.getProperty("eventDate"));
				events.setEventTime((String)eventsEntity.getProperty("eventTime"));
				events.setDuration((String)eventsEntity.getProperty("duration"));
				events.setEventType((String)eventsEntity.getProperty("eventType"));
				events.setEventHost((String)eventsEntity.getProperty("eventHost"));
				events.setPurpose((String)eventsEntity.getProperty("purpose"));
				events.setDepartment((String)eventsEntity.getProperty("department"));
				events.setCapacity((int)eventsEntity.getProperty("capacity"));				
				events.setLocation((String)eventsEntity.getProperty("location"));				
				events.setDescription((String)eventsEntity.getProperty("description"));

				events.setCreaterName((String)eventsEntity.getProperty("createrName"));
				events.setCreaterEmail((String)eventsEntity.getProperty("createrEmail"));
				events.setCreaterRole((String)eventsEntity.getProperty("createrRole"));	

				events.setOwnerId((String)eventsEntity.getProperty("ownerId"));


				events.add(events);
			
				}
				
			}
			return events;	
	}

	@POST
	@Consumes("application/json")
	public void createEvents(Events events) {
		

		Entity eventsEntity = new Entity("EVENTS");
		eventsEntity.setProperty("eventName",events.getEventName());
		eventsEntity.setProperty("eventTagline", activity.getEventTagline());
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

		eventsEntity.setProperty("ownerId", userService.getCurrentUser().getUserId());
		datastore.put(eventsEntity);
		
	}
}