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

public class TestEvents
{
  	   	ClientConfig config = new ClientConfig();
        Client client = ClientBuilder.newClient(config);
    	WebTarget service = client.target(getBaseURI());

        @Test
        public void getAllEventsTest() throws Exception 
        {        
            String s = "";
            Events events = new Events();
            boolean passed = true;

                      
            events.setEventName("Second day at UCSB");
            events.setEventTagline("Life at UCSB!");
            events.setEventDate("03/27/2016");
            events.setEventTime("9");
            events.setDuration("2");
            events.setEventType("entertainment");
            events.setEventHost("Life at UCSB!");
            events.setPurpose("entertainment");
            events.setDepartment("BL ST");
            events.setCapacity("9");
            events.setLocation("jg");
            events.setDescription("UCSB is a beautiful place. The view at the beach is breath taking. Its serence and beautiful. CS at UCSB is well known and has good on going research!. My experience is totally so good here!. I am enjoying here at UCSB. But ofcourse I miss home.");
            events.setCreaterName("Me");
            events.setCreaterEmail("Me@stu.com");
            events.setCreaterRole("student");
            Response response = service.path("rest").path("events").request(MediaType.APPLICATION_JSON).post(Entity.entity(events,MediaType.APPLICATION_JSON),Response.class);
            try
            {                
                s = service.path("rest").path("events").request().accept(MediaType.APPLICATION_JSON).get(String.class);
            }
             catch (Exception e ) 
             {
                passed = false;
                System.out.println("GET events failed with exception: "+ e +" " );
            }            
            if(passed)
            {
                System.out.println("Yess! GET Events passed!");
                System.out.println(response.getStatus()); 
            }                         
        }
        
       @Test
        public void createEventsTest() throws Exception 
        {        
            Events events = new Events();
            events.setEventName("Second day at UCSB");
            events.setEventTagline("Life at UCSB!");
            events.setEventDate("03/27/2016");
            events.setEventTime("9");
            events.setDuration("2");
            events.setEventType("entertainment");
            events.setEventHost("Life at UCSB!");
            events.setPurpose("entertainment");
            events.setDepartment("BL ST");
            events.setCapacity("9");
            events.setLocation("jg");
            events.setDescription("UCSB is a beautiful place. The view at the beach is breath taking. Its serence and beautiful. CS at UCSB is well known and has good on going research!. My experience is totally so good here!. I am enjoying here at UCSB. But ofcourse I miss home.");
            events.setCreaterName("Me");
            events.setCreaterEmail("Me@stu.com");
            events.setCreaterRole("student");boolean passed = true;                  
            Response response = service.path("rest").path("events").request(MediaType.APPLICATION_JSON).post(Entity.entity(events,MediaType.APPLICATION_JSON),Response.class);
            int status = response.getStatus();
            if (status != 204) 
            {
                System.out.println("Creating events test Failed: Expected status 204");
            }
            else
            {
                System.out.println("Yess!Creating events test Passed!");                
            }        
        }    
    
    private static URI getBaseURI() 
    {
        return UriBuilder.fromUri("https://events-2016.appspot.com/").build();
    }

}