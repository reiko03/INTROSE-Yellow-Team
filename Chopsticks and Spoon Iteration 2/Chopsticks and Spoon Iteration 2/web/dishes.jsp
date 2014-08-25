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
	  <!--YUNG EDIT DITO PWEDENG I-EDIT YUNG SELLING PRICE & RECIPE-->
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
				<tr>
				  <td>
				    <select>
		              <option value="beef">Beef</option>
					  <option value="carrots">Carrots</option>
					  <option value="dory">Dory</option>
					  <option value="potatoes">Potatoes</option>
					  <option value="pancit bihon">Pancit Bihon</option>
					  <option value="pancit miki">Pancit Miki</option>
				    </select>
				  </td>
				  <td><input required type="text" name="recipeWeight"></td>
				  <td>00.00</td>
				</tr>
			  </table>
			  <strong class="right">Total Cost: <span id="recipeTotal">00.00</span></strong>
			  <a class="button" href="#addIngredient" title="add another ingredient">+ add another ingredient</a>
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
</body>
</html>