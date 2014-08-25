<%@page import="Bean.PackagedBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>Packaged Items | Chopsticks &amp; Spoon</title>
  <meta name="description" content="">
  <meta name="author" content="">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="images/favicon.ico">
</head>
<body id="body_packaged">
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
    <h1>Packaged Items</h1>
	<div class="left">
	  <form id="searchPackaged" class="search">
	    <input type="search" name="search" placeholder="Search..">
		<input type="submit" value="Search">
	  </form>
	</div>
	<div class="right">
		<a class="button left" href="GetPackagedListServlet" title="Refresh">Refresh</a>
	  <a class="button left" href="#reportDamaged" title="Report Damaged">Report Damaged</a>
	  <a class="button left" href="#createPackaged" title="Create New Packaged Item">Create New Packaged Item</a>
	</div>
	<br class="clear">
	<table>
	  <tr>
	    <th>Packaged Item</th>
	    <th>Quantity</th>
	    <th>Cost (Averaged)</th>
	    <th>Selling Price</th>
		<th>Edit</th>
		<th>Restock</th>
	  </tr>
	  <% 
          ArrayList<PackagedBean> packlist = (ArrayList<PackagedBean>) session.getAttribute("packagedlist");
         
              for(int i = 0; i < packlist.size(); i++){%>
	  <tr>
	    <td><%out.println(packlist.get(i).getPackaged_name());%></td>
	    <td><%out.println(packlist.get(i).getPackaged_quantity());%></td>
	    <td><%out.println(packlist.get(i).getPackaged_cost());%></td>
            <td><%out.println(packlist.get(i).getPackaged_price());%></td>
		<td class="tableButton"><a href="#editPackaged" title="Edit">> Edit</a></td>
		<td class="tableButton"><a href="#restockPackaged" title="Restock">+ Restock</a></td>
	  </tr>
          <% } %>
          <!--
	  <tr>
	    <td>C2 green 500ml</td>
	    <td>7 pcs</td>
	    <td>16.00</td>
	    <td>20.00</td>
		<td class="tableButton"><a href="#editPackaged" title="Edit">> Edit</a></td>
		<td class="tableButton"><a href="#restockPackaged" title="Restock">+ Restock</a></td>
	  </tr>
	  <tr>
	    <td>Mogu Mogu 500ml</td>
	    <td>7 pcs</td>
	    <td>20.00</td>
	    <td>25.00</td>
		<td class="tableButton"><a href="#editPackaged" title="Edit">> Edit</a></td>
		<td class="tableButton"><a href="#restockPackaged" title="Restock">+ Restock</a></td>
	  </tr>
	  <tr>
	    <td>C2 Red 500ml</td>
	    <td>9 pcs</td>
	    <td>16.00</td>
	    <td>20.00</td>
		<td class="tableButton"><a href="#editPackaged" title="Edit">> Edit</a></td>
		<td class="tableButton"><a href="#restockPackaged" title="Restock">+ Restock</a></td>
	  </tr>-->
	</table>
  </section>
  <!--MODALS START-->
	<div id="reportDamaged" class="wrapModal">
	  <div>
	    <a class="right close button" href="#close" title="Close">X</a>
	    <h3>Report Damaged Packaged Item</h3>
		<form id="reportDamagedForm">
		  <ul>
		  <li>Packaged Item:
		    <select>
		        <option value="c2 green 500ml">C2 Green 500ml</option>
				<option value="mogu mogu 500ml">Mogu Mogu 500ml</option>
				<option value="c2 red 1l">C2 Red 1L</option>
				<option value="c2 red 500ml">C2 Red 500ml</option>
			  </select>
		  </li>
		  <li>Damaged Quantity: <input required type="text" name="damageQuantity"></li>
		  </ul>
		  <br class="clear">
		  <input type="submit" value="Submit">
		</form>
	  </div>
	</div>	
	<div id="createPackaged" class="wrapModal">
	  <div>
	    <a class="right close button" href="#close" title="Close">X</a>
	    <h3>Create New Packaged Item</h3>
		<form action="AddPackagedServlet" id="createPackagedForm" method="POST">
		  <ul>
		    <li>Packaged Item Name: <input required type="text" name="packagedName"></li>
		    <li>Quantity: <input required type="text" name="packagedQuantity"></li>
		    <li>Item Cost (per piece): <input required type="text" name="packagedCost"></li>
		    <li>Selling Price (per piece): <input required type="text" name="packagedPrice"></li>
		    <!--<li>Item Source: <input required type="text" name="packagedSource"></li>-->
		    <li>Quantity Threshold: <input required type="text" name="packagedThreshold"></li>
		  </ul>
		  <br class="clear">
		  <input type="submit" value="Submit">
		</form>
	  </div>
	</div>	
	<div id="restockPackaged" class="wrapModal">
	  <div>
	    <a class="right close button" href="#close" title="Close">X</a>
	    <h3>Restock Packaged Item</h3>
		<form id="restockPackagedForm">
		  <ul>
		    <li id="restockPackagedName"><h4>Packaged Item</h4></li>
		    <li>Restock Quantity: <input required type="text" name="restockQuantity"></li>
		    <li>Restock Cost (per piece): <input required type="text" name="restockCost"></li>
		    <li>Restock Source: <input required type="text" name="restockSource"></li>
		  </ul>
		  <br class="clear">
		  <input type="submit" value="Submit">
		</form>
	  </div>
	</div>
	<div id="editPackaged" class="wrapModal">
	  <div>
	    <a class="right close button" href="#close" title="Close">X</a>
	    <h3>Edit Packaged Item</h3>
		<form id="editPackagedForm">
		  <ul>
		    <li id="editPackagedName"><h4>Packaged Item</h4></li>
		    <li>New Name: <input required type="text" name="packagedName"></li>
		    <li>New Selling Price: <input required type="text" name="packagedPrice"></li>
		    <li>New Threshold: <input required type="text" name="packagedThreshold"></li>
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