package calsync.resources;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
@PATH("/trial")
public class trialResources
{
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String getTrial()
	{
		return "Got it!";
	}
}