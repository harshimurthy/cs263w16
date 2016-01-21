
package cs263w16;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.util.logging.*;
import com.google.appengine.api.datastore.*;
import com.google.appengine.api.memcache.*;

@SuppressWarnings("serial")
public class DatastoreServlet extends HttpServlet {

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
      resp.setContentType("text/html");
      resp.getWriter().println("<html><body>");
      
      DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
      MemcacheService syncCache = MemcacheServiceFactory.getMemcacheService();
      syncCache.setErrorHandler(ErrorHandlers.getConsistentLogAndContinue(Level.INFO));

      
      if(!req.getParameterNames().hasMoreElements()){  // if no parameters passed in
      	try{
      		Query fetchAllTaskData = new Query("TaskData");
	      	PreparedQuery results = datastore.prepare(fetchAllTaskData); 
	      	resp.getWriter().println("<b><i>Items of kind \'TaskData\' in the datastore. </b></i><br/><br/>");
	  		for(Entity taskDataElement : results.asIterable()){
	        	resp.getWriter().println("<b>(Datastore)</b><br/>");
	        	if(syncCache.get(taskDataElement.getKey()) != null){
	        		resp.getWriter().println("<b>(Found in Memcache) as well.</b><br/>");
	        	}
	        	resp.getWriter().println("" + taskDataElement.getProperty("value") + "<br/>");
	        	resp.getWriter().println("" + taskDataElement.getProperty("date") + "<br/><br/>");
	    	}



	    }catch(Exception e){
	    	resp.getWriter().println("Sorry. " + e.getMessage());
	    }
      }
      else if(req.getParameter("keyname") != null && req.getParameter("value") == null){
      	try{
      		
      		String result = (String)syncCache.get(KeyFactory.createKey("TaskData", req.getParameter("keyname")));
      		if(result != null){
      			resp.getWriter().println("Found Entity : "+ req.getParameter("keyname") + "<br/>(both)");
	      		resp.getWriter().println("<b> " + result + "</b><br/><br/>");
	        	//date not stored in memcache
	        	//resp.getWriter().println("<b> " + result.getProperty("date") + "</b><br/>");	
      		}
      		else{
      			Entity result2 = datastore.get(KeyFactory.createKey("TaskData", req.getParameter("keyname")));
      			syncCache.put(result2.getKey(), result2.getProperty("value")); // Populate cache.
	      		resp.getWriter().println("Found Entity : " + req.getParameter("keyname") + "(Datastore)<br/>");
	      		resp.getWriter().println("" + result2.getProperty("value") + "<br/>");
	        	      resp.getWriter().println("" + result2.getProperty("date") + "<br/><br/>");	
	            }
      	}catch(Exception e){
      		resp.getWriter().println("Neither! " + e.getMessage());
      	}
      }
      else if(req.getParameter("keyname") != null && req.getParameter("value") != null){
      	try{
      		Entity ntd = new Entity("TaskData", req.getParameter("keyname"));
      		ntd.setProperty("value", req.getParameter("value"));
      		ntd.setProperty("date", new Date());
      		datastore.put(ntd);
      		syncCache.put(ntd.getKey(), ntd.getProperty("value")); // Populate cache.
      		resp.getWriter().println("Stored KEY: " + req.getParameter("keyname") + " and VALUE: " + req.getParameter("value") + " in Datastore and Memcache.");
      	}catch(Exception e){
      		resp.getWriter().println("AN ERROR OCCURED" + e.getMessage());	
      	}
      }
      else{
      	resp.getWriter().println("Sorry, Invalid inputs");	
      }

      resp.getWriter().println("</body></html>");
  }
}

/**
package cs263w16;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.util.logging.*;
import com.google.appengine.api.datastore.*;
import com.google.appengine.api.memcache.*;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@SuppressWarnings("serial")
public class DatastoreServlet extends HttpServlet {

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
      resp.setContentType("text/html");
      resp.getWriter().println("<html><body>");
      resp.getWriter().println("<h2>Hello World, says Harshitha </h2>"); //remove this line

	String name=req.getParameter("name");
	String value=req.getParameter("values");
	String kind=req.getParameter("kind");
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();


	if(name==null && value==null)
	{
		Query q=new Query("TaskData");
		PreparedQuery pq=datastore.prepare(q);
		List<String> list=new ArrayList<>();
		resp.getWriter().println("The contents of datastore are <br>");

		for(Entity result:pq.asIterable())
		{
			Key obtainKey=result.getKey();
			String entity_name=obtainKey.getName();
			list.add(entity_name);
			
			String entity_value=(String)result.getProperty("value");
			Date entity_date=(Date)result.getProperty("date");
			
			resp.getWriter().println(" Stored "+entity_name+" and  "+entity_value+" in Datastore<br>");
			

		}
	}
	else if(name!=null && value!=null)
	{
		Entity tne=new Entity("TaskData",name);
		Key item_keys=KeyFactory.createKey("TaskData",name);
		tne.setProperty("value",value);
		Date currentDate=new Date();
		tne.setProperty("date",currentDate);
		datastore.put(tne);	
	}
	else
	{
		resp.getWriter().println("Sorry, You have entered an invalid input")	;
	}	   

   //Add your code here

      resp.getWriter().println("</body></html>");
  }
}


*/
