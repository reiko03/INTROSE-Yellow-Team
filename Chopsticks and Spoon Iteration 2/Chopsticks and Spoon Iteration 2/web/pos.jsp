<%@page import="Bean.DishBean"%>
<%@page import="Bean.UsersBean"%>
<%@page import="Bean.IngredientBean"%>
<%@page import="Bean.PackagedBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOImplementation.PackagedImplementation"%>
<%@page import="DAOInterface.PackagedInterface"%>
<%@page import="DAOImplementation.DishImplementation"%>
<%@page import="DAOInterface.DishInterface"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>Point of Sales | Chopsticks &amp; Spoon</title>
  <meta name="description" content="">
  <meta name="author" content="">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <link rel="stylesheet" href="css/style.css">
  <script src="bootstrap/js/jquery.min.js"></script>
  <link rel="icon" href="images/favicon.ico">
</head>
<body id="body_pos">
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
    <h1>Point of Sales</h1>
    <div class="wrapReceipt">
      <div id="receipt">
        <h3>Receipt</h3>
  	  <table id="receiptTable">
	    <tr>
	      <th>Item</th>
	      <th>Price</th>
	      <th>Remove</th>
 	    </tr>
	    
      </table>
         
	  <form method="POST" action="SubmitReceiptServlet">
  	    <ul>
	      <li>Total: <input type="text" id="receiptTotals" name="receiptTotals" value="0.00" readonly></li>
          <li>Payment: <input required type="text" name="payment" value="0.00" onchange="generateChange(this.value)"></li>
          <li>Change: <input readonly type="text" name="receiptChange" value="0.00" id="receiptChange"></li>
	    </ul>
              <input type="hidden" id="username" name="username" value="<%=useraccount.getUser_name()%>">
              <input type="hidden" id="packagedArray" name="packagedArray">
              <input type="hidden" id="dishArray" name="dishArray">
	    <input type="submit" value="Submit">
      </form>
	  </div>
    </div>
    <br class="clear">
		  
    <div class="wrapDishMenu">
      <h3>Menu</h3>
      <ul>
        <% DishInterface dishDAO = new DishImplementation();
        PackagedInterface packDAO = new PackagedImplementation();
        
        for(int i = 0; i < dishDAO.getDishList().size();i++){
        %>
        <li><a href="#" onclick="addToReceipt('dish', '<%=dishDAO.getDishList().get(i).getDish_name()%>','<%=dishDAO.getDishList().get(i).getDish_price()%>','<%=dishDAO.getDishList().get(i).getDish_id()%>')">
                <%=dishDAO.getDishList().get(i).getDish_name()%>
                <span><%=dishDAO.getDishList().get(i).getDish_price()%></span>
        </a></li>
        <%}%>
        <% for(int i = 0; i < packDAO.getPackagedList().size();i++){%>   
        <li><a href="#" onclick="addToReceipt('packaged', '<%=packDAO.getPackagedList().get(i).getPackaged_name()%>','<%=packDAO.getPackagedList().get(i).getPackaged_price()%>','<%=packDAO.getPackagedList().get(i).getPackaged_id()%>')" ><%=packDAO.getPackagedList().get(i).getPackaged_name()%><span><%=packDAO.getPackagedList().get(i).getPackaged_price()%></span></a></li>
        <%}%>

      </ul>
    </div>
  </section>
  <!--CONTENT END-->
  </div>
        <div id="successCreate" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="pos.jsp" data-dismiss="alert" title="Close">X</a>
  <strong><font color="green">Success!</font></strong> <font color="black">You have just successfully submitted a receipt!</font>
</div>
</div>
        <div id="failCreate" class="wrapModal">
	   <div class="alert alert-warning alert-dismissible" role="alert">
  <a class="right close button" href="pos.jsp" data-dismiss="alert" title="Close">X</a>
  <strong><font color="red">Unsuccessful!</font></strong> <font color="black">You were unable to submit a receipt!</font>
</div>
</div>
        <script>
            var totalPrice = 0;
            var dishArray = new Array();
            var packArray = new Array();
            function addToReceipt(type,name,price,id){
                if(type === 'dish'){
                   dishArray.push(id);
                    $('#receiptTable').append('<tr id="deleteD'+id+'"><td>'+ name +'</td>' 
						 +'<td>'+price+'</td>'+
						 '<td><a href="#" onclick="deleteRow('+id+',\'dish\','+price+')">- Remove</a></td></tr>');
                   
                   
        }
               else{
                   packArray.push(id);
                    $('#receiptTable').append('<tr id="pDelete'+id+'"><td>'+ name +'</td>' 
						 +'<td>'+price+'</td>'+
						 '<td><a href="#" onclick="deleteRow('+id+',\'packaged\','+price+')">- Remove</a></td></tr>');
                   
                
                
        }
               
               totalPrice += parseFloat(price);
               receiptTotals.value = totalPrice;
               
               
             
            }
            
            function generateChange(payment){
                if(payment > totalPrice){
                    var change = payment - totalPrice;
                    receiptChange.value = change;
                     $('#dishArray').val(dishArray.join(","));
                      $('#packagedArray').val(packArray.join(","));
                    }
                else
                    receiptChange.value = "Not Enough Payment";
            }
            
            function deleteRow(id,type, price){

                
                if(type.toString() === 'dish'){
                    
                dishArray.pop(id);
                var row = document.getElementById("deleteD"+id);
                row.parentNode.removeChild(row);
        }
                else{
                packArray.pop(id);
                var row = document.getElementById("pDelete"+id);
                row.parentNode.removeChild(row);
                 
            }
                  totalPrice -= parseFloat(price);
               receiptTotals.value = totalPrice;
               
                
               
            }
        </script>
</body>
</html>