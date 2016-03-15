package eventize.model;


import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import java.util.Date;

import java.io.Serializable;


@XmlRootElement
public class Stories implements Serializable
{
	private static final long serialVersionUID = 1L;
	String title;
	String about;
	String tale;

	String ownerId;
	
	public Stories()
	{

	}

	//Title getters and setters
	public String getTitle()
	{
		return title;
	}

	@XmlElement
	public void setTitle(String title)
	{
		this.title=title;
	}

	//ABout get and set
	public String getAbout()
	{
		return about;
	}

	@XmlElement
	public void setAbout(String about)
	{
		this.about=about;
	}

	//story getters and setters
	public String getTale()
	{
		return tale;
	}

	@XmlElement
	public void setTale(String tale)
	{
		this.tale=tale;
	}

	public String getOwnerId() {
		return ownerId;
	}
	@XmlElement
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
		
}