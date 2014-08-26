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
  <script src="bootstrap/js/jquery-2.1.1.js"></script>
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="images/favicon.ico">
</head>
<body id="body_ingredient">
  <div class="wrap">
  <!--SIDENAV START-->
  <div class="wrapSideNav">
    <div class="sideNav">
	  <div class="userProfile">
	    <span class="username">Username</span>
		<span class="position">Position</span>
	  </div>
	  <ul>
	    <li class="nav_pos"><a href="pos.html" title="Point of Sales">Point of Sales</a></li>
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
	      <li><a href="dishes.html" title="Manage Dishes">Dishes <span>1</span></a></li>
		  <li><a href="users.jsp" title="Manage Users">Users</a></li>
		  <li><a href="logIngredientRestock.html" title="View Logs">View Logs</a></li>
		  <li><a href="" title="Log Out">Log Out</a></li>
		  <li id="dateTime">DATE / TIME</li>
	    </ul>
      </div>
    <br class="clear">
  </header>
  <!--HEADER END-->
  </div>
  <!--CONTENT START-->
  <section class="wrapContent">
    <h1>Ingredients</h1>
	<div class="left">
	  <form id="searchIngredient" class="search">
	    <input type="search" name="search" placeholder="Search..">
		<input type="submit" value="Search">
                
	  </form>
	</div>
	<div class="right">
		<a class="button left" href="GetIngredientListServlet" title="Refresh">Refresh</a>
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
            System.out.println("WHYYYY");
                for(int i = 0; i < inglist.size(); i++){ System.out.println(inglist.get(i).getIngredient_id());%>
          <tr>  
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
		  <li>Weight (kg): <input required type="text" id="spoiledWeight" name="spoiledWeight"></li>
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
		    <li>Ingredient Name: <input required type="text" name="ingredientName"></li>
		    <li>Ingredient Weight (kg): <input required type="text" name="ingredientWeight"></li>
		    <li>Ingredient Cost: <input required type="text" name="ingredientCost"></li>
			<!--<li>Ingredient Source: <input required type="text" name="ingredientSource"></li>-->
		    <li>Weight Threshold: <input required type="text" name="ingredientThreshold"></li>
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
		    <li>New Ingredient Threshold: <input required type="text" id="ingredientThreshold" name="ingredientThreshold"></li>		    
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
		    <li>Restock Weight (kg): <input required type="text" id="restockWeight" name="restockWeight"></li>
		    <li>Restock Cost: <input required type="text" id="restockCost" name="restockCost"></li>
		    <li>Restock Source: <input required type="text" id="restockSource" name="restockSource"></li>
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
</html>