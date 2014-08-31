/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Bean.PackagedBean;
import DAOImplementation.PackagedImplementation;
import DAOInterface.PackagedInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Keiko Nagano
 */
@WebServlet(name = "AddPackagedServlet", urlPatterns = {"/AddPackagedServlet"})
public class AddPackagedServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String tempquantity;
           int quantity;
           String tempcost;
           double cost;
           String tempprice;
           double price;
           String tempthreshold;
           int threshold;
           int isnotUnique = 0;
            
            PackagedInterface packaged = new PackagedImplementation();
            PackagedBean pack = new PackagedBean();
           
           pack.setPackaged_name(request.getParameter("packagedName"));
           
           tempquantity = request.getParameter("packagedQuantity");
           quantity = Integer.parseInt(tempquantity);
           pack.setPackaged_quantity(quantity);
           
           tempcost = request.getParameter("packagedCost");
           cost = Double.parseDouble(tempcost);
           pack.setPackaged_cost(cost);
           
           tempprice = request.getParameter("packagedPrice");
           price = Double.parseDouble(tempprice);
           pack.setPackaged_price(price);
           
           tempthreshold = request.getParameter("packagedThreshold");
           threshold = Integer.parseInt(tempthreshold);
           pack.setPackaged_threshold(threshold);
          
            ArrayList<PackagedBean> packagedlist = packaged.getPackagedList();
            for(int i= 0; i < packagedlist.size(); i++){
                if(pack.getPackaged_name().equals(packagedlist.get(i).getPackaged_name())){
                    isnotUnique = 1;
                    break;
                }
                else isnotUnique = 0;
            }
            
            if(isnotUnique == 1)
                response.sendRedirect("packaged.jsp#failCreate");
            else{
                packaged.addPackaged(pack);
                response.sendRedirect("packaged.jsp#successCreate");
            }
           
           
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
