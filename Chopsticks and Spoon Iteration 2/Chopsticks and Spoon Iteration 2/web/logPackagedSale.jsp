<%@page import="DAOImplementation.UserImplementation"%>
<%@page import="DAOInterface.UsersInterface"%>
<%@page import="Bean.PackagedSaleLogBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOImplementation.PackagedImplementation"%>
<%@page import="DAOInterface.PackagedInterface"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>Packaged Item Sales Log | Chopsticks &amp; Spoon</title>
  <meta name="description" content="">
  <meta name="author" content="">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="images/favicon.ico">
</head>
<body id="body_packagedSale">
  <div class="wrap">
  <!--SIDENAV START-->
  <div class="wrapSideNav">
    <div class="sideNav">
	  <div class="userProfile">
	    <span class="username">Username</span>
		<span class="position">Position</span>
	  </div>
	  <ul>
	    <li class="nav_pos"><a href="pos.jsp" title="Point of Sales">Point of Sales</a></li>
	    <li class="nav_ingredients"><a href="ingredients.jsp" title="Ingredients">Ingredients <span>2</span></a></li>
	    <li class="nav_packaged"><a href="packaged.jsp" title="Pacakaged Items">Packaged Items <span>1</span></a></li>
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
		  <li><a href="logIngredientRestock.jsp" title="View  Logs">View  Logs</a></li>
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
    <h1>Packaged Sales Log Report</h1>
	<div class="logNav">
	  <ul>
	    <li class="logNav_ingredientRestock"><a href="logIngredientRestock.jsp" title="Ingredient Restock Log">Ingredient Restock</a></li>
	    <li class="logNav_ingredientSpoil"><a href="logIngredientSpoil.jsp" title="Ingredient Spoil Log">Ingredient Spoil</a></li>
	    <li class="logNav_packagedRestock"><a href="logPackagedRestock.jsp" title="Packaged Restock Log">Packaged Restock</a></li>
	    <li class="logNav_packagedDamage"><a href="logPackagedDamage.jsp" title="Packaged Damage Log">Packaged Damage</a></li>
	    <li class="logNav_dishSale"><a href="logDishSale.jsp" title="Dish Sale Log">Dish Sale</a></li>
	    <li class="logNav_packagedSale"><a href="logPackagedSale.jsp" title="Packaged Sale Log">Packaged Sale</a></li>
	  </ul>
	</div>
	<table>
            <% PackagedInterface packDAO = new PackagedImplementation();
            UsersInterface userDAO = new UserImplementation();
            ArrayList<PackagedSaleLogBean> packagedLogList = packDAO.getPackagedLogList();
            
            %>
	  <tr>
	    <th>User</th>
	    <th>Order No.</th>
	    <th>Packaged Item</th>
	    <th>Cost</th>
	    <th>Price</th>
	    <th>Date &amp; Time</th>
	  </tr>
          <% for(int i = 0 ; i < packagedLogList.size();i++){%>
	  <tr><td><%=userDAO.getUser(packagedLogList.get(i).getP_sale_userid()).getUser_name()%></td>
              <td><%=packagedLogList.get(i).getP_sale_packagedid()%></td>
              <td><%=packDAO.getPackaged(packagedLogList.get(i).getP_sale_packagedid()).getPackaged_name()%></td>
              <td><%=packagedLogList.get(i).getSale_cost()%></td>
	    <td><%=packagedLogList.get(i).getSale_price()%></td>
	    <td><%=packagedLogList.get(i).getSale_datetime()%></td>
	  </tr>
              <%}%>
	    
	</table>
  </section>
  <!--CONTENT END-->
  </div>
</body>
</html>