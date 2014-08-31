/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import DAOImplementation.IngredientImplementation;
import DAOInterface.IngredientInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Keiko Nagano
 */
@WebServlet(name = "RestockIngredientServlet", urlPatterns = {"/RestockIngredientServlet"})
public class RestockIngredientServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date d = new Date();
           
            String date = df.format(d);
            
            IngredientInterface in = new IngredientImplementation();
            
            int userid = (Integer)session.getAttribute("userID");
            int ingredientid = Integer.parseInt(request.getParameter("restockingredientID"));
            double weight = Double.parseDouble(request.getParameter("restockWeight"));
            double cost = Double.parseDouble(request.getParameter("restockCost"));
            String source = request.getParameter("restockSource");
            
            
            in.restockIngredient(ingredientid, weight, cost);
            in.addIngredientRestockLog(userid, ingredientid, weight, cost, date, source);
            in.checkSupply(ingredientid);
            
            response.sendRedirect("ingredients.jsp#successRestock");
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
