package eventize.model;


import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Stories
{
	String title;
	String about;
	String tale;
	
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
		
}