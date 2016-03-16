package eventize.resources;

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
import eventize.model.Events;


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
			Events event;
			Query q = new Query("EVENTS");
			PreparedQuery pq = datastore.prepare(q);
			for (Entity eventsEntity : pq.asIterable()) 
			{
				event = new Events();			
				event.setEventName((String)eventsEntity.getProperty("eventName"));
				event.setEventTagline((String)eventsEntity.getProperty("eventTagline"));
				event.setEventDate((String)eventsEntity.getProperty("eventDate"));				
				event.setEventTime((String)eventsEntity.getProperty("eventTime"));
				event.setDuration((String)eventsEntity.getProperty("duration"));				
				event.setEventType((String)eventsEntity.getProperty("eventType"));				
				event.setEventHost((String)eventsEntity.getProperty("eventHost"));
				event.setPurpose((String)eventsEntity.getProperty("purpose"));
				event.setDepartment((String)eventsEntity.getProperty("department"));
				event.setCapacity((String)eventsEntity.getProperty("capacity"));				
				event.setLocation((String)eventsEntity.getProperty("location"));				
				event.setDescription((String)eventsEntity.getProperty("description"));
				event.setCreaterName((String)eventsEntity.getProperty("createrName"));
				event.setCreaterEmail((String)eventsEntity.getProperty("createrEmail"));
				event.setCreaterRole((String)eventsEntity.getProperty("createrRole"));	
				//event.setTId((String)eventsEntity.getProperty("TId"));
				event.setOwnerId((String)eventsEntity.getProperty("ownerId"));
				event.setId(KeyFactory.keyToString(eventsEntity.getKey()));
				

				events.add(event);
			}
			return events;
	}

	@GET
	@Path("/byOwner")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Events> getActivitybyOwner()
		{
		
			ArrayList<Events> events = new ArrayList<Events>();
			if(userService.getCurrentUser()!=null)

			{
				Events event;
				Filter byOwner = new FilterPredicate("ownerId", FilterOperator.EQUAL, userService.getCurrentUser().getUserId());
        		Query q = new Query("EVENTS").setFilter(byOwner);
				PreparedQuery pq = datastore.prepare(q);
				for (Entity eventsEntity : pq.asIterable()) {
					event = new Events();						
					event.setEventName((String)eventsEntity.getProperty("eventName"));
				event.setEventTagline((String)eventsEntity.getProperty("eventTagline"));
				event.setEventDate((String)eventsEntity.getProperty("eventDate"));				
				event.setEventTime((String)eventsEntity.getProperty("eventTime"));
				event.setDuration((String)eventsEntity.getProperty("duration"));				
				event.setEventType((String)eventsEntity.getProperty("eventType"));				
				event.setEventHost((String)eventsEntity.getProperty("eventHost"));
				event.setPurpose((String)eventsEntity.getProperty("purpose"));
				event.setDepartment((String)eventsEntity.getProperty("department"));
				event.setCapacity((String)eventsEntity.getProperty("capacity"));				
				event.setLocation((String)eventsEntity.getProperty("location"));				
				event.setDescription((String)eventsEntity.getProperty("description"));
				event.setCreaterName((String)eventsEntity.getProperty("createrName"));
				event.setCreaterEmail((String)eventsEntity.getProperty("createrEmail"));
				event.setCreaterRole((String)eventsEntity.getProperty("createrRole"));
				event.setOwnerId((String)eventsEntity.getProperty("ownerId"));
				event.setId(KeyFactory.keyToString(eventsEntity.getKey()));								
					events.add(event);
			
				}
				
			}
			
			
			return events;
	}

	@POST
	@Consumes("application/json")
	public void createEvents(Events events) {
		

		Entity eventsEntity = new Entity("EVENTS");
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
		//eventsEntity.setProperty("TId", events.getTId());	
		if(userService.getCurrentUser()!=null)
		eventsEntity.setProperty("ownerId", userService.getCurrentUser().getUserId());		
		eventsEntity.setProperty("id",events.getId());
		datastore.put(eventsEntity);
		
	}

	@DELETE
  	@Path("/{id}")
  	public void deleteEvents(@PathParam("id") String id) {

  	Queue queue = QueueFactory.getDefaultQueue();
  	queue.add(TaskOptions.Builder.withUrl("/rest/events/taskQueue/"+id).method(TaskOptions.Method.DELETE));
	//datastore.delete(KeyFactory.stringToKey(id));
  }

	@DELETE
  	@Path("/taskQueue/{id}")
  	public void deleteEventsQueue(@PathParam("id") String id) {

	datastore.delete(KeyFactory.stringToKey(id));
  }
}

