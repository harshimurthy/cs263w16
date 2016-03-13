package eventize.resources;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;


@Path("/hello")
public class HelloResource
{
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String getHello()
	{
		return "Got it!";
	}
}