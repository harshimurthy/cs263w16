package eventize;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class CreateEventJUnit4 {
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
  public void testCreateEventJUnit4() throws Exception {
    driver.get(baseUrl + "/");
    driver.findElement(By.linkText("inputLogin using your gmail account")).click();
    driver.findElement(By.id("Email")).clear();
    driver.findElement(By.id("Email")).sendKeys("harshithachidanand");
    driver.findElement(By.id("next")).click();
    driver.findElement(By.id("Passwd")).clear();
    driver.findElement(By.id("Passwd")).sendKeys("");
    driver.findElement(By.id("next")).click();
    driver.findElement(By.id("eventName")).clear();
    driver.findElement(By.id("eventName")).sendKeys("New events");
    driver.findElement(By.id("eventTagline")).clear();
    driver.findElement(By.id("eventTagline")).sendKeys("New is awesome");
    driver.findElement(By.xpath("//table[@id='eventDate_table']/tbody/tr[3]/td[6]/div")).click();
    driver.findElement(By.cssSelector("button.btn-flat.picker__close")).click();
    driver.findElement(By.id("eventTime")).clear();
    driver.findElement(By.id("eventTime")).sendKeys("9:00AM");
    driver.findElement(By.id("duration")).clear();
    driver.findElement(By.id("duration")).sendKeys("2 hours");
    driver.findElement(By.cssSelector("input.select-dropdown.active")).click();
    driver.findElement(By.cssSelector("li.active > span")).click();
    driver.findElement(By.cssSelector("input.select-dropdown.active")).click();
    driver.findElement(By.cssSelector("#select-options-815bcc23-dabb-d8e7-0c54-cc604715e2d4 > li.active > span")).click();
    driver.findElement(By.cssSelector("input.select-dropdown.active")).click();
    driver.findElement(By.cssSelector("#select-options-091efa9b-6d5f-ef96-ae17-69722f5ba9b7 > li.active > span")).click();
    driver.findElement(By.cssSelector("input.select-dropdown.active")).click();
    driver.findElement(By.cssSelector("#select-options-7ed503fc-e8cb-c3b8-0752-c157b27088ea > li.active > span")).click();
    driver.findElement(By.id("capacity")).clear();
    driver.findElement(By.id("capacity")).sendKeys("90");
    driver.findElement(By.id("location")).clear();
    driver.findElement(By.id("location")).sendKeys("HFH");
    driver.findElement(By.id("description")).clear();
    driver.findElement(By.id("description")).sendKeys("yep! come n see what new");
    driver.findElement(By.id("createrName")).clear();
    driver.findElement(By.id("createrName")).sendKeys("Harshitha");
    driver.findElement(By.id("createrEmail")).clear();
    driver.findElement(By.id("createrEmail")).sendKeys("har@gmail.com");
    driver.findElement(By.name("action")).click();
    driver.findElement(By.xpath("//ul[@id='nav-mobile']/li[3]/a")).click();
    driver.findElement(By.linkText("call_madeSignout")).click();
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
