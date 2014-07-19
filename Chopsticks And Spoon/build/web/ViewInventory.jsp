
<%@page import="java.util.List"%>
<%@page import="Bean.ItemBean"%>"
<%@page import="DAOImplementation.ItemImplementation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
       <script src="editablegrid/editablegrid-2.0.1.js"></script>
       	<link rel="stylesheet" href="editablegrid/style.css" type="text/css" media="screen">
        	<link rel="stylesheet" href="editablegrid/demo.css" type="text/css" media="screen">
 <script src="editablegrid/demo.js"></script>
       <script src="editablegrid/editablegrid_renderers.js"></script>
		<link rel="stylesheet" href="editablegrid/editablegrid-2.0.1.css" type="text/css" media="screen">

        <title>Chopsticks and Spoon Inventory System</title>

    <script>    
                        

			window.onload = function() {
                                  <%
                                                    List<ItemBean> list = ItemImplementation.viewAllItems();%>
				// this approach is interesting if you need to dynamically create data in Javascript 
				var metadata = [];
				metadata.push({ name: "name", label: "NAME", datatype: "string", editable: true});
				metadata.push({ name: "weight", label:"WEIGHT", datatype: "double", editable: false});
				metadata.push({ name: "quantity", label: "QUANTITY", datatype: "integer", editable: false});
				

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
                                editableGrid.setPageSize(3);
                                editableGrid.tableRendered = function(){
                                this.updatePaginator();    
                                };
                                
                                editableGrid.filter('');
                                
                                editableGrid.modelChanged = function(rowIndex, columnIndex, oldValue, newValue, row) { 
                                displayMessage("Value for '" + this.getColumnName(columnIndex) + "' in row " + this.getRowId(rowIndex) + " has changed from '" + oldValue + "' to '" + newValue + "'");
                                alert("hi");
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
                        var searchField = document.getElementById('filter');
                                searchField.addEventListener(
                                 'keyup',
                                 function (){
                                 editableGrid.filter(searchField.value);
                                  
                                  
                                    }
                    );
    
                            
                               
                      editableGrid.renderGrid("tablecontent", "testgrid");      
			};
                        
                
                 function displayMessage(text, style) { 
	$("message").innerHTML = "<p class='" + (style || "ok") + "'>" + text + "</p>"; 
}        
                 function pageFunction(){
                     var pageSize = document.getElementById('pagesize');
                     editableGrid.setPageSize(pageSize.options[pageSize.selectedIndex].value);        
                    
    }
		</script>
		
	</head>
	
	<body>
            
            <h1>View Inventory</h1><a href="index.jsp"> Back to menu </a></h1> 
                <div id="message"></div>
               

			<!--  Number of rows per page and bars in chart -->
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
                        
                 <!-- Grid filter -->
		<label for="filter">Filter :</label>
		<input type="text" id="filter"/>
		<div id="paginator"></div
			<!-- Grid contents -->
		<div id="tablecontent"></div>
		
			<!-- Paginator control -->
		
                
             
	</body>
    </body>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>

</html>
