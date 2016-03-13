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
	String eventDate;
	String eventTime;
	String duration;
	String eventType;
	String eventHost;
	String purpose;
	String department;
	String capacity;
	String location;	
	String description;


	String createrName;
	String createrEmail;
	String createrRole;


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

	//Event startDate getters and setters
	public String getEventDate()
	{
		return eventDate;
	}

	@XmlElement
	public void setEventDate(String eventDate)
	{
		this.eventDate=eventDate;
	}
	//Event startTime get and set
	public String getEventTime()
	{
		return eventTime;
	}

	@XmlElement
	public void setEventTime(String eventTime)
	{
		this.eventTime=eventTime;
	}

	
	//Event duration get and set
	public String getDuration()
	{
		return duration;
	}

	@XmlElement
	public void setDuration(String duration)
	{
		this.duration=duration;
	}


	//EventType get and set
	public String getEventType()
	{
		return eventType;
	}

	@XmlElement
	public void setEventType(String eventType)
	{
		this.eventType=eventType;
	}

	//EventHost get and set
	public String getEventHost()
	{
		return eventHost;
	}

	@XmlElement
	public void setEventHost(String eventHost)
	{
		this.eventHost=eventHost;
	}

	//purpose get and set
	public String getPurpose()
	{
		return purpose;
	}

	@XmlElement
	public void setPurpose(String purpose)
	{
		this.purpose=purpose;
	}

	//department hosted by - get and set
	public String getDepartment()
	{
		return department;
	}

	@XmlElement
	public void setDepartment(String department)
	{
		this.department=department;
	}

	//capacity hosted by - get and set
	public String getCapacity()
	{
		return capacity;
	}

	@XmlElement
	public void setCapacity(String capacity)
	{
		this.capacity=capacity;
	}
	

	//location of the event - get and set
	public String getLocation()
	{
		return location;
	}

	@XmlElement
	public void setLocation(String location)
	{
		this.location=location;
	}

	//description of the event - get and set
	public String getDescription()
	{
		return description;
	}

	@XmlElement
	public void setDescription(String description)
	{
		this.description=description;
	}


	/** Creaters Information
	  * Info about the person creating the event
	  */

	//Creater of event Name- get and set

	public String getCreaterName()
	{
		return createrName;
	}

	@XmlElement
	public void setCreaterName(String createrName)
	{
		this.createrName=createrName;
	}

	//Creater of event Organization- get and set
	public String getCreaterEmail()
	{
		return createrEmail;
	}

	@XmlElement
	public void setCreaterEmail(String createrEmail)
	{
		this.createrEmail=createrEmail;
	}

	//Creater of event Role- get and set
	public String getCreaterRole()
	{
		return createrRole;
	}

	@XmlElement
	public void setCreaterRole(String createrRole)
	{
		this.createrRole=createrRole;
	}
	
}