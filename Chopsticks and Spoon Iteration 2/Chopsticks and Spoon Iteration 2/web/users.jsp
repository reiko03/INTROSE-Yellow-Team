<%@page import="Bean.UsersBean"%>
<%@page import="DAOImplementation.UserImplementation"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>Users | Chopsticks &amp; Spoon</title>
  <meta name="description" content="">
  <meta name="author" content="">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="images/favicon.ico">
  <script src="bootstrap/js/jquery-2.1.1.js"></script>
</head>
<body id="body_users">
  <div class="wrap">
      <% UsersBean useraccount = new UsersBean();
            useraccount = (UsersBean)session.getAttribute("userAccount");%>
  <!--SIDENAV START-->
  <div class="wrapSideNav">
    <div class="sideNav">
	  <div class="userProfile">
	   <span class="username"><%out.println(useraccount.getUser_name());%></span>
		<span class="position"><%out.println(useraccount.getUser_level());%></span>
	  </div>
	  <ul>
	    <li class="nav_pos"><a href="pos.jsp" title="Point of Sales">Point of Sales</a></li>
	    <li class="nav_ingredients"><a href="GetIngredientListServlet" title="Ingredients">Ingredients <span>2</span></a></li>
	    <li class="nav_packaged"><a href="GetPackagedListServlet" title="Pacakaged Items">Packaged Items <span>1</span></a></li>
      </ul>
    </div>
  </div>
  <!--SIDENAV END-->
  <br class="clear">
  <div class="wrapHeader">
  <!--HEADER START-->
  <header>    
      <hgroup id="logo">
	    <h2>Chopsticks &amp; Spoon</h2>
	  </hgroup>
      <div class="subMenu">
	    <ul>
	      <li><a href="dishes.jsp" title="Manage Dishes">Dishes <span>1</span></a></li>
		  <li><a href="users.jsp" title="Manage Users">Users</a></li>
		  <li><a href="GetIngredientRestockLogListServlet" title="View  Logs">View  Logs</a></li>
		  <li><a href="index.jsp" title="Log Out">Log Out</a></li>
		  <li id="dateTime"><%= new java.util.Date() %></li>
	    </ul>
      </div>
    <br class="clear">
  </header>
  <!--HEADER END-->
  </div>
  <!--CONTENT START-->
  <section class="wrapContent">
    <h1>Users</h1><!--
	<div class="left">
	  <form id="searchDish" class="search">
	    <input type="search" name="search" placeholder="Search..">
		<input type="submit" value="Search">
	  </form>
	</div>-->
	<div class="right">
	  <a class="button left" href="#createUser" title="Create New User">Create New User</a>
           <a class="button left" href="#editUser" title="Edit">Edit User</a>
	</div>
	<br class="clear">
	<table>
	  <tr>
	    <th>Username</th>
	    <th>Password</th>
	    <th>User Position</th>
	    
	  </tr>
          <% UserImplementation userDAO = new UserImplementation();
          UsersBean userBean = new UsersBean();%>
          <% for(int i = 0; i < userDAO.getUsersList().size();i++){ %>
	  <tr>
              
	    <td><%=userDAO.getUsersList().get(i).getUser_name()%></td>
	    <td><%=userDAO.getUsersList().get(i).getUser_password()%></td>
	    <td><%=userDAO.getUsersList().get(i).getUser_level()%></td>
	    
	  </tr>
	  
          <% }%>
	</table>
  </section>
  <!--MODALS START-->
	<div id="createUser" class="wrapModal">
	  <div>
		<a class="right close button" href="#close" title="Close">X</a>
	    <h3>Create New User</h3>
		<form id="createUserForm" method="POST" action="AddUserServlet" >
		  <ul>
		    <li>New Username: <input required type="text" name="Username"></li>
		    <li>New Password: <input required type="text" name="Password"></li>
		    <li>User Position: 
			  <select name="Position">
			    <option value="admin">Admin</option>
			    <option value="user">User</option>
			  </select>
			</li>
		  </ul>
		  <br class="clear">
		  <input type="submit" value="Submit">
		</form>
	  </div>
	</div>
  
  
	<div id="editUser" class="wrapModal">
	  <div>
		<a class="right close button" href="#close" title="Close">X</a>
	    <h3>Edit User</h3>
		<form action="EditUserServlet" method="POST">
		  <ul>
		    <li>User to Edit:
			  <select name="username" onchange="ajaxEdit(this.value)">
                               <% for(int i = 0; i < userDAO.getUsersList().size();i++){ %>
			    <option value="<%=userDAO.getUsersList().get(i).getUser_name()%>"><%=userDAO.getUsersList().get(i).getUser_name()%></option>
                            <% }%>
			  </select>
		    </li>
		    <li>New Username: <input required type="text" id="newUsername" name="newUsername"></li>
		    <li>New Password: <input required type="text" id="newPassword" name="newPassword"></li>
		    <li>New User Position: 
			  <select name="newPosition" id="newPosition">
			    <option value="admin">Admin</option>
			    <option value="user">User</option>
			  </select>
			</li>
		  </ul>
		  <br class="clear">
		  <input type="submit" value="Submit">
		</form>
	  </div>
	</div>
	<!--MODALS END-->
  <!--CONTENT END-->
  </div>
</body>
<script>
       function ajaxEdit(username){

             $.ajax({

        url: "GenerateEditUser",

        type: 'POST',

        dataType: "json",

        data: {
            editUsername : username
        },

        success: function (data) {
           
           newUsername.value=data.Username;
           newPassword.value=data.Password;
           newPosition.value=data.Position;
           
           
        },

        error: function(XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });}
    
</script>
    
</html>