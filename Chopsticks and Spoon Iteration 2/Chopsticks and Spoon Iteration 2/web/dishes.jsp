<%@page import="Bean.IngredientBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Dishes | Chopsticks &amp; Spoon</title>
        <meta name="description" content="">
        <meta name="author" content="">  
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
        <link rel="stylesheet" href="css/style.css">
        <script src="bootstrap/js/jquery.min.js"></script>
        <link rel="icon" href="images/favicon.ico">
    </head>
    <body id="body_dishes">
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
                            <li><a href="dishes.jsp" title="Manage Dishes">Dishes <span>1</span></a></li>
                            <li><a href="users.jsp" title="Manage Users">Users</a></li>
                            <li><a href="logIngredientRestock.jsp" title="View Logs">View Logs</a></li>
                            <li><a href="" title="Log Out">Log Out</a></li>
                            <li id="dateTime"><%= new java.util.Date()%></li>
                        </ul>
                    </div>
                    <br class="clear">
                </header>
                <!--HEADER END-->
            </div>
            <!--CONTENT START-->
            <section class="wrapContent">
                <h1>Dishes</h1>
                <div class="left">
                    <form id="searchDish" class="search">
                        <input type="search" name="search" placeholder="Search..">
                        <input type="submit" value="Search">
                    </form>
                </div>
                <div class="right">
                    <a class="button left" href="#createDish" title="Create New Dish">Create New Dish</a>
                </div>
                <br class="clear">
                <table>
                    <tr>
                        <th>Dish</th>
                        <th>Cost to Make</th>
                        <th>Selling Price</th>
                        <th>View Recipe</th>
                        <th>Edit</th>
                    </tr>
                    <%
                        ArrayList<IngredientBean> inglist = (ArrayList<IngredientBean>) session.getAttribute("ingredientlist");
                       
                        for (int i = 0; i < inglist.size(); i++) {
                            System.out.println(inglist.get(i).getIngredient_id());%>
                    <% }%>
                    <!--YUNG EDIT DITO PWEDENG I-EDIT YUNG SELLING PRICE & RECIPE-->
                    <!--PUT DISHES HERE!-->
                    <tr class="warning">
                        <td>Teriyaki Beef</td>
                        <td>53.00</td>
                        <td>40.00</td>
                        <td class="tableButton"><a href="#viewRecipe" title="View Recipe">View Recipe</a></td>
                        <td class="tableButton"><a href="#editDish" title="Edit">> Edit</a></td>
                    </tr>
                    <tr>
                        <td>Pancit Bihon</td>
                        <td>190.00</td>
                        <td>230.00</td>
                        <td class="tableButton"><a href="#viewRecipe" title="View Recipe">View Recipe</a></td>
                        <td class="tableButton"><a href="#editDish" title="Edit">> Edit</a></td>
                    </tr>
                    <tr>
                        <td>Steamed Dory</td>
                        <td>70.00</td>
                        <td>95.00</td>
                        <td class="tableButton"><a href="#viewRecipe" title="View Recipe">View Recipe</a></td>
                        <td class="tableButton"><a href="#editDish" title="Edit">> Edit</a></td>
                    </tr>
                </table>
            </section>
            <!--MODALS START-->
            <%int i = 0;%>
            
            <div id="createDish" class="wrapModal">
                <div>
                    <a class="right close button" href="#close" title="Close">X</a>
                    <h3>Create New Dish</h3>
                    <form id="createDishForm">
                        <ul>
                            <li>New Dish Name: <input required type="text" name="dishName"></li>
                            <li>New Dish Price: <input required type="text" name="dishPrice"></li>
                            <li>Recipe:
                                <table id="newRecipe">
                                    <tr>
                                        <th>Ingredient</th>
                                        <th>Weight (kg)</th>
                                        <th>Cost</th>
                                    </tr>
                                   
                                </table>
                                <strong class="right">Total Cost: <span id="recipeTotal">00.00</span></strong>
                                <a class="button" href="#addNewIngredient" title="add another ingredient">+ add another ingredient</a>
                            </li>
                        </ul>
                        <br class="clear">
                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>
                        
			<div id="addNewIngredient" class="wrapModal">
                <div>
                    <a class="right close button" href="#close" title="Close">X</a>
                    <form id="addNewIngredientForm">
                        <ul>
                               <table id="newRecipe">
                                    <tr>
                                        <th>Ingredient</th>
                                        <th>Weight (kg)</th>
                                        <th>Cost</th>
                                    </tr>
                                    <tr>

                                        <td>
                                            <select name="chooseIngredient" onchange="ajaxGenerateIngredient(this.value)">
                                                <%for (int j = 0; j < inglist.size(); j++) {%>
                                                <option value="<%=inglist.get(j).getIngredient_id()%>"><%out.println(inglist.get(j).getIngredient_name());%></option>
                                                <%}%>
                                            </select>
                                        </td> 

                                        <td><input required type="text" name="recipeWeight" id="recipeWeight"></td>
                                        <td><input type="text" id="recipeCost" readonly></td>
                                    </tr>
                                </table>
                              
                           </li>
                        </ul>
                        <br class="clear">
                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>                               
            <div id="viewRecipe" class="wrapModal">
                <div>
                    <a class="right close button" href="#close" title="Close">X</a>
                    <h3>View Recipe</h3>
                    <form id="viewRecipeForm">
                        <ul>
                            <li id="viewDishName"><h4>Dish Name</h4></li>
                        </ul>
                        <table>
                            <tr>
                                <th>Ingredient</th>
                                <th>Weight (kg)</th>
                                <th>Cost</th>
                            </tr>			
                            <tr>			
                                <td>Beef</td>
                                <td>0.25</td>
                                <td>30.00</td>
                            </tr>			
                            <tr>			
                                <td>Carrots</td>
                                <td>0.15</td>
                                <td>15.00</td>
                            </tr>			
                            <tr>			
                                <td>Pancit Bihon</td>
                                <td>0.1</td>
                                <td>8.00</td>
                            </tr>							
                        </table>
                        <strong class="right">Total Cost: <span id="recipeTotal">53.00</span></strong>
                        <br class="clear">
                    </form>
                </div>
            </div>
            <div id="editDish" class="wrapModal">
                <div>
                    <a class="right close button" href="#close" title="Close">X</a>
                    <h3>Edit Dish</h3>
                    <form id="editDishForm">
                        <ul>
                            <li id="editDishName"><h4>Dish Name</h4></li>
                            <li>New Dish Name: <input required type="text" name="dishName"></li>
                            <li>New Dish Price: <input required type="text" name="dishPrice"></li>
                        </ul>
                        <table>
                            <tr>
                                <th>Ingredient</th>
                                <th>Weight (kg)</th>
                                <th>Cost</th>
                            </tr>			
                            <tr>			
                                <td>Beef</td>
                                <td contenteditable>0.25</td>
                                <td>30.00</td>
                            </tr>			
                            <tr>			
                                <td>Carrots</td>
                                <td contenteditable>0.15</td>
                                <td>15.00</td>
                            </tr>			
                            <tr>			
                                <td>Pancit Bihon</td>
                                <td contenteditable>0.1</td>
                                <td>8.00</td>
                            </tr>							
                        </table>
                        <strong class="right">Total Cost: <span id="recipeTotal">53.00</span></strong>
                        <a class="button" href="#addIngredient" title="add another ingredient">+ add another ingredient</a>
                        <br class="clear">
                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>	
            <!--MODALS END-->
            <!--CONTENT END-->
        </div>

        <script>
		function ajaxGenerateIngredient(ingID){
		$.ajax({

        url: "GenerateDishIngredient",

        type: 'POST',

        dataType: "json",

        data: {
            ingredientID: ingID
        },

        success: function (data) {
            
                       $('#recipeWeight').on('change', function() {
  recipeCost.val(recipeWeight*data.IngCost/data.IngWeight);
  $('#addNewIngredientForm').on('submit', function(){
   $('#newRecipe').append('<tr><td>'+ data.IngName +'</td></tr>' 
						 +'<td>'+recipeWeight.value+'</td>'+
						 '<td>'+recipeCost.value+'</td>');
  
  });// or $(this).val()
});

                //inventoryNumbers.push(data.RMInventoryID);
   
                //$('#numbers').val(inventoryNumbers.join(","));
              
                
               // $('#addRow').unbind('click');
               
            });
           
        },

        error: function(XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });
		
		
		}
		</script>
        <!--  <script>
function addIngredientRow() {
var table = document.getElementById("newRecipe");
var row = table.insertRow(2);
var cell1 = row.insertCell(0);
var cell2 = row.insertCell(1);
//cell1.innerHTML = "NEW CELL1";
//    cell1.innerHTML = "<select name=\"chooseIngredient<\%=i%>\">" +
//                      "<\%for(int j = 0; j < inglist.size(); j++){\%>" +
//		      "<option value=\"<\%=inglist.get(j).getIngredient_id()\%>\"><\%out.println(inglist.get(j).getIngredient_name());\%></option>" +
//                      "<\%}\%>" +
//		      "</select>";
document.write("<select name=\"chooseIngredient<\%=i%>\">");
                document.write("<\%for(int j = 0; j < inglist.size(); j++){\%>");
                document.write("1<option value=\"<\%=inglist.get(j).getIngredient_id()\%>\">");
                document.write("\<\%out.println(inglist.get(j).getIngredient_name());\%>");
                document.write("</option>");
                document.write("<\%}\%>");
              document.write("</select>");
      cell2.innerHTML = "NEW CELL2";
}
</script>    -->



    </body>
</html>