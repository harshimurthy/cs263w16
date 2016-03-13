package eventize.model;


import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Events
{
	String eventName;
	String eventTagline;


	public Events()
	{

	}

	//EventName getters and setters
	public String getEventName()
	{
		return eventName;
	}

	@XmlElement
	public void setEventName(String eventName)
	{
		this.eventName=eventName;
	}

	//Event tagline get and set
	public String getEventTagline()
	{
		return eventTagline;
	}

	@XmlElement
	public void setEventTagline(String eventTagline)
	{
		this.eventTagline=eventTagline;
	}
}