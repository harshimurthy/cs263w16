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
