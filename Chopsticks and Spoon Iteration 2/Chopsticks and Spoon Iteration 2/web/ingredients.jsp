<%@page import="Bean.PackagedBean"%>
<%@page import="Bean.UsersBean"%>
<%@page import="Bean.IngredientBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>Ingredients | Chopsticks &amp; Spoon</title>
  <meta name="description" content="">
  <meta name="author" content="">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <script src="bootstrap/js/jquery.min.js"></script>
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="images/favicon.ico">
</head>

<body id="body_ingredient">
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
          <% ArrayList<IngredientBean> ilist = (ArrayList<IngredientBean>) session.getAttribute("ingredientlist");
                    int ingredientNotif = 0;
                    for(int i = 0; i < ilist.size(); i++){
                        if(ilist.get(i).getIngredient_needSupply() == 1)
                            ingredientNotif++;
                    }%>
                    <% ArrayList<PackagedBean> plist = (ArrayList<PackagedBean>) session.getAttribute("packagedlist");
                    int packagedNotif = 0;
                    for(int j = 0; j < plist.size(); j++){
                        if(plist.get(j).getPackaged_needSupply() == 1)
                            packagedNotif++;
                    }%>
	  <ul>
	    <li class="nav_pos"><a href="pos.jsp" title="Point of Sales">Point of Sales</a></li>
	    <li class="nav_ingredients"><a href="GetIngredientListServlet" title="Ingredients">Ingredients <span><%out.println(ingredientNotif);%></span></a></li>
                        <li class="nav_packaged"><a href="GetPackagedListServlet" title="Pacakaged Items">Packaged Items <span><%out.println(packagedNotif);%></span></a></li>
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
		  <li><%if(useraccount.getUser_level().equals("user")){
                            %><div style="display: none">
                                <%}else{%><div style="display: inline"><a href="users.jsp" title="Manage Users">Users</a></div><%}%></li>
		  <li><a href="GetIngredientRestockLogListServlet" title="View Logs">View Logs</a></li>
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
    <h1>Ingredients</h1>
          
	<div class="right">
            
	  <a class="button left" href="#reportSpoiled" title="Report Spoiled">Report Spoiled</a>
	  <a class="button left" href="#createIngredient" title="Create New Ingredient">Create New Ingredient</a>
	</div>
	<br class="clear">
	<table>
	  <tr>
	    <th>Ingredient</th>
	    <th>Weight</th>
	    <th>Cost (Averaged)</th>
		<th>Edit</th>
		<th>Restock</th>
	  </tr>
	  <% 
          ArrayList<IngredientBean> inglist = (ArrayList<IngredientBean>) session.getAttribute("ingredientlist");
           
                for(int i = 0; i < inglist.size(); i++){
                    if(inglist.get(i).getIngredient_needSupply() == 1){%>
                    <tr class="warning">
                        <%}else{%>
                        <tr>
                        <%}%>
	    <td><%out.println(inglist.get(i).getIngredient_name());%></td>
	    <td><%out.println(inglist.get(i).getIngredient_weight());%></td>
	    <td><%out.println(inglist.get(i).getIngredient_cost());%></td>
		<td class="tableButton"><a href="#editIngredient" title="Edit"  onclick="ajaxEdit(<%=inglist.get(i).getIngredient_id()%>)" > Edit</a></td>
		<td class="tableButton"><a href="#restockIngredient" title="Restock" onclick="ajaxRestock(<%=inglist.get(i).getIngredient_id()%>)">+ Restock</a></td>
	  </tr>
          <% } %>
          
          <script>
           function ajaxEdit(id){

             $.ajax({

        url: "AjaxEditIngredientServlet",

        type: 'POST',

        dataType: "json",

        data: {
            ingredientID : id
        },

        success: function (data) {
           
           ingredientID.value=data.IngredientID;
           ingredientName.value=data.IngredientName;
           ingredientThreshold.value=data.IngredientThreshold;
           
        },

        error: function(XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });}
            </script>
            
      <script>
           function ajaxRestock(id){

             $.ajax({

        url: "AjaxRestockIngredientServlet",

        type: 'POST',

        dataType: "json",

        data: {
            restockingredientID : id
        },

        success: function (data) {
           
          restockingredientID.value=data.RestockIngredientID;          
           
        },

        error: function(XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });}
            </script>
            
         
	</table>
  </section>
          
          
  	<!--MODALS START-->
        <div id="successEdit" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="GetIngredientListServlet" data-dismiss="alert" title="Close">X</a>
  <strong><font color="green">Success!</font></strong> <font color="black">You have just successfully edited an ingredient!</font>
</div>
</div>
        <div id="successReport" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="GetIngredientListServlet" data-dismiss="alert" title="Close">X</a>
  <strong><font color="green">Success!</font></strong> <font color="black">You have just successfully reported a spoiled ingredient!</font>
</div>
</div>
        <div id="successCreate" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="GetIngredientListServlet" data-dismiss="alert" title="Close">X</a>
  <strong><font color="green">Success!</font></strong> <font color="black">You have just successfully created an ingredient!</font>
</div>
</div>
        <div id="successRestock" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="GetIngredientListServlet" data-dismiss="alert" title="Close">X</a>
  <strong><font color="green">Success!</font></strong> <font color="black">You have just successfully restocked an ingredient!</font>
</div>
</div>
         <div id="failCreate" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="#close" data-dismiss="alert" title="Close">X</a>
  <strong><font color="red">Error!</font></strong> <font color="black">Unsuccessfully created an ingredient! (*Name must be unique)</font>
</div>
</div>
	<div id="reportSpoiled" class="wrapModal">
	  <div>
	    <a class="right close button" href="#close" title="Close">X</a>
	    <h3>Report Spoiled Ingredient</h3>
		<form action="ReportSpoiledIngredient" id="reportSpoiledForm">
		  <ul>
		  <li>Ingredient 
		    <select name="chooseIngredient">
                      <%for(int j = 0; j < inglist.size(); j++){%>
		      <option value="<%=inglist.get(j).getIngredient_id()%>"><%out.println(inglist.get(j).getIngredient_name());%></option>
                      <%}%>
		    </select>
		  </li>
		  <li>Weight (kg): <input required type="text" pattern="^\d*\.?\d*$" id="spoiledWeight" name="spoiledWeight" oninput="check(this)"></li>
		  </ul>
		  <br class="clear">
		  <input type="submit" value="Submit">
		</form>
	  </div>
	</div>	
	<div id="createIngredient" class="wrapModal">
	  <div>
	    <a class="right close button" href="#close" title="Close">X</a>
	    <h3>Create New Ingredient</h3>
		<form action="AddIngredientServlet" id="createIngredientForm" method="POST">
		  <ul>
                    <input type="hidden" id="createingredientID" name="createingredientID">
		    <li>Ingredient Name: <input required type="text" pattern="^[a-zA-Z\s]*$" name="ingredientName" oninput="check(this)"></li>
		    <li>Ingredient Weight (kg): <input required type="text" pattern="^\d*\.?\d*$" name="ingredientWeight" oninput="check(this)"></li>
		    <li>Ingredient Cost: <input required type="text" pattern="^\d*\.?\d*$" name="ingredientCost" oninput="check(this)"></li>
		    <li>Ingredient Source: <input required type="text" name="ingredientSource"></li>
		    <li>Weight Threshold: <input required type="text" pattern="^\d*\.?\d*$" name="ingredientThreshold" oninput="check(this)"></li>
		  </ul>
		  <br class="clear">
		  <input type="submit" value="Submit">
		</form>
	  </div>
	</div>	
	<div id="editIngredient" class="wrapModal">
	  <div>
	    <a class="right close button" href="#close" title="Close">X</a>
	    <h3>Edit Ingredient</h3>
		<form action="EditIngredientServlet" id="restockIngredientForm">
		  <ul>
                      <li id="editIngredientName"><h4> Ingredient Info </h4></li>
                      <input type="hidden" id="ingredientID" name="ingredientID">
		    <li>New Ingredient Name: <input required type="text" id="ingredientName" name="ingredientName"></li>
		    <li>New Ingredient Threshold: <input required type="text" pattern="^\d*\.?\d*$" id="ingredientThreshold" name="ingredientThreshold" oninput="check(this)"></li>		    
		  </ul>
		  <br class="clear">
		  <input type="submit" value="Submit">
		</form>
	  </div>
	</div>
	<div id="restockIngredient" class="wrapModal">
	  <div>
	    <a class="right close button" href="#close" title="Close">X</a>
	    <h3>Restock Ingredient</h3>
		<form action="RestockIngredientServlet" id="restockIngredientForm">
		  <ul>
		    <li id="restockIngredientName"><h4>Ingredient Name</h4></li>
                    <input type="hidden" id="restockingredientID" name="restockingredientID">
		    <li>Restock Weight (kg): <input required type="text" pattern="^[1-9][0-9]*?$" id="restockWeight" name="restockWeight" oninput="check(this)"></li>
		    <li>Restock Cost: <input required type="text" pattern="^\d*\.?\d*$" id="restockCost" name="restockCost" oninput="check(this)"></li>
		    <li>Restock Source: <input required type="text" id="restockSource" name="restockSource"></li>
		  </ul>
		  <br class="clear">
		  <input type="submit" value="Submit">
		</form>
	  </div>
	</div>
         <script>
          function check(input) {  
                if(input.validity.patternMismatch){  
                input.setCustomValidity("Please enter a valid input.");  
                }    
                else {
                input.setCustomValidity("");  
                }                 
                }  
        </script>
	<!--MODALS END-->
  <!--CONTENT END-->
  </div>
</body>
</html>