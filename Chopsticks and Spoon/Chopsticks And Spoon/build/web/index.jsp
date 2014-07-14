


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">

        <title>Chopsticks and Spoon Inventory System</title>

        <style type="text/css">
            body{
                background-image:url('indexbgimg.jpg');
            }

            .formbox{
                background-color:#d3d3d3;
                width:650px;
                padding:9px 8px 8px 8px;
                border:1px solid #808080;
                border-radius:4px;
                margin:auto;
            }
            .formbox-inner{
                background-color:#d3d3d3;
                width:400px;
                padding:9px 8px 8px 8px;
                margin:auto;
            }

            .shad{
                text-shadow:1px 1px 1px #000000;
            }

            .greetsize{
                font-size:20px;
            }

            .descsize{
                font-size:18px;
            }

            .newsize{
                font-size:14px;
            }

            .helpsize{
                font-size:12px;
            }

            .welcomecolor{
                color:#f5f5f5;
            }


            .creds{
                font-size:10px;
                color:#808080;
            }
        </style>
    </head>
    <body>
        <!-- MAIN BODY -->
        <div class="container">
            <div class="row">

                <br><br><br><br><br><br><br><br>
                <div class="row">
                </div>
                <br>
                <div class="row">
                    <div class="formbox">
                        <div class="formbox-inner">
                            <p class="newsize" align="center"><b>Please Select Option</b></p>
                            <a data-toggle="modal" href="#addItemModal" class="btn btn-info btn-block">Add Item</a>    
                            <a data-toggle="modal" href="#addMenuItemModal" class="btn btn-info btn-block">Add Dish to Menu</a>   
                            <a data-toggle="modal" href="#editItemModal" class="btn btn-info btn-block">Edit Item</a>
                            <a data-toggle="modal" href="#editMenuItemModal" class="btn btn-info btn-block">Edit Dish</a>
                            <a data-toggle="modal" href="#restockItemModal" class="btn btn-info btn-block">Restock Item</a> 
                            <a href="ViewInventory.jsp" class="btn btn-info btn-block">View Inventory</a>
                            <a data-toggle="modal" href="#deleteItemModal" class="btn btn-info btn-block">Delete Item</a>


                        </div>
                    </div>
                </div>
                <br>

            </div>
        </div>

        <div class="modal fade" id="addItemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addItemServlet" method="post">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Add Item</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                               <label for="dishName">Item Name</label>
                                <input name="addItemName" type="text" class="form-control" placeholder="Enter Item Name">
                            </div>
                         
                            <div class="form-group">
                               <label for="dishName">Weight</label>
                                <input name="addItemWeight" type="text" class="form-control" placeholder="Enter Weight">
                            </div>
                            
                            <div class="form-group">
                               <label for="dishName">Quantity</label>
                                <input name="addItemQuantity" type="text" class="form-control" placeholder="Enter Quantity">
                            </div>
                         
                        </div>  

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        
        <div class="modal fade" id="addMenuItemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddTeacherServlet" method="post">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Add Dish to Menu</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="dishName">Dish Name</label>
                                <input name="addDishName" type="text" class="form-control" id="inputAddDishName" placeholder="Enter Dish Name">
                            </div>
                            <div class="form-group">
                                <label for="ingredients">Ingredients</label>
                                insert table && quantity here.
                            </div>
                         

                        </div>  

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        
     <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
