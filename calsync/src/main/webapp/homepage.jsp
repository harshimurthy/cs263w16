<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <title>Eventize</title>
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
      <script>
     $( document ).ready(function() {
         $('.datepicker').pickadate({
          format: 'mm/dd/yyyy',
          selectMonths: true, // Creates a dropdown to control month
          selectYears: 15 // Creates a dropdown of 15 years to control year
        });

         $('select').material_select();

      
    });
    </script>

   </head>
   <body>  

   <nav class="cyan darken-4">
    <div class="nav-wrapper container">
      <a href="#" class="brand-logo" style="font-family:'Tangerine';font-size: 50px">Eventize!</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="#"><i class="material-icons left">note_add</i>Create event<br/><i class="material-icons prefix center">note_add</i><br/><br/>Create a new event</a></li>
        <li><a href="#"><i class="material-icons left">visibility</i>View events<br/><i class="material-icons prefix center">visibility</i><br/><br/>View all the events</a></li>
        <li><a href="#"><i class="material-icons left">class</i>My events<br/><i class="material-icons prefix center">class</i><br/><br/>View events I intend to go</a></li>
        <%
        UserService userService = UserServiceFactory.getUserService();
                           User user = userService.getCurrentUser();
        if(user!=null)
        %> 
                         <li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>"><i class="material-icons left">call_made</i>Signout</a></li>
      </ul>
    </div>
  </nav>

      <div class="row container">
        <div class="row">
          <div class="col s12 center">
            <p>
            <h5 style="font-family:'Tangerine';font-size: 50px;color:#e91e63"> Enter Event Information</h5>
            </p>
            </div>
          </div>

         <form class="col s12">
            <div class="row">
               <div class="input-field col s6">
                  <i class="material-icons prefix greencolor">turned_in</i>
                  <input placeholder="Event Name" id="eventName" type="text" class="validate">
                  <label for="email">Event name</label>
               </div>

               <div class="input-field col s6">
                  <i class="material-icons prefix greencolor ">view_day</i>
                  <input placeholder="Event tagline" id="eventTagline" type="text" class="validate">
                  <label for="email">Event tagline</label>
               </div>
            </div>

            <div class="row ">
               <div class="input-field col s4">
                  <i class="material-icons prefix greencolor">today</i>
                  <input type="text" class="datepicker" placeholder="Event Date" id="eventDate" class="validate"/>
                  <label for="date">Event Date</label>
               </div>

               <div class="input-field col s4">
                  <i class="material-icons prefix greencolor">alarm_on</i>
                  <input type="text" class="timepicker" placeholder="Event Time" id="eventTime" class="validate"/>
                  <label for="time">Event Time</label>
               </div>
                        
               <div class="input-field col s4">
                  <i class="material-icons prefix greencolor">add_alert</i>
                  <input placeholder="Duration" id="duration" type="text" class="validate">
                  <label for="email">Duration (Ex: 2 hours, 40 mins , 2.5 hours)</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col s4">
                  <i class="material-icons prefix greencolor">group_work</i>
                  <select name="eventType">
                    <option value="" disabled selected>          Choose your option</option>
                    <option value="workshop">Workshop</option>
                    <option value="conference">Conference</option>
                    <option value="meeting">Meeting</option>
                    <option value="club">Club</option>
                    <option value="infosession">Info session</option>
                    <option value="entertainment">Entertainment</option>
                    <option value="NA">Not applicable</option>
                  </select>
                  <label>Event Type</label>               
               </div>

               <div class="input-field col s4">
                  <i class="material-icons prefix greencolor">games</i>
                  <select name="eventHost">
                  <option value="" disabled selected>           Choose your option</option>
                  <option value="official">Department(official)</option>
                  <option value="unofficial">Student(unofficial)</option>
                  <option value="company">Company</option>
                  <option value="external">Others</option>
                  </select>
                  <label>Hosted by:</label>               
               </div>

               <div class="input-field col s4">
                  <i class="material-icons prefix greencolor">done</i>
                  <select name="purpose">
                  <option value="" disabled selected>           Choose your option</option>
                  <option value="educational">Educational</option>
                  <option value="entertainment">Entertainment</option>
                  <option value="informational">Informational</option>
                  <option value="others">Others</option>
                  </select>
                  <label>Purpose of the event</label>               
               </div>
            </div>


            <div class="row">
               <div class="input-field col s6">
                  <i class="material-icons prefix greencolor">work</i>
                  <select name="department">
                          <option value="" disabled selected>          Choose your option</option>
                          <option value="NA">Not Applicable</option>
                          <option value="ANTH ">Anthropology                             - ANTH </option>
                          <option value="ART  ">Art                                      - ART  </option>
                          <option value="ARTHI">Art History                              - ARTHI</option>
                          <option value="ARTST">Art Studio                               - ARTST</option>
                          <option value="AS AM">Asian American Studies                   - AS AM</option>
                          <option value="ASTRO">Astronomy                                - ASTRO</option>
                          <option value="BIOL ">Biology (Creative Studies)               - BIOL </option>
                          <option value="BMSE ">Biomolecular Science and Engineering     - BMSE </option>
                          <option value="BL ST">Black Studies                            - BL ST</option>
                          <option value="CH E ">Chemical Engineering                     - CH E </option>
                          <option value="CHEM ">Chemistry and Biochemistry               - CHEM </option>
                          <option value="CH ST">Chicano Studies                          - CH ST</option>
                          <option value="CHIN ">Chinese                                  - CHIN </option>
                          <option value="CLASS">Classics                                 - CLASS</option>
                          <option value="COMM ">Communication                            - COMM </option>
                          <option value="C LIT">Comparative Literature                   - C LIT</option>
                          <option value="CMPSC">Computer Science                         - CMPSC</option>
                          <option value="CMPTG">Computing (Creative Studies)             - CMPTG</option>
                          <option value="CNCSP">Counseling, Clinical, School Psychology  - CNCSP</option>
                          <option value="DANCE">Dance                                    - DANCE</option>
                          <option value="DYNS ">Dynamical Neuroscience                   - DYNS </option>
                          <option value="EARTH">Earth Science                            - EARTH</option>
                          <option value="EACS ">East Asian Cultural Studies              - EACS </option>
                          <option value="EEMB ">Ecology, Evolution &amp; Marine Biology      - EEMB </option>
                          <option value="ECON ">Economics                                - ECON </option>
                          <option value="ED   ">Education                                - ED   </option>
                          <option value="ECE  ">Electrical Computer Engineering          - ECE  </option>
                          <option value="ENGR ">Engineering Sciences                     - ENGR </option>
                          <option value="ENGL ">English                                  - ENGL </option>
                          <option value="ESM  ">Environmental Science &amp; Management       - ESM  </option>
                          <option value="ENV S">Environmental Studies                    - ENV S</option>
                          <option value="ESS  ">Exercise &amp; Sport Studies                 - ESS  </option>
                          <option value="ES   ">Exercise Sport                           - ES   </option>
                          <option value="FEMST">Feminist Studies                         - FEMST</option>
                          <option value="FAMST">Film and Media Studies                   - FAMST</option>
                          <option value="FLMST">Film Studies                             - FLMST</option>
                          <option value="FR   ">French                                   - FR   </option>
                          <option value="GEN S">General Studies (Creative Studies)       - GEN S</option>
                          <option value="GEOG ">Geography                                - GEOG </option>
                          <option value="GER  ">German                                   - GER  </option>
                          <option value="GPS  ">Global Peace and Security                - GPS  </option>
                          <option value="GLOBL">Global Studies                           - GLOBL</option>
                          <option value="GREEK">Greek                                    - GREEK</option>
                          <option value="HEB  ">Hebrew                                   - HEB  </option>
                          <option value="HIST ">History                                  - HIST </option>
                          <option value="INT  ">Interdisciplinary                        - INT  </option>
                          <option value="ITAL ">Italian                                  - ITAL </option>
                          <option value="JAPAN">Japanese                                 - JAPAN</option>
                          <option value="KOR  ">Korean                                   - KOR  </option>
                          <option value="LATIN">Latin                                    - LATIN</option>
                          <option value="LAIS ">Latin American and Iberian Studies       - LAIS </option>
                          <option value="LING ">Linguistics                              - LING </option>
                          <option value="LIT  ">Literature (Creative Studies)            - LIT  </option>
                          <option value="MARSC">Marine Science                           - MARSC</option>
                          <option value="MATRL">Materials                                - MATRL</option>
                          <option value="MATH ">Mathematics                              - MATH </option>
                          <option value="ME   ">Mechanical Engineering                   - ME   </option>
                          <option value="MAT  ">Media Arts and Technology                - MAT  </option>
                          <option value="ME ST">Medieval Studies                         - ME ST</option>
                          <option value="MES  ">Middle East Studies                      - MES  </option>
                          <option value="MS   ">Military Science                         - MS   </option>
                          <option value="MCDB ">Molecular, Cellular &amp; Develop. Biology   - MCDB </option>
                          <option value="MUS  ">Music                                    - MUS  </option>
                          <option value="MUS A">Music Performance Laboratories           - MUS A</option>
                          <option value="PHIL ">Philosophy                               - PHIL </option>
                          <option value="PHYS ">Physics                                  - PHYS </option>
                          <option value="POL S">Political Science                        - POL S</option>
                          <option value="PORT ">Portuguese                               - PORT </option>
                          <option value="PSY  ">Psychology                               - PSY  </option>
                          <option value="RG ST">Religious Studies                        - RG ST</option>
                          <option value="RENST">Renaissance Studies                      - RENST</option>
                          <option value="SLAV ">Slavic                                   - SLAV </option>
                          <option value="SOC  ">Sociology                                - SOC  </option>
                          <option value="SPAN ">Spanish                                  - SPAN </option>
                          <option value="SHS  ">Speech &amp; Hearing Sciences                - SHS  </option>
                          <option value="PSTAT">Statistics &amp; Applied Probability         - PSTAT</option>
                          <option value="TMP  ">Technology Management                    - TMP  </option>
                          <option value="THTR ">Theater                                  - THTR </option>
                          <option value="WRIT ">Writing                                  - WRIT </option>
                          <option value="W&amp;L  ">Writing &amp; Literature (Creative Studies)  - W&amp;L  </option>
                          </select>
                  <label>Department</label>
               </div>
              </div>

               

            <div class="row">
               <div class="input-field col s12">
                    <i class="material-icons prefix pink-icon greencolor">recent_actors</i>
                    <p class="range-field">
                           <input type="range" id="capacity" min="0" max="1000" />
                     </p>

                     <label>Maximum Number of People allowed</label>
              </div>
            </div>

            <div class="row">
            <div class="input-field col s6">
            <i class="material-icons prefix greencolor">location_on</i>
            <textarea id="location" class="materialize-textarea" length="120"></textarea>
            <label for="location">Location of the event</label>
          </div>

          <div class="input-field col s6">
            <i class="material-icons prefix greencolor">description</i>
            <textarea id="description" class="materialize-textarea" length="120"></textarea>
            <label for="description">Description about the event</label>
          </div>
        </div>

        <hr class="pinkcolor"/>

        <div class="row">
          <div class="col s12 center">
            <p>
            <h5 style="font-family:'Tangerine';font-size: 50px;color:#e91e63"> Event Creater Information</h5>
            </p>
            </div>
          


          <div class="row">
               <div class="input-field col s6">
                  <i class="material-icons prefix greencolor">account_circle</i>
                  <input placeholder="Your Name<" value="Mahesh" id="createrName" type="text" class="active validate" required>
                  <label for="name">Your Name</label>
               </div>
               <div class="input-field col s6">
                  <i class="material-icons prefix greencolor">email</i>
                  <input placeholder="Email" id="createrEmailemail" type="email" class="validate">
                  <label for="email">Email</label>
               </div>
            </div>
          
          <div class="row">
          <div class="input-field col s12">
            <i class="material-icons prefix greencolor">perm_contact_calendar</i><label for="createrRole">Your role</label> <br/>
                <input class="with-gap" name="createrRole" type="radio" id="student"/>
                <label for="student">Student</label>

                <input class="with-gap" name="createrRole" type="radio" id="professor"/>
                <label for="professor">Professor</label>

                <input class="with-gap" name="createrRole" type="radio" id="staff"/>
                <label for="staff">University Staff</label>

                <input class="with-gap" name="createrRole" type="radio" id="cstaff"/>
                <label for="cstaff">Company Staff</label>

                <input class="with-gap" name="createrRole" type="radio" id="others"/>
                <label for="others">Other</label>
          </div>
          </div>
          </div>
           
           <hr class="pinkcolor"/>

           <div class="row">
           <div class="col s12 pinkcolor"> 
           <p class="center">
            <button class="btn waves-effect waves-light" type="submit" name="action" style="background-color:#e91e63">Submit
              <i class="material-icons right">send</i>
            </button>
            </p>
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
                  <li><a class="grey-text text-lighten-3" href="#!">Create</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">View</a></li>
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
   </body>   
</html>
