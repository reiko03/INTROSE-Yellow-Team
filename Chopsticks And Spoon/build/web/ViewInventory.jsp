
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
        
       <script src="editablegrid/editablegrid_renderers.js"></script>
		<link rel="stylesheet" href="editablegrid/editablegrid-2.0.1.css" type="text/css" media="screen">

        <title>Chopsticks and Spoon Inventory System</title>
        <style>
			body { font-family:'lucida grande', tahoma, verdana, arial, sans-serif; font-size:11px; }
			h1 { font-size: 15px; }
			a { color: #548dc4; text-decoration: none; }
			a:hover { text-decoration: underline; }
			table.testgrid { border-collapse: collapse; border: 1px solid #CCB; width: 800px; }
			table.testgrid td, table.testgrid th { padding: 5px; border: 1px solid #E0E0E0; }
			table.testgrid th { background: #E5E5E5; text-align: left; }
			input.invalid { background: red; color: #FDFDFD; }
		</style>
    <script>    
			window.onload = function() {
                                  <%
                                                    List<ItemBean> list = ItemImplementation.viewAllItems();%>
				// this approach is interesting if you need to dynamically create data in Javascript 
				var metadata = [];
				metadata.push({ name: "name", label: "NAME", datatype: "string", editable: false});
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
			} 
		</script>
		
	</head>
	
	<body>
            <h1>View Inventory</h1><a href="index.jsp"> Back to menu </a></h1> 
		<div id="tablecontent"></div>
                
              
	</body>
    </body>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>

</html>
