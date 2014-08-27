/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Bean.IngredientBean;
import Bean.UsersBean;
import DAOImplementation.IngredientImplementation;
import DAOImplementation.UserImplementation;
import DAOInterface.IngredientInterface;
import DAOInterface.UsersInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author JasonTan
 */
@WebServlet(name = "GenerateDishIngredient", urlPatterns = {"/GenerateDishIngredient"})
public class GenerateDishIngredient extends HttpServlet {

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
            JSONObject obj = new JSONObject();
                      String ingredientID = request.getParameter("ingredientID");
                   IngredientInterface ingredientDAO = new IngredientImplementation();
            IngredientBean ingredientBean = ingredientDAO.getIngredient(Integer.parseInt(ingredientID));
             try {
                  obj.put("IngName", ingredientBean.getIngredient_name());
                     obj.put("IngID", ingredientBean.getIngredient_id()); 
					    obj.put("IngCost", ingredientBean.getIngredient_cost());
						   obj.put("IngWeight", ingredientBean.getIngredient_weight());
            
          
              } catch (JSONException ex) {
                  Logger.getLogger(GenerateDishIngredient.class.getName()).log(Level.SEVERE, null, ex);
              }
               
            out.print(obj);
            out.flush();
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
