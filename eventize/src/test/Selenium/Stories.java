package eventize;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class Stories {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://events-2016.appspot.com/";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testStories() throws Exception {
    driver.get(baseUrl + "/homepage.jsp");
    driver.findElement(By.xpath("//ul[@id='nav-mobile']/li[4]/a")).click();
    driver.findElement(By.id("title")).clear();
    driver.findElement(By.id("title")).sendKeys("This is a story about UCSB");
    driver.findElement(By.id("about")).clear();
    driver.findElement(By.id("about")).sendKeys("Experience at UCSB");
    driver.findElement(By.id("tale")).clear();
    driver.findElement(By.id("tale")).sendKeys("Experience at UCSB\nExperience at UCSB\nExperience at UCSB\nExperience at UCSB\nExperience at UCSB");
    driver.findElement(By.name("action")).click();
    driver.findElement(By.xpath("//ul[@id='nav-mobile']/li[5]/a")).click();
    driver.findElement(By.id("deleteEvent")).click();
    assertEquals("Event was successfully deleted", closeAlertAndGetItsText());
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
