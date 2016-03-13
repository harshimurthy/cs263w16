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
				events.add(event);
			}
			return events;
	}

	@POST
	@Consumes("application/json")
	public void createEvents(Events events) {
		

		Entity eventsEntity = new Entity("EVENTS");
		eventsEntity.setProperty("eventName", events.getEventName());
		eventsEntity.setProperty("eventTagine", events.getEventTagline());
		
		datastore.put(eventsEntity);
		
	}
}

