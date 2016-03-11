/**

package calsync.model;


import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;



@XmlRootElement
public class EventsInstance {
	long ID;
	long eventsId;

	//String participantId;
	

	//default constructor is a must!
	public EventsInstance()
	{
		
	}

	//get and set the id
	public long getID() {
		return ID;
	}
	public void setID(long id) {
		ID = id;
	}
	
	//get and set the eventsId
	public Long getEventsId() {
		return eventsId;
	}
	public void setEventsId(Long eventsId) {
		this.eventsId = eventsId;
	}
	
	/**
	  *future scope to include participants

	public String getParticipantId() {
		return participantId;
	}
	
	public void setParticipantId(String participantId) {
		this.participantId = participantId;
	}

	*/
	
	

