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

	//memcache
	MemcacheService syncCache = MemcacheServiceFactory.getMemcacheService();

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Stories> getStories()
	{		
			ArrayList<Stories> stories;
			Stories story;
			Query q = new Query("STORIES");
			PreparedQuery pq = datastore.prepare(q);
			String CACHE_KEY="ALL_STORIES";
			stories=(ArrayList<Stories>)syncCache.get(CACHE_KEY);

			if(stories==null)
			{
				stories= new ArrayList<Stories>();
				for (Entity storiesEntity : pq.asIterable()) 
				{
					story = new Stories();			
					story.setTitle((String)storiesEntity.getProperty("title"));
					story.setAbout((String)storiesEntity.getProperty("about"));
					story.setTale((String)storiesEntity.getProperty("tale"));	

					story.setOwnerId((String)storiesEntity.getProperty("ownerId"));



								
					stories.add(story);
				}
				syncCache.put(CACHE_KEY,stories,Expiration.byDeltaSeconds(30));
			}
			return stories;
	}

	@GET
	@Path("/byOwner")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Stories> getActivitybyOwner()
		{
		
			ArrayList<Stories> stories = new ArrayList<Stories>();
			if(userService.getCurrentUser()!=null)

			{
				Stories story;
				Filter byOwner = new FilterPredicate("ownerId", FilterOperator.EQUAL, userService.getCurrentUser().getUserId());
        		Query q = new Query("STORIES").setFilter(byOwner);
				PreparedQuery pq = datastore.prepare(q);
				for (Entity storiesEntity : pq.asIterable()) {
					story = new Stories();
						
					story.setTitle((String)storiesEntity.getProperty("title"));
					story.setAbout((String)storiesEntity.getProperty("about"));
					story.setTale((String)storiesEntity.getProperty("tale"));
					story.setOwnerId((String)storiesEntity.getProperty("ownerId"));
					story.setId(KeyFactory.keyToString(storiesEntity.getKey()));

								
					stories.add(story);
			
				}
				
			}
			return stories;
	}

	@GET
	@Path("/MemcacheGet")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Stories> getAllStories()
	{
		System.out.println("came to memcache get");
		ArrayList<Stories> stories;
		String CACHE_KEY="ALL_STORIES";
		stories=(ArrayList<Stories>) syncCache.get(CACHE_KEY);
		return stories;
	}

	@POST
	@Consumes("application/json")
	public void createStories(Stories stories) {	

		Entity storiesEntity = new Entity("STORIES");
		String CACHE_KEY="STORIES";
		storiesEntity.setProperty("title", stories.getTitle());
		storiesEntity.setProperty("about", stories.getAbout());
		storiesEntity.setProperty("tale", stories.getTale());
		storiesEntity.setProperty("ownerId", userService.getCurrentUser().getUserId());		
		storiesEntity.setProperty("id",stories.getId());	
		datastore.put(storiesEntity);
		syncCache.put(CACHE_KEY,stories);
		
	}

	@POST
	@Path("/MemcachePost")
	@Consumes(MediaType.APPLICATION_JSON)
	public void addStoriesToCache(Stories story)
	{
		String CACHE_KEY="ALL_STORIES";
		ArrayList<Stories> stories;
		stories=(ArrayList<Stories>) syncCache.get(CACHE_KEY);
		if(stories==null)
		{
			stories=new ArrayList<Stories>();
		}
		stories.add(story);
		System.out.println("came to get memcache! "+stories.size());
		syncCache.put(CACHE_KEY,stories,Expiration.byDeltaSeconds(30));
	}


	//deleting

	@DELETE
  	@Path("/{id}")
  	public void deleteStories(@PathParam("id") String id) {

  	Queue queue = QueueFactory.getDefaultQueue();
  	queue.add(TaskOptions.Builder.withUrl("/rest/stories/taskQueue/"+id).method(TaskOptions.Method.DELETE));
	//datastore.delete(KeyFactory.stringToKey(id));
  }

	@DELETE
  	@Path("/taskQueue/{id}")
  	public void deleteStoriesQueue(@PathParam("id") String id) {

	datastore.delete(KeyFactory.stringToKey(id));
  }
}

