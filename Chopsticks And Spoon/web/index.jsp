
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
        <link rel="stylesheet" href="editablegrid/demo.css" type="text/css" media="screen">
 <script src="editablegrid/demo.js"></script>
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
                    <form action="AddDishServlet" method="post">
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
                        <script>
                            window.onload = function() {
                                  <%
                                                    List<ItemBean> list = ItemImplementation.viewAllItems();%>
				// this approach is interesting if you need to dynamically create data in Javascript 
				var metadata = [];
				metadata.push({ name: "name", label: "NAME", datatype: "string", editable: true});
				metadata.push({ name: "weight", label:"WEIGHT", datatype: "double", editable: true});
				metadata.push({ name: "quantity", label: "QUANTITY", datatype: "integer", editable: true});
				metadata.push({ name: "action", datatype: "html", editable: false});

				// a small example of how you can manipulate the object in javascript
				var i = 0;
				var data = [];
                               
                               <% for (ItemBean f : list) {%>
				data.push({id: i, values: {"name":"<%=f.getItemName()%>","weight":<%=f.getItemWeight()%>,"quantity":<%=f.getItemQuantity()%>}});
				i++;
                                <%
                               }%>
				editableGrid = new EditableGrid("DemoGridJsData");
                                
				editableGrid.load({"metadata": metadata, "data": data});
                                 editableGrid.renderGrid("tablecontent", "testgrid");
                                editableGrid.setPageSize(5);
                                editableGrid.tableRendered = function(){
                                this.updatePaginator();    
                                };
                                
                               editableGrid.setCellRenderer("action", new CellRenderer({render: function(cell, value) {
			// this action will remove the row, so first find the ID of the row containing this cell 
			var rowId = editableGrid.getRowId(cell.rowIndex);
			
			cell.innerHTML = "<a onclick=\"if (confirm('Are you sure you want to delete this item ? ')) { ajaxDelete(editableGrid.getValueAt("+cell.rowIndex+", 0));editableGrid.remove(" + cell.rowIndex + "); }  \" style=\"cursor:pointer\">" +
							 "<img src=\"" + image("delete.png") + "\" border=\"0\" alt=\"delete\" title=\"Delete row\"/></a>";
			
		}})); 
                                editableGrid.filter('');
                                 editableGrid.modelChanged = function(rowIndex, columnIndex, oldValue, newValue, row) { 
                                  var tr = editableGrid.getValueAt(rowIndex, 0);
                                 
                                $.ajax({

        url: "editItemServlet",

        type: 'POST',

        dataType: "text",

        data: {
            id: editableGrid.getRowId(rowIndex),
            columnIndex: columnIndex,
            value: newValue,
            oldValue: oldValue,
            itemName: editableGrid.getValueAt(rowIndex, 0)
        },

        success: function (response) {
            if (xhr.status === 302) {
      location.href = xhr.getResponseHeader("Location");
   }
            alert("Edit Successful!");
            editableGrid.setValueAt(rowIndex, columnIndex, newValue);
            // reset old value if failed
           
            
            // here you could also highlight the updated row to give the user some feedback
        },

        error: function(XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });
                                };
                                editableGrid.updatePaginator = function()
{
                                var paginator = $("#paginator").empty();
                                var nbPages = this.getPageCount();

                                // get interval
                                var interval = this.getSlidingPageInterval(20);
                                if (interval === null) return;

                                // get pages in interval (with links except for the current page)
                                var pages = this.getPagesInInterval(interval, function(pageIndex, isCurrent) {
                                        if (isCurrent) return "" + (pageIndex + 1);
                                        return $("<a>").css("cursor", "pointer").html(pageIndex + 1).click(function(event) { editableGrid.setPageIndex(parseInt($(this).html()) - 1); });
                                });

                                // "first" link
                                var link = $("<a>").html("<img src='" + image("move_first.png") + "'/>&nbsp;");
                                if (!this.canGoBack()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
                                else link.css("cursor", "pointer").click(function(event) { editableGrid.firstPage(); });
                                paginator.append(link);

                                // "prev" link
                                link = $("<a>").html("<img src='" + image("move_prev.png") + "'/>&nbsp;");
                                if (!this.canGoBack()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
                                else link.css("cursor", "pointer").click(function(event) { editableGrid.prevPage(); });
                                paginator.append(link);

                                // pages
                                for (p = 0; p < pages.length; p++) paginator.append(pages[p]).append(" | ");

                                // "next" link
                                link = $("<a>").html("<img src='" + image("move_next.png") + "'/>&nbsp;");
                                if (!this.canGoForward()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
                                else link.css("cursor", "pointer").click(function(event) { editableGrid.nextPage(); });
                                paginator.append(link);

                                // "last" link
                                link = $("<a>").html("<img src='" + image("move_last.png") + "'/>&nbsp;");
                                if (!this.canGoForward()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
                                else link.css("cursor", "pointer").click(function(event) { editableGrid.lastPage(); });
                                paginator.append(link);
                                
                                
                        };
                               
                      editableGrid.renderGrid("tablecontent", "testgrid");      
			};
                        
                
               
                 function pageFunction(){
                     var pageSize = document.getElementById('pagesize');
                     editableGrid.setPageSize(pageSize.options[pageSize.selectedIndex].value);        
                    
    }               
                      function ajaxDelete(x){
                         
                                $.ajax({

        url: "deleteItemServlet",

        type: 'POST',

        dataType: "text",

        data: {
            itemName: x
        },

        success: function (response) {
            alert("Deleted");
            
                           
            
            
            // reset old value if failed
           
            
            // here you could also highlight the updated row to give the user some feedback
        },

        error: function(XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });
                    
                }
                        </script>
                         
                        <div id="tablecontent"></div>
                       <div id="pagecontrol">
				<label for="pagecontrol">Rows per page: </label>
				<select id="pagesize" name="pagesize" onchange="pageFunction()">
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
                         </div>
                        <div id="paginator"></div


                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                </div>
            </div>
        </div>
         <div class="modal fade" id="restockItemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                        <script>
                            $('#restockItemModal').on('shown.bs.modal', function() {
                                  <%
                                                    List<ItemBean> list1 = ItemImplementation.viewAllItems();%>
				// this approach is interesting if you need to dynamically create data in Javascript 
				var metadata = [];
				metadata.push({ name: "name", label: "NAME", datatype: "string", editable: true});
				metadata.push({ name: "weight", label:"WEIGHT", datatype: "double", editable: true});
				metadata.push({ name: "quantity", label: "QUANTITY", datatype: "integer", editable: true});
				

				// a small example of how you can manipulate the object in javascript
				var i = 0;
				var data = [];
                               
                               <% for (ItemBean f : list1) {%>
				data.push({id: i, values: {"name":"<%=f.getItemName()%>","weight":<%=f.getItemWeight()%>,"quantity":<%=f.getItemQuantity()%>}});
				i++;
                                <%
                               }%>
				editableGrid = new EditableGrid("DemoGridJsData");
                                
				editableGrid.load({"metadata": metadata, "data": data});
                                 editableGrid.renderGrid("tablecontent", "testgrid");
                                editableGrid.setPageSize(5);
                                editableGrid.tableRendered = function(){
                                this.updatePaginator();    
                                };
                                
                                editableGrid.filter('');
                                 editableGrid.modelChanged = function(rowIndex, columnIndex, oldValue, newValue, row) { 
                                  var tr = editableGrid.getValueAt(rowIndex, 0);
                                 
                                $.ajax({

        url: "editItemServlet",

        type: 'POST',

        dataType: "text",

        data: {
            id: editableGrid.getRowId(rowIndex),
            columnIndex: columnIndex,
            value: newValue,
            oldValue: oldValue,
            itemName: editableGrid.getValueAt(rowIndex, 0)
        },

        success: function (response) {
            if (xhr.status === 302) {
      location.href = xhr.getResponseHeader("Location");
   }
            alert("Edit Successful!");
            editableGrid.setValueAt(rowIndex, columnIndex, newValue);
            // reset old value if failed
           
            
            // here you could also highlight the updated row to give the user some feedback
        },

        error: function(XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });
                                };
                                editableGrid.updatePaginator = function()
                                {
                                var paginator = $("#paginator").empty();
                                var nbPages = this.getPageCount();

                                // get interval
                                var interval = this.getSlidingPageInterval(20);
                                if (interval === null) return;

                                // get pages in interval (with links except for the current page)
                                var pages = this.getPagesInInterval(interval, function(pageIndex, isCurrent) {
                                        if (isCurrent) return "" + (pageIndex + 1);
                                        return $("<a>").css("cursor", "pointer").html(pageIndex + 1).click(function(event) { editableGrid.setPageIndex(parseInt($(this).html()) - 1); });
                                });

                                // "first" link
                                var link = $("<a>").html("<img src='" + image("move_first.png") + "'/>&nbsp;");
                                if (!this.canGoBack()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
                                else link.css("cursor", "pointer").click(function(event) { editableGrid.firstPage(); });
                                paginator.append(link);

                                // "prev" link
                                link = $("<a>").html("<img src='" + image("move_prev.png") + "'/>&nbsp;");
                                if (!this.canGoBack()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
                                else link.css("cursor", "pointer").click(function(event) { editableGrid.prevPage(); });
                                paginator.append(link);

                                // pages
                                for (p = 0; p < pages.length; p++) paginator.append(pages[p]).append(" | ");

                                // "next" link
                                link = $("<a>").html("<img src='" + image("move_next.png") + "'/>&nbsp;");
                                if (!this.canGoForward()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
                                else link.css("cursor", "pointer").click(function(event) { editableGrid.nextPage(); });
                                paginator.append(link);

                                // "last" link
                                link = $("<a>").html("<img src='" + image("move_last.png") + "'/>&nbsp;");
                                if (!this.canGoForward()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
                                else link.css("cursor", "pointer").click(function(event) { editableGrid.lastPage(); });
                                paginator.append(link);
                                
                                
                        };
                               
                      editableGrid.renderGrid("tablecontent", "testgrid");      
			};
                        
                
                        
                 function pageFunction(){
                     var pageSize = document.getElementById('pagesize');
                     editableGrid.setPageSize(pageSize.options[pageSize.selectedIndex].value);        
                    
    }
                        </script>
                         
                        <div id="tablecontent"></div>
                       <div id="pagecontrol">
				<label for="pagecontrol">Rows per page: </label>
				<select id="pagesize" name="pagesize" onchange="pageFunction()">
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
                         </div>
                        <div id="paginator"></div


                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                </div>
            </div>
        </div>                               

        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
