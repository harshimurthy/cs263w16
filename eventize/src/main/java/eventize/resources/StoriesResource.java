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
import eventize.model.Stories;


import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.FilterOperator;

import com.google.appengine.api.memcache.ErrorHandlers;
import com.google.appengine.api.memcache.Expiration;
import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;

import com.google.appengine.api.users.*;

@Path("/stories")
public class StoriesResource {


	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	UserService userService = UserServiceFactory.getUserService();

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Stories> getStories()
	{		
			ArrayList<Stories> stories= new ArrayList<Stories>();
			Stories story;
			Query q = new Query("STORIES");
			PreparedQuery pq = datastore.prepare(q);
			for (Entity storiesEntity : pq.asIterable()) 
			{
				story = new Stories();			
				story.setTitle((String)storiesEntity.getProperty("title"));

				story.setAbout((String)storiesEntity.getProperty("about"));
				story.setTale((String)storiesEntity.getProperty("tale"));				
				stories.add(story);
			}
			return stories;
	}

	@POST
	@Consumes("application/json")
	public void createStories(Stories stories) {	

		Entity storiesEntity = new Entity("STORIES");
		storiesEntity.setProperty("title", stories.getTitle());
		storiesEntity.setProperty("about", stories.getAbout());
		storiesEntity.setProperty("tale", stories.getTale());			
		datastore.put(storiesEntity);
		
	}
}

