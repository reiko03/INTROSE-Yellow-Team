/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Bean.IngredientBean;
import DAOImplementation.IngredientImplementation;
import DAOInterface.IngredientInterface;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Keiko Nagano
 */
@WebServlet(name = "AddIngredientServlet", urlPatterns = {"/AddIngredientServlet"})
public class AddIngredientServlet extends HttpServlet {

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
           String tempweight;
           double weight;
           String tempcost;
           double cost;
           String tempthreshold;
           int threshold;
            
           IngredientInterface ingredient = new IngredientImplementation();
           IngredientBean in = new IngredientBean();
           
           in.setIngredient_name(request.getParameter("ingredientName"));
           
           tempweight = request.getParameter("ingredientWeight");
           weight = Double.parseDouble(tempweight);
           in.setIngredient_weight(weight);
           
           tempcost = request.getParameter("ingredientCost");
           cost = Double.parseDouble(tempcost);
           in.setIngredient_cost(cost);
           
           tempthreshold = request.getParameter("ingredientThreshold");
           threshold = Integer.parseInt(tempthreshold);
           in.setIngredient_threshold(threshold);
          
            ingredient.addIngredient(in);
           
          //HttpSession session = request.getSession();
                // session.setAttribute("sh",sh);
                 response.sendRedirect("ingredients.jsp");
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
