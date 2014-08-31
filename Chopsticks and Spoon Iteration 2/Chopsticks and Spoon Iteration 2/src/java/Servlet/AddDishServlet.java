/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Bean.DishBean;
import Bean.IngredientBean;
import DAOImplementation.DishImplementation;
import DAOImplementation.IngredientImplementation;
import DAOInterface.DishInterface;
import DAOInterface.IngredientInterface;
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
 * @author Drian
 */
@WebServlet(name = "AddDishServlet", urlPatterns = {"/AddDishServlet"})
public class AddDishServlet extends HttpServlet {

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
           DishBean dishBean = new DishBean();
           DishInterface dishDAO = new DishImplementation();
           IngredientInterface ingDAO = new IngredientImplementation();
           IngredientBean ingBean;
           ArrayList<IngredientBean> ingredientList = new ArrayList();
           String dishName = request.getParameter("dishName");
           String dishPrice = request.getParameter("dishPrice");
              String x = request.getParameter("ingredientNumbers");
            String[] ingredientNumbers = x.split(",");
            String a = request.getParameter("totalWeight");
            String[] ingredientWeight = a.split(",");
          String totalDishPrice = request.getParameter("recipeTotal");
          dishBean.setDish_name(dishName);
          dishBean.setDish_cost(Double.parseDouble(dishPrice));
          dishBean.setDish_price(Double.parseDouble(totalDishPrice));
        
          
          for(int i = 0; i < ingredientNumbers.length; i++){
           ingBean = new IngredientBean();
           System.out.println("Ingredient Numbers:" + ingredientNumbers[i]);
           ingBean = ingDAO.getIngredient(Integer.parseInt(ingredientNumbers[i]));
           ingredientList.add(ingBean);
           System.out.println("Ingredient Name:" + ingredientList.get(i).getIngredient_name());
           System.out.println("Ingredient Weight:" + Double.parseDouble(ingredientWeight[i]));
           ingredientList.get(i).setIngredient_weight(Double.parseDouble(ingredientWeight[i])); 
          }
          dishBean.setIngredientList(ingredientList);
          
          if(dishDAO.checkDish(dishName)){
          dishDAO.addDish(dishBean);
          response.sendRedirect("dishes.jsp#successCreate");
          }
          else{
          response.sendRedirect("dishes.jsp#failCreate");
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
