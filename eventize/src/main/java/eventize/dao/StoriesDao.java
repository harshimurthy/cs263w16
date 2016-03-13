
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
import eventize.model.Stories;



public class StoriesDao {
	
	private static DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();;
	public static String STORIES_KIND = "STORIES";
	
	
	public StoriesDao(){
		
	}
	
	
	public void addStories(Stories stories)
	{
		Entity storiesEntity = new Entity(STORIES_KIND);
		storiesEntity.setProperty("title", stories.getTitle());
		storiesEntity.setProperty("about", stories.getAbout());
		storiesEntity.setProperty("tale", stories.getTale());
		
		datastore.put(storiesEntity);
	}
	
	
	
}


