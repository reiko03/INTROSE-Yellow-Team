package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" media=\"screen\">\n");
      out.write("\n");
      out.write("        <title>Chopsticks and Spoon Inventory System</title>\n");
      out.write("\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            body{\n");
      out.write("                background-image:url('indexbgimg.jpg');\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .formbox{\n");
      out.write("                background-color:#d3d3d3;\n");
      out.write("                width:650px;\n");
      out.write("                padding:9px 8px 8px 8px;\n");
      out.write("                border:1px solid #808080;\n");
      out.write("                border-radius:4px;\n");
      out.write("                margin:auto;\n");
      out.write("            }\n");
      out.write("            .formbox-inner{\n");
      out.write("                background-color:#d3d3d3;\n");
      out.write("                width:400px;\n");
      out.write("                padding:9px 8px 8px 8px;\n");
      out.write("                margin:auto;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .shad{\n");
      out.write("                text-shadow:1px 1px 1px #000000;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .greetsize{\n");
      out.write("                font-size:20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .descsize{\n");
      out.write("                font-size:18px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .newsize{\n");
      out.write("                font-size:14px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .helpsize{\n");
      out.write("                font-size:12px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .welcomecolor{\n");
      out.write("                color:#f5f5f5;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("            .creds{\n");
      out.write("                font-size:10px;\n");
      out.write("                color:#808080;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- MAIN BODY -->\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("\n");
      out.write("                <br><br><br><br><br><br><br><br>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                </div>\n");
      out.write("                <br>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"formbox\">\n");
      out.write("                        <div class=\"formbox-inner\">\n");
      out.write("                            <p class=\"newsize\" align=\"center\"><b>Please Select Option</b></p>\n");
      out.write("                            <a data-toggle=\"modal\" href=\"#addItemModal\" class=\"btn btn-info btn-block\">Add Item</a>    \n");
      out.write("                            <a data-toggle=\"modal\" href=\"#addMenuItemModal\" class=\"btn btn-info btn-block\">Add Dish to Menu</a>   \n");
      out.write("                            <a data-toggle=\"modal\" href=\"#editItemModal\" class=\"btn btn-info btn-block\">Edit Item</a>\n");
      out.write("                            <a data-toggle=\"modal\" href=\"#editMenuItemModal\" class=\"btn btn-info btn-block\">Edit Dish</a>\n");
      out.write("                            <a data-toggle=\"modal\" href=\"#restockItemModal\" class=\"btn btn-info btn-block\">Restock Item</a> \n");
      out.write("                            <a href=\"ViewInventory.jsp\" class=\"btn btn-info btn-block\">View Inventory</a>\n");
      out.write("                            <a data-toggle=\"modal\" href=\"#deleteItemModal\" class=\"btn btn-info btn-block\">Delete Item</a>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <br>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"modal fade\" id=\"addItemModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <form action=\"addItemServlet\" method=\"post\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n");
      out.write("                            <h4 class=\"modal-title\">Add Item</h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                               <label for=\"dishName\">Item Name</label>\n");
      out.write("                                <input name=\"addItemName\" type=\"text\" class=\"form-control\" placeholder=\"Enter Item Name\">\n");
      out.write("                            </div>\n");
      out.write("                         \n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                               <label for=\"dishName\">Weight</label>\n");
      out.write("                                <input name=\"addItemWeight\" type=\"text\" class=\"form-control\" placeholder=\"Enter Weight\">\n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                               <label for=\"dishName\">Quantity</label>\n");
      out.write("                                <input name=\"addItemQuantity\" type=\"text\" class=\"form-control\" placeholder=\"Enter Quantity\">\n");
      out.write("                            </div>\n");
      out.write("                         \n");
      out.write("                        </div>  \n");
      out.write("\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancel</button>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <div class=\"modal fade\" id=\"addMenuItemModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <form action=\"AddTeacherServlet\" method=\"post\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n");
      out.write("                            <h4 class=\"modal-title\">Add Dish to Menu</h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"dishName\">Dish Name</label>\n");
      out.write("                                <input name=\"addDishName\" type=\"text\" class=\"form-control\" id=\"inputAddDishName\" placeholder=\"Enter Dish Name\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"ingredients\">Ingredients</label>\n");
      out.write("                                insert table && quantity here.\n");
      out.write("                            </div>\n");
      out.write("                         \n");
      out.write("\n");
      out.write("                        </div>  \n");
      out.write("\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancel</button>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("     <script type=\"text/javascript\" src=\"http://code.jquery.com/jquery.js\"></script>\n");
      out.write("        <script src=\"http://code.jquery.com/jquery.js\"></script>\n");
      out.write("        <script src=\"bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
