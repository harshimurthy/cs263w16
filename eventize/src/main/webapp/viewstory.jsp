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
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />    
        <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>    
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
      .stylishfont
      {
        font-family:'Tangerine';
        font-size: 30px;
        font-weight: bold;
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
    
    background-image: url('images/ucsb3.jpg');
    background-repeat: no-repeat;
    background-position: 50% 0;
    -ms-background-size: cover;
    -o-background-size: cover;
    -moz-background-size: cover;
    -webkit-background-size: cover;
    background-size: cover;
    }

    .divoverflow
    {
      
      word-wrap: break-word; 
    }

      </style>
     </head>
   <body>  

   <div class="bgimage">

   <nav class="cyan darken-4">
    <div class="nav-wrapper container">
      <a href="#" class="brand-logo" style="font-family:'Tangerine';font-size: 50px">Eventize!</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
      <li> 
      <%
      UserService userService = UserServiceFactory.getUserService();
      User user = userService.getCurrentUser();
      //if (user != null) 
        //resp.getWriter().println("Welcome, " + user.getNickname());
      %>
      </li>
        <li><a href="homepage.jsp"><i class="material-icons left">note_add</i>Create event</a></li>
        <li><a href="view.jsp"><i class="material-icons left">visibility</i>View events</a></li>
        <li><a href="story.jsp"><i class="material-icons left">class</i>Write a Story</a></li>
        <li><a href="viewstory.jsp"><i class="material-icons left">class</i>View Stories</a></li>
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
            <h5 style="font-family:'Tangerine';font-size: 50px;color:#e91e63"> View Stories</h5>
            </p>
          </div>
        </div>
  </div>


<!--
        <table class="striped responsive-table" id="viewtable">
        <thead>
    
          <tr>
              <th data-field="title">Title</th>
              <th data-field="about">About</th>
              <th data-field="tale">Story</th>
          </tr>
        </thead>        
      </table>
-->


      <div class="row container">
        <div class="row card-panel pink white-text center">
          <div class="col s12 center"> Stories of UCSB!
          </div>
        </div>
      </div>
      <div class="row container" >
        <div class="col s12" id="blogs">
        </div>
      
      </div>

<!--

Footer

-->

<footer class="page-footer cyan darken-4 down">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <a href="#" class="white-text"><h5>Eventize</h5></a>
                <p class="grey-text">Make things happen!</p>
              </div>
              <div class="col l4 offset-l2 s12 right">
                <h5 class="grey-text">Links</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="homepage.jsp">Create</a></li>
                  <li><a class="grey-text text-lighten-3" href="view.jsp">View</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Events</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Signout</a></li>
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
          url:"/rest/stories",
          type:'GET',
          dataType:"json",
          success: function(data)
          {
            var i;
            for(i=0;i<data.length;i++)
            {
              var myStories=data[i];
              var title=myStories["title"];
              var about=myStories["about"];
              var tale=myStories["tale"];
              //$('#viewtable').append('<tbody><tr><td>' + title+ '</td>' + '<td>' + about + '</td>' + '<td>' + tale + '</td></tr></tbody>');

              $('#blogs').append('<div class="row container center "><div class="col s12 center"><span class="stylishfont pinkcolor">Title :'+title+ '</span></div></div><div class="row teal white-text container divoverflow"><div class="row"><div class="col s12"> About : ' + about + '</div></div><div class="row"><div class="col s12 ">Story : '+ tale + '</div></div></div>');
            }
          }
        })
        });
       // after reloading
        </script>

</div>
   </body>   
</html>
