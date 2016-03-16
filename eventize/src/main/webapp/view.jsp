<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <title>Eventize!</title>
      <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />    
        <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
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

      </style>
     </head>
   <body>  

   <!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
  <li><a href="homepage.jsp">add</a></li>
  <li><a href="view.jsp">view</a></li>
  <li><a href="myevent.jsp">my events</a></li>
</ul> 

<ul id="dropdown2" class="dropdown-content">
  <li><a href="story.jsp">add</a></li>
  <li><a href="viewstory.jsp">view</a></li>
  <li><a href="mystory.jsp">my stories</a></li>
</ul>

   <nav class="cyan darken-4">
    <div class="nav-wrapper container">
      <a href="homepage.jsp" class="brand-logo" style="font-family:'Tangerine';font-size: 50px">Eventize!</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
      <li> 
      <%
      UserService userService = UserServiceFactory.getUserService();
      User user = userService.getCurrentUser();
      //if (user != null) 
        //resp.getWriter().println("Welcome, " + user.getNickname());
      %>
      </li>
        <li><a href="#!" class="dropdown-button" data-activates="dropdown1"><i class="material-icons left">note_add</i>Events<i class="material-icons right">arrow_drop_down</i></a></li>
        <li><a href="#!" class="dropdown-button" data-activates="dropdown2"><i class="material-icons left">class</i>Story<i class="material-icons right">arrow_drop_down</i></a></li>
        
        <%
        
                           if(user==null)
                         response.sendRedirect("index.jsp");
        if(user!=null)
        %> 
                         <li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>"><i class="material-icons left">call_made</i>Signout</a>
                       

                         </li>
      </ul>
    </div>
  </nav>

  <!--

  Body

  -->

  <div class="row container">
        <div class="row">
          <div class="col s12 center">
            <p>
            <h5 style="font-family:'Tangerine';font-size: 50px;color:#e91e63"> View Information of all events</h5>
            </p>
            </div>
          </div>
        </div>


        <table class="striped responsive-table teal lighten-3" id="viewtable">
        <thead>
    
          <tr>
              <th data-field="eventName">Event Name</th>
              <th data-field="eventTagline">Event Tagline</th>
              <th data-field="eventDate">Date</th>
              <th data-field="eventTime">Time</th>
              <th data-field="duration">Duration</th>
              <th data-field="eventType">Type</th>
              <th data-field="eventHost">Host</th>
              <th data-field="purpose">Purpose</th>
              <th data-field="department">Department</th>
              <th data-field="capacity">Capacity</th>
              <th data-field="location">Location</th>
              <th data-field="description">Description</th>
              <th data-field="createrName">Creater Name</th>
              <th data-field="createrEmail">Creater Email</th>
              <th data-field="createrRole">Creater Role</th>
          </tr>
        </thead>

        <div id="eventindex">
        </div>

        
      </table>

      
<!--

Footer

-->

<footer class="page-footer cyan darken-4">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <a href="#" class="white-text"><h5>Eventize</h5></a>
                <p class="grey-text">Make things happen!</p>
              </div>
              <div class="col l4 offset-l2 s12 right">
                <h5 class="grey-text">Links</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="homepage.jsp">Create events</a>&nbsp;
                  <a class="grey-text text-lighten-3" href="view.jsp">View events</a>&nbsp;
                  <a class="grey-text text-lighten-3" href="myevent.jsp">My events</a>
                  </li>
                  <li><a class="grey-text text-lighten-3" href="story.jsp">Create stories</a>&nbsp;
                  <a class="grey-text text-lighten-3" href="viewstory.jsp">View stories</a>&nbsp;
                  <a class="grey-text text-lighten-3" href="mystory.jsp">My stories</a>
                  </li>
                  
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            &copy; 2016 All copyrights reserved
            <a class="pink-text text-lighten-2 right" href="http://harshithamurthy.com">Harshitha Chidananda</a>
            </div>
          </div>
        </footer>


        <!-- 


        Passing values to backend


        -->
        
        <script type="text/javascript">

        
        $( document ).ready(function() 
        {
                       

        $.ajax({
          url:"/rest/events",
          type:'GET',
          dataType:"json",
          success: function(data)
          {
            var i;
            for(i=0;i<data.length;i++)
            {
              var myEvents=data[i];
              var eventName=myEvents["eventName"];
              var eventTagline=myEvents["eventTagline"];
              
              var eventDate=myEvents["eventDate"];
              var eventTime=myEvents["eventTime"];
              var duration=myEvents["duration"];
              
              var eventType=myEvents["eventType"];
              
              var eventHost=myEvents["eventHost"];
              var purpose=myEvents["purpose"];
              var department=myEvents["department"];
              
              var capacity=myEvents["capacity"];
              var location=myEvents["location"];
              var description=myEvents["description"];
              var createrName=myEvents["createrName"];
              var createrEmail=myEvents["createrEmail"];
              var createrRole=myEvents["createrRole"];
             var id=myEvents["id"];
              $('#viewtable').append('<tbody><tr><td>' + eventName+ '</td>' + '<td>' + eventTagline + '</td>' + '<td>' + eventDate+ '</td>'+ '<td>' + eventTime + '</td>' + '<td>' + duration + '</td>' +'<td>'+ eventType+ '</td>'+ '<td>'+ eventHost+ '</td>'+ '<td>'+ purpose+ '</td>'+ '<td>'+ department+ '</td>'+ '<td>'+capacity + '</td>'+ '<td>'+ location+ '</td>'+ '<td>'+ description+ '</td>'+ '<td>'+ createrName+ '</td>'+ '<td>'+ createrEmail+ '</td>'+ '<td>'+createrRole + '</td></tr></tbody>');

                              
            
              
            }

          }


        })
        });
    
        </script>


   </body>   
</html>
