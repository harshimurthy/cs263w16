
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<body>
		      Hello      <%
                            UserService userService = UserServiceFactory.getUserService();
                           User user = userService.getCurrentUser();
                            if (user != null) {
                                pageContext.setAttribute("user", user);  }
			if(user==null){ 
                            %>
                            <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">
                                </i>Login
                           </a>
                    <%
                        
 			}

                    %> 
<br/>
Hey <% System.out.println("hello");
System.out.println(user); %>                      
                         <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>" >
                            </i>Logout
                        </a>


                 </body>
</html>
