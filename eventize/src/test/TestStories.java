package eventize.model;
import java.net.URI;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;
import org.glassfish.jersey.client.ClientConfig;
import org.junit.Test;
import com.google.appengine.api.datastore.KeyFactory;
public class TestStories
{
  	   	ClientConfig config = new ClientConfig();
        Client client = ClientBuilder.newClient(config);
    	WebTarget service = client.target(getBaseURI());
        @Test
        public void createStoriesTest() throws Exception 
        {        
            Stories stories = new Stories();
            stories.setTitle("First day at UCSB");
            stories.setAbout("Experience at UCSB!");
            stories.setTale("UCSB is a beautiful place. The view at the beach is breath taking. Its serence and beautiful. CS at UCSB is well known and has good on going research!. My experience is totally so good here!. I am enjoying here at UCSB. But ofcourse I miss home.");
            boolean passed = true;                  
            Response response = service.path("rest").path("stories").request(MediaType.APPLICATION_JSON).post(Entity.entity(stories,MediaType.APPLICATION_JSON),Response.class);
            int status = response.getStatus();
            if (status != 204) 
            {
                System.out.println("Creating stories test Failed: Expected status 204, got: "+status);
            {
                System.out.println("Yess!Creating stories test Passed!");                
            }        
        }
        @Test
        public void getAllStoriesTest() throws Exception 
        {        
            String s = "";
            Stories stories = new Stories();
            boolean passed = true;
            stories.setTitle("Second day at UCSB");
            stories.setAbout("Life at UCSB!");
            stories.setTale("UCSB is a beautiful place. The view at the beach is breath taking. Its serence and beautiful. CS at UCSB is well known and has good on going research!. My experience is totally so good here!. I am enjoying here at UCSB. But ofcourse I miss home.");
            Response response = service.path("rest").path("stories").request(MediaType.APPLICATION_JSON).post(Entity.entity(stories,MediaType.APPLICATION_JSON),Response.class);
            try
            {                
                s = service.path("rest").path("stories").request().accept(MediaType.APPLICATION_JSON).get(String.class);
            }
             catch (Exception e ) 
             {
                passed = false;
                //System.out.println("GET stories failed with exception: "+ e.toString() +" " );
            }            
            if(passed)
            {
                System.out.println("Yess! GET Stories passed!");
                System.out.println(response.getStatus()); 
            }                         
        }
        @Test
        public void getStoriesFromMemcacheTest() throws Exception 
        {
            String s = "";
            boolean passed = true;
            Stories stories = new Stories();
            stories.setTitle("Third day at UCSB");
            stories.setAbout("Life at UCSB!");
            stories.setTale("UCSB is a beautiful place. The view at the beach is breath taking. Its serence and beautiful. CS at UCSB is well known and has good on going research!. My experience is totally so good here!. I am enjoying here at UCSB. But ofcourse I miss home.");
          

            Response response = service.path("rest").path("stories").path("toMemcache").request(MediaType.APPLICATION_JSON).post(Entity.entity(stories,MediaType.APPLICATION_JSON),Response.class);
            
            try {
                s = service.path("rest").path("stories").path("MemcacheGet").request().accept(MediaType.APPLICATION_JSON).get(String.class);

            } catch (Exception e ) {
                passed = false;
                System.out.println("GET from Memcache of stories failed with exception "+ e);
            }
            
            if(passed)
            {
                System.out.println("Yes!! GET from Stories Memcache works");
                System.out.println(response.getStatus()); 
            }
        }


        //POST AN ACTIVITY TO MEMCACHE
        @Test
        public void addStoriesToCacheTest() throws Exception {
        
            Stories stories = new Stories();
            stories.setTitle("First week at UCSB");
            stories.setAbout("Life at UCSB!");
            stories.setTale("UCSB is a beautiful place. The view at the beach is breath taking. Its serence and beautiful. CS at UCSB is well known and has good on going research!. My experience is totally so good here!. I am enjoying here at UCSB. But ofcourse I miss home.");
          
            Response response = service.path("rest").path("stories").path("MemcachePOST").request(MediaType.APPLICATION_JSON).post(Entity.entity(stories,MediaType.APPLICATION_JSON),Response.class);
            int status = response.getStatus();
            if (status != 204) 
            {
                System.out.println("POST stories memcache failed : "+status);
            } 
            else 
            {
                System.out.println("Yess!!POST stories memcache Passed.");
                System.out.println(response.getStatus());
                
            }
        
        }

     
    
    private static URI getBaseURI() {
        return UriBuilder.fromUri("https://events-2016.appspot.com/").build();
    }

    }