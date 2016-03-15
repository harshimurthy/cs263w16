package com.example.tests;

import com.thoughtworks.selenium.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.regex.Pattern;

public class Events {
	private Selenium selenium;

	@Before
	public void setUp() throws Exception {
		selenium = new DefaultSelenium("localhost", 4444, "*chrome", "http://event-1240.appspot.com/");
		selenium.start();
	}

	@Test
	public void testEvents() throws Exception {
		selenium.open("/index.jsp");
		selenium.click("link=inputLogin using your gmail account");
		selenium.waitForPageToLoad("30000");
		selenium.type("id=Email", "harshithachidanand");
		selenium.click("id=next");
		selenium.waitForPageToLoad("30000");
		selenium.click("link=call_madeSignout");
		selenium.waitForPageToLoad("30000");
		selenium.click("link=inputLogin using your gmail account");
		selenium.waitForPageToLoad("30000");
		selenium.type("id=Email", "harshithachidanand");
		selenium.click("id=next");
		selenium.type("id=Passwd", "google@9");
		selenium.click("id=next");
		selenium.waitForPageToLoad("30000");
		selenium.click("//ul[@id='nav-mobile']/li[3]/a");
		selenium.waitForPageToLoad("30000");
		selenium.click("//ul[@id='nav-mobile']/li[4]/a");
		selenium.waitForPageToLoad("30000");
		selenium.type("id=title", "hi");
		selenium.type("id=about", "hi");
		selenium.type("id=tale", "i");
		selenium.click("name=action");
		selenium.waitForPageToLoad("30000");
		selenium.click("//ul[@id='nav-mobile']/li[5]/a");
		selenium.waitForPageToLoad("30000");
		selenium.click("id=deleteEvent");
		assertEquals("Event was successfully deleted", selenium.getAlert());
		selenium.click("link=call_madeSignout");
		selenium.waitForPageToLoad("30000");
	}

	@After
	public void tearDown() throws Exception {
		selenium.stop();
	}
}
