<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<head>
      <title>Eventize!</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">      
      <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Tangerine">
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>           
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 

      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.8.10/jquery.timepicker.js"></script>
      <style>
      .greencolor
      {
        color:#26a69a;
      }
      .pinkcolor
      {
        color:#e91e63;
      }
      .bgimage
      {
        content: ' ';
    display: block;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    opacity: 0.6;
    background-image: url('images/ucsb2.jpg');
    background-repeat: no-repeat;
    background-position: 50% 0;
    -ms-background-size: cover;
    -o-background-size: cover;
    -moz-background-size: cover;
    -webkit-background-size: cover;
    background-size: cover;
    }
      </style>
<body>


             

  <div class="row">
    <div class="bgimage"/>

       <div class="row cyan darken-4 center" >
        <div class="col s12 m12 l12">
        <a href="#" class="brand-logo" style="font-family:'Tangerine';font-size: 50px;color:white">Eventize!</a>
        <p>-Make things Happen!</p>
        </div>
      </div>

      <div class="row center">
        <div class="col s12 m12 l12">
        <p style="font-family:'Tangerine';font-size: 50px;color:white ;font-weight: bolder; ">Responsive Multi-Purpose Application for keeping track of all the events at your University</p>
        </div>
      </div>

      <div class="row container center">
       <div class="col s12 m12 l12">
        <a href="#" class="waves-effect waves-light btn-large teal darken-3 center"><i class="material-icons left">cloud</i>Know Everything about Eventize!</a>
        </div>
      </div>
          
      <div class="row container center">
        <div class="col s12 m12 l12">

        <%
          UserService userService = UserServiceFactory.getUserService();
          User user = userService.getCurrentUser();
          if (user != null) {
            pageContext.setAttribute("user", user); 
            response.sendRedirect("homepage.jsp"); 
          }
          if(user==null){ 
        %>
        <a href="<%= userService.createLoginURL(request.getRequestURI()) %>" class="teal darken-3 waves-effect waves-light btn-large">
                                  <i class="material-icons left">input</i>Login using your gmail account</a>
        <%                       
              }
         %> 

         </div>
       </div>
    </div>
  </div>


</body>
</html>