<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="cs263w16.AppDao.*" %>
<%@ page import="cs263w16.AppUser" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
   
    <title>Homepage</title>



</head>

<body>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    // Check if the user is already in the datastore.
    AppDao dao = AppDaoFactory.getAppDao();
    AppUser appUser = dao.getUser(user.getUserId());
    if (appUser != null) {
        response.sendRedirect("/calsync.jsp");
    }
%>

<div class="container">

    <div class="starter-template">
        <h1>Sign Up</h1>
        <p class="lead">Welcome. Please enter some quick information and you are all set. </p>
        <form action="/newuser"  method="post">
         <div class="form-group">
           <label for="inputEmail">Email address</label>
           <input type="email" class="form-control" name="inputEmail" placeholder="test@example.com">
         </div>
         <div class="form-group">
           <label for="inputFirstName">First Name</label>
           <input type="text" class="form-control" name="inputFirstName" placeholder="">
         </div>
         <div class="form-group">
           <label for="inputLastName">Last Name</label>
           <input type="text" class="form-control" name="inputLastName" placeholder="">
         </div>
         <div class="form-group">
           <label for="inputUserName">User Name</label>
           <input type="text" class="form-control" name="inputUserName" placeholder="">
         </div>
         <button type="submit" class="btn btn-default">Continue</button>
        </form>

    </div>


</div
