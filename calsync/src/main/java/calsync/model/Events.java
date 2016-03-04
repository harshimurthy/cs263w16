package calsync.model;


import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Events
{
	String eventName;
	String startDate;
	String startTime;
	String endDate;
	String endTime;
	String eventType;
	String eventHost;
	String department;
	int capacity;
	String purpose;
	String description;


	String createrName;
	String createrOrg;
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

	//Event startDate getters and setters
	public String getStartDate()
	{
		return startDate;
	}

	@XmlElement
	public void setStartDate(String startDate)
	{
		this.startDate=startDate;
	}

	//Event startTime get and set
	public String getStartTime()
	{
		return startDate;
	}

	@XmlElement
	public void setStartTime(String startDate)
	{
		this.startDate=startDate;
	}

	//Event endDate get and set
	public String getEndDate()
	{
		return endDate;
	}

	@XmlElement
	public void setEndDate(String endDate)
	{
		this.endDate=endDate;
	}

	//Event endTime get and set
	public String getEndTime()
	{
		return endDate;
	}

	@XmlElement
	public void setStartTime(String startDate)
	{
		this.startDate=startDate;
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

	//purpose of the event - get and set
	public String getPurpose()
	{
		return purpose;
	}

	@XmlElement
	public void setPurpose(String purpose)
	{
		this.purpose=purpose;
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
	public String getCreaterOrg()
	{
		return createrOrg;
	}

	@XmlElement
	public void setCreaterOrg(String createrOrg)
	{
		this.createrOrg=createrOrg;
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