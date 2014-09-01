<%@page import="Bean.DishBean"%>
<%@page import="Bean.PackagedBean"%>
<%@page import="Bean.IngredientBean"%>
<%@page import="Bean.UsersBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.IngredientRestockLogBean"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>Ingredient Restock Log | Chopsticks &amp; Spoon</title>
  <meta name="description" content="">
  <meta name="author" content="">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="images/favicon.ico">
</head>
<body id="body_ingredientRestock">
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
                    <% ArrayList<DishBean> dlist = (ArrayList<DishBean>) session.getAttribute("dishlist");
                       int dishNotif = 0;
                    for(int k = 0; k < dlist.size(); k++){System.out.println(dlist.get(k).getDish_highCost());
                        if(dlist.get(k).getDish_highCost() == 1)
                            dishNotif++;
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
	      <li><a href="dishes.jsp" title="Manage Dishes">Dishes <span><%out.println(dishNotif);%></span></a></li>
		  <li><%if(useraccount.getUser_level().equals("user")){
                            %><div style="display: none">
                                <%}else{%><div style="display: inline"><a href="users.jsp" title="Manage Users">Users</a></div><%}%></li>
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
    <h1>Ingredient Restock Log Report</h1>
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
	    <th>Ingredient</th>
	    <th>Weight</th>
	    <th>Cost</th>
	    <th>Date &amp; Time</th>
	    <th>Source</th>
	  </tr>
          
          <% 
          ArrayList<IngredientRestockLogBean> ingrestockloglist = (ArrayList<IngredientRestockLogBean>) session.getAttribute("ingredientRestockLogList");
           
                for(int i = 0; i < ingrestockloglist.size(); i++){ %>
	  <tr>
	    <td><%out.println(ingrestockloglist.get(i).getRestock_username());%></td>
	    <td><%out.println(ingrestockloglist.get(i).getRestock_ingredientname());%></td>
	    <td><%out.println(ingrestockloglist.get(i).getRestock_weight() + " kg");%></td>
	    <td><%out.println(ingrestockloglist.get(i).getRestock_cost());%></td>
	    <td><%out.println(ingrestockloglist.get(i).getRestock_datetime());%></td>
	    <td><%out.println(ingrestockloglist.get(i).getRestock_source());%></td>
	  </tr>
          <% } %>
	  
	</table>
  </section>
  <!--CONTENT END-->
  </div>
</body>
</html>