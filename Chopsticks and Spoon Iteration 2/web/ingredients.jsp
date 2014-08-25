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
		  <li><a href="users.html" title="Manage Users">Users</a></li>
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
            // String ingredientname;
                for(int i = 0; i < inglist.size(); i++){%>
          <tr>  
	    <td><%out.println(inglist.get(i).getIngredient_name());%></td>
	    <td><%out.println(inglist.get(i).getIngredient_weight());%></td>
	    <td><%out.println(inglist.get(i).getIngredient_cost());%></td>
		<td class="tableButton"><a href="#editIngredient" title="Edit" > Edit</a></td>
		<td class="tableButton"><a href="#restockIngredient" title="Restock">+ Restock</a></td>
	  </tr>
          <% } %>
          <!--
	  <tr class="warning">
	    <td>pancit bihon</td>
	    <td>5 kg</td>
	    <td>80.00</td>
		<td class="tableButton"><a href="#editIngredient" title="Edit">> Edit</a></td>
		<td class="tableButton"><a href="#restockIngredient" title="Restock">+ Restock</a></td>
	  </tr>
	  <tr class="warning">
	    <td>pancit miki</td>
	    <td>4 kg</td>
	    <td>70.00</td>
		<td class="tableButton"><a href="#editIngredient" title="Edit">> Edit</a></td>
		<td class="tableButton"><a href="#restockIngredient" title="Restock">+ Restock</a></td>
	  </tr>
	  <tr>
	    <td>beef</td>
	    <td>10 kg</td>
	    <td>120.00</td>
		<td class="tableButton"><a href="#editIngredient" title="Edit">> Edit</a></td>
		<td class="tableButton"><a href="#restockIngredient" title="Restock">+ Restock</a></td>
	  </tr>
	  <tr>
	    <td>carrots</td>
	    <td>8.5 kg</td>
	    <td>100.00</td>
		<td class="tableButton"><a href="#editIngredient" title="Edit">> Edit</a></td>
		<td class="tableButton"><a href="#restockIngredient" title="Restock">+ Restock</a></td>
	  </tr>
	  <tr>
	    <td>dory</td>
	    <td>8.5 kg</td>
	    <td>140.00</td>
		<td class="tableButton"><a href="#editIngredient" title="Edit">> Edit</a></td>
		<td class="tableButton"><a href="#restockInrgedient" title="Restock">+ Restock</a></td>
	  </tr>
	  <tr>
	    <td>potatoes</td>
	    <td>7 kg</td>
	    <td>110.00</td>
		<td class="tableButton"><a href="#editIngredient" title="Edit">> Edit</a></td>
		<td class="tableButton"><a href="#restockIngredient" title="Restock">+ Restock</a></td>
	  </tr>-->
	</table>
  </section>
  	<!--MODALS START-->
	<div id="reportSpoiled" class="wrapModal">
	  <div>
	    <a class="right close button" href="#close" title="Close">X</a>
	    <h3>Report Spoiled Ingredient</h3>
		<form id="reportSpoiledForm">
		  <ul>
		  <li>Ingredient Name:
		    <select>
		      <option value="beef">Beef</option>
		      <option value="carrots">Carrots</option>
		      <option value="dory">Dory</option>
		      <option value="potatoes">Potatoes</option>
		      <option value="pancit bihon">Pancit Bihon</option>
		      <option value="pancit miki">Pancit Miki</option>
		    </select>
		  </li>
		  <li>Weight (kg): <input required type="text" name="weight"></li>
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
		    <li id="editIngredientName"><h4><%out.println(inglist.get(i).getIngredient_name());%></h4></li>
		    <li>New Ingredient Name: <input required type="text" name="ingredientName"></li>
		    <li>New Ingredient Threshold: <input required type="text" name="ingredientThreshold"></li>		    
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
		<form id="restockIngredientForm">
		  <ul>
		    <li id="restockIngredientName"><h4>Ingredient Name</h4></li>
		    <li>Restock Weight (kg): <input required type="text" name="restockWeight"></li>
		    <li>Restock Cost: <input required type="text" name="restockCost"></li>
		    <li>Restock Source: <input required type="text" name="restockSource"></li>
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