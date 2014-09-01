<%@page import="Bean.DishBean"%>
<%@page import="Bean.IngredientBean"%>
<%@page import="Bean.UsersBean"%>
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
  <script src="bootstrap/js/jquery.min.js"></script>
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="images/favicon.ico">
</head>
<body id="body_packaged">
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
    <h1>Packaged Items</h1><!--
	<div class="left">
	  <form id="searchPackaged" class="search">
	    <input type="search" name="search" placeholder="Search..">
		<input type="submit" value="Search">
	  </form>
	</div>-->
	<div class="right">
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
         
              for(int i = 0; i < packlist.size(); i++){
            if(packlist.get(i).getPackaged_needSupply() == 1){%>
                    <tr class="warning">
                        <%}else{%>
                        <tr>
                        <%}%>
	    <td><%out.println(packlist.get(i).getPackaged_name());%></td>
	    <td><%out.println(packlist.get(i).getPackaged_quantity());%></td>
	    <td><%out.println(packlist.get(i).getPackaged_cost());%></td>
            <td><%out.println(packlist.get(i).getPackaged_price());%></td>
		<td class="tableButton"><a href="#editPackaged" title="Edit" onclick="ajaxEditPackaged(<%=packlist.get(i).getPackaged_id()%>)"> Edit</a></td>
		<td class="tableButton"><a href="#restockPackaged" title="Restock" onclick="ajaxRestockPackaged(<%=packlist.get(i).getPackaged_id()%>)">+ Restock</a></td>
	  </tr>
          <% } %>
          
           <script>
           function ajaxEditPackaged(id){

             $.ajax({

        url: "AjaxEditPackagedServlet",

        type: 'POST',

        dataType: "json",

        data: {
            packagedID : id
        },

        success: function (data) {
           
           packagedID.value=data.PackagedID;
           packagedName.value=data.PackagedName;
           packagedPrice.value=data.PackagedPrice;
           packagedThreshold.value=data.PackagedThreshold;
           
           
           
        },

        error: function(XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });}
            </script>
            
            <script>
           function ajaxRestockPackaged(id){

             $.ajax({

        url: "AjaxRestockPackagedServlet",

        type: 'POST',

        dataType: "json",

        data: {
            restockpackagedID : id
        },

        success: function (data) {
           
          restockpackagedID.value=data.RestockPackagedID;          
           
        },

        error: function(XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });}
            </script>
          
	</table>
  </section>
  <!--MODALS START-->
  <div id="successReport" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="GetPackagedListServlet" data-dismiss="alert" title="Close">X</a>
  <strong><font color="green">Success!</font></strong> <font color="black">You have just successfully reported a damaged package!</font>
</div>
</div>
  <div id="successRestock" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="GetPackagedListServlet" data-dismiss="alert" title="Close">X</a>
  <strong><font color="green">Success!</font></strong> <font color="black">You have just successfully restocked a package!</font>
</div>
</div>
  <div id="successEdit" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="GetPackagedListServlet" data-dismiss="alert" title="Close">X</a>
  <strong><font color="green">Success!</font></strong> <font color="black">You have just successfully edited an package!</font>
</div>
</div>
  <div id="successCreate" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="GetPackagedListServlet" data-dismiss="alert" title="Close">X</a>
  <strong><font color="green">Success!</font></strong> <font color="black">You have just successfully edited a package!</font>
</div>
</div>
  <div id="failCreate" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="#close" data-dismiss="alert" title="Close">X</a>
  <strong><font color="red">Error!</font></strong> <font color="black">Unsuccessfully created a packaged item! (*Name must be unique)</font>
</div>
</div>
	<div id="reportDamaged" class="wrapModal">
	  <div>
	    <a class="right close button" href="#close" title="Close">X</a>
	    <h3>Report Damaged Packaged Item</h3>
		<form action="ReportDamagedPackaged" id="reportDamagedForm">
		  <ul>
		  <li>Packaged Item:
		    <select name="choosePackaged">
		        <%for(int j = 0; j < packlist.size(); j++){%>
		      <option value="<%=packlist.get(j).getPackaged_id()%>"><%out.println(packlist.get(j).getPackaged_name());%></option>
                      <%}%>
			  </select>
		  </li>
		  <li>Damaged Quantity: <input required type="text" pattern="^[1-9]\d*$" id="damagedQuantity" name="damagedQuantity" oninput="check(this)"></li>
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
		    <li>Packaged Item Name: <input required type="text" pattern="^[a-zA-Z\s]*$" name="packagedName" oninput="check(this)"></li>
		    <li>Quantity: <input required type="text" pattern="^[1-9]\d*$" name="packagedQuantity" oninput="check(this)"></li>
		    <li>Item Cost (per piece): <input required type="text" pattern="^\d*\.?\d*$" name="packagedCost" oninput="check(this)"></li>
		    <li>Selling Price (per piece): <input required type="text" pattern="^\d*\.?\d*$" name="packagedPrice" oninput="check(this)"></li>
		    <!--<li>Item Source: <input required type="text" name="packagedSource"></li>-->
		    <li>Quantity Threshold: <input required type="text" pattern="^[1-9]\d*$" name="packagedThreshold" oninput="check(this)"></li>
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
		<form action="RestockPackagedServlet" id="restockPackagedForm">
		  <ul>
		    <li id="restockPackagedName"><h4>Packaged Item</h4></li>
                    <input type="hidden" id="restockpackagedID" id="restockpackagedID" name="restockpackagedID" >
		    <li>Restock Quantity: <input required type="text" pattern="^[1-9]\d*$" id="restockQuantity" name="restockQuantity" oninput="check(this)"></li>
		    <li>Restock Cost (per piece): <input required type="text" pattern="^\d*\.?\d*$" id="restockCost" name="restockCost" oninput="check(this)"></li>
		    <li>Restock Source: <input required type="text" id="restockSource" name="restockSource" oninput="check(this)"></li>
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
		<form action="EditPackagedServlet" id="editPackagedForm">
		  <ul>
		    <li id="editPackagedName"><h4>Packaged Item Info</h4></li>
                    <input type="hidden" id="packagedID" name="packagedID">
		    <li>New Name: <input required type="text" pattern="^[a-zA-Z\s]*$" id="packagedName" name="packagedName" oninput="check(this)"></li>
		    <li>New Selling Price: <input required type="text" pattern="^\d*\.?\d*$" id="packagedPrice" name="packagedPrice" oninput="check(this)"></li>
		    <li>New Threshold: <input required type="text" pattern="^[1-9]\d*$" id="packagedThreshold" name="packagedThreshold" oninput="check(this)"></li>
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