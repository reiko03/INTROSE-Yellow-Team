<%@page import="java.util.ArrayList"%>
<%@page import="Bean.DamageLogBean"%>
<%@page import="Bean.UsersBean"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>Damaged Packaged Item Log | Chopsticks &amp; Spoon</title>
  <meta name="description" content="">
  <meta name="author" content="">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="images/favicon.ico">
</head>
<body id="body_packagedDamage">
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
    <h1>Damaged Packaged Item Log Report</h1>
	<div class="logNav">
	  <ul>
	    <li class="logNav_ingredientRestock"><a href="GetIngredientRestockLogListServlet" title="Ingredient Restock Log">Ingredient Restock</a></li>
	    <li class="logNav_ingredientSpoil"><a href="GetIngredientSpoilLogListServlet" title="Ingredient Spoil Log">Ingredient Spoil</a></li>
	    <li class="logNav_packagedRestock"><a href="GetPackagedRestockLogListServlet" title="Packaged Restock Log">Packaged Restock</a></li>
	    <li class="logNav_packagedDamage"><a href="GetPackagedDamagedLogListServlet" title="Packaged Damage Log">Packaged Damage</a></li>
	    <li class="logNav_dishSale"><a href="logDishSale.jsp" title="Dish Sale Log">Dish Sale</a></li>
	    <li class="logNav_packagedSale"><a href="logPackagedSale.jsp" title="Packaged Sale Log">Packaged Sale</a></li>
	  </ul>
	</div>
	<table>
	  <tr>
	    <th>User</th>
	    <th>Packaged Item</th>
	    <th>Quantity</th>
	    <th>Date &amp; Time</th>
	  </tr>
	  <% 
          ArrayList<DamageLogBean> packrestockloglist = (ArrayList<DamageLogBean>) session.getAttribute("damageLogList");
           
                for(int i = 0; i < packrestockloglist.size(); i++){ %>
	  <tr>
	    <td><%out.println(packrestockloglist.get(i).getUsername());%></td>
	    <td><%out.println(packrestockloglist.get(i).getPackagedname());%></td>
	    <td><%out.println(packrestockloglist.get(i).getDamage_quantity());%></td>
	    <td><%out.println(packrestockloglist.get(i).getDamage_datetime());%></td>
	  </tr>
          <% } %>
	</table>
  </section>
  <!--CONTENT END-->
  </div>
</body>
</html>