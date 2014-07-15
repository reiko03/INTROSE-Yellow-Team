
<%@page import="java.util.List"%>
<%@page import="Bean.ItemBean"%>"
<%@page import="DAOImplementation.ItemImplementation"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!--  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"> -->
      <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        
        <script src="editablegrid/editablegrid-2.0.1.js"></script>

        <script src="editablegrid/editablegrid_renderers.js"></script>
        <link rel="stylesheet" href="editablegrid/editablegrid-2.0.1.css" type="text/css" media="screen">

        <title>Chopsticks and Spoon Inventory System</title>

        <style type="text/css">
            body{
                background-image:url('indexbgimg.jpg');
            }

            h1 { font-size: 15px; }
            a { color: #548dc4; text-decoration: none; }
            a:hover { text-decoration: underline; }
            table.testgrid { border-collapse: collapse; border: 1px solid #CCB; width: 800px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px; }
            table.testgrid td, table.testgrid th { padding: 5px; border: 1px solid #E0E0E0; }
            table.testgrid th { background: #E5E5E5; text-align: left; }
            input.invalid { background: red; color: #FDFDFD; }

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

        <div class="modal fade" id="editItemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddTeacherServlet" method="post">
                        <script>
                            window.onload = function() {
                            <%
                                List<ItemBean> list = ItemImplementation.viewAllItems();%>
                                // this approach is interesting if you need to dynamically create data in Javascript 
                                var metadata = [];
                                metadata.push({name: "name", label: "NAME", datatype: "string", editable: false});
                                metadata.push({name: "weight", label: "WEIGHT", datatype: "double", editable: false});
                                metadata.push({name: "quantity", label: "QUANTITY", datatype: "integer", editable: false});


                                // a small example of how you can manipulate the object in javascript
                                var i = 0;
                                var data = [];

                            <% for (ItemBean f : list) {%>
                                data.push({id: i, values: {"name": "<%=f.getItemName()%>", "weight":<%=f.getItemWeight()%>, "quantity":<%=f.getItemQuantity()%>}});
                                i++;
                            <%
                                }%>
                                editableGrid = new EditableGrid("DemoGridJsData");
                                editableGrid.load({"metadata": metadata, "data": data});
                                editableGrid.renderGrid("tablecontent", "testgrid");
                            }
                        </script>
                        <div id="tablecontent"></div>


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
