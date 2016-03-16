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

      <div class="row container">
        <div class="row">
          <div class="col s12 center">
            <p>
            <h5 style="font-family:'Tangerine';font-size: 50px;color:#e91e63"> Write a story related to UCSB</h5>
            </p>
            </div>
          </div>         
      </div>

      <div class="row container">
        <form>

        <div class="row">
          <div class="input-field col s12">
          <i class="material-icons prefix pinkcolor">view_list</i>
          <input type="text" class="validate" id="title" required>
          <label for="icon_prefix">Title of your Story</label>          
          </div>
        </div>

        <div class="row">
          <div class="input-field col s12">
          <i class="material-icons prefix pinkcolor">textsms</i>
          <input type="text" class="validate" id="about" required>
          <label for="icon_prefix">What is your story about?</label>          
          </div>
        </div>

        <div class="row">
          <div class="input-field col s12">
            <i class="material-icons prefix pinkcolor">mode_edit</i>
            <textarea class="materialize-textarea" id="tale" cols="100" required></textarea>
            <label for="icon_prefix2">Write your story</label>
          </div>
        </div>

        <hr class="pinkcolor"/>

        <div class="row">
        <div class="col s12 pinkcolor center">
        <button onclick="submitData()" class="btn waves-effect waves-light" type="submit" name="action" >Submit
          <i class="material-icons right ">send</i>
        </button>
        </div>
        </div>


      </form>
    </div>


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
                  <a class="grey-text text-lighten-3" href="viewstory.jsp">View stories</a>&nbs p;
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

        function submitData()
        {
        
          var storiesData = {};
          storiesData["title"] = $('#title')[0].value;
          storiesData["about"] = $('#about')[0].value;          
          storiesData["tale"] = $('#tale')[0].value;
          var id = 1;
          storiesData["id"] = id++;
          
    
          
          $.ajax({
                url: "/rest/stories",
                type: "POST",
                data: JSON.stringify(storiesData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function()
                {
                    alert("Yeh!!Your event was successfully created!");
                }
              })
          location.reload();
    
        }

        $( document ).ready(function() 
        {
                 $('select').material_select();   

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
              var id=myStories["id"];
            }
          }
        });
        
        });
        </script>


   </body>   
</html>
