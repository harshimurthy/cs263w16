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
    
    overflow:scroll;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    
    
    background-image: url('images/ucsb3.jpg');
    background-repeat: no-repeat;

    background-x-position: center;
background-y-position: top;
    
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
            <h5 style="font-family:'Tangerine';font-size: 50px;color:#e91e63"> My stories</h5>
            </p>
          </div>
        </div>
  </div>


      <div class="row container">
        <div class="row card-panel pink white-text center">
          <div class="col s12 center"> My stories of UCSB!
          </div>
        </div>
      </div>

      <div class="row container" id="blogs" >
        
      
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

        function cancelStory(button)
        {

              var $this = $(this);
              console.log($this);
              console.log(button.value);
              $.ajax({
              
             url: "/rest/stories/"+button.value,
              type: "DELETE",
              
              success: function()
              {
                  alert("Story was successfully deleted");
                  location.reload();
                  
              }
            })
              
            
        }

        
        $( document ).ready(function() 
        {
          $.ajax(
          {
          url:"/rest/stories/byOwner",
          type:'GET',
          dataType:"json",
          success:function(data)
          {
            var i;
            for(i=0;i<data.length;i++)
            {
              var myStories=data[i];
              var title=myStories["title"];
              var about=myStories["about"];
              var tale=myStories["tale"];
              var id=myStories["id"];
              //$('#viewtable').append('<tbody><tr><td>' + title+ '</td>' + '<td>' + about + '</td>' + '<td>' + tale + '</td></tr></tbody>');

              $('#blogs').append('<div class="row container center"><div class="col s12 center"><span class="stylishfont pinkcolor">Title :'+title+ '</span></div></div><div class="row card-panel teal white-text container divoverflow"><div class="row"><div class="col s12"> About : ' + about + '</div></div><div class="row"><div class="col s12 ">Story : '+ tale + '</div></div><div class="row"><div class="col s12 center"><button type="button" value = \"' + id + '\" onclick="cancelStory(this)" class="btn btn-danger pink center" id=deleteEvent> Delete Story </button></div></div></div>');

               
            }
          }
        })
        });
        </script>

</div>
   </body>   
</html>
