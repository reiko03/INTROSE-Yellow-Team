/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Bean.IngredientBean;
import Bean.SpoilLogBean;
import Bean.UsersBean;
import DAOImplementation.IngredientImplementation;
import DAOImplementation.UserImplementation;
import DAOInterface.IngredientInterface;
import DAOInterface.UsersInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "GetIngredientSpoilLogListServlet", urlPatterns = {"/GetIngredientSpoilLogListServlet"})
public class GetIngredientSpoilLogListServlet extends HttpServlet {

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
            IngredientInterface ingInterface = new IngredientImplementation();
            UsersInterface userInterface = new UserImplementation();            
            HttpSession session = request.getSession();
            
            ArrayList<SpoilLogBean> spoilloglist =  ingInterface.getSpoilLogList();
            ArrayList<IngredientBean> inglist = ingInterface.getIngredientList();
            ArrayList<UsersBean> userlist = userInterface.getUsersList();
            
            for(int i = 0; i < spoilloglist.size(); i++){
                int tempingredientid;
                tempingredientid = spoilloglist.get(i).getSpoil_ingredientid();
                
                for(int j = 0; j < inglist.size(); j++){
                    if(tempingredientid == inglist.get(j).getIngredient_id())
                    spoilloglist.get(i).setIngredientname(inglist.get(j).getIngredient_name());
                }
            }
            
            for(int m = 0; m < spoilloglist.size(); m++){
                int tempuserid;
                tempuserid = spoilloglist.get(m).getSpoil_userid();
                
                for(int n = 0; n < userlist.size(); n++){
                    if(tempuserid == userlist.get(n).getUser_id())
                    spoilloglist.get(m).setUsername(userlist.get(n).getUser_name());
                }
            }
            
           
            session.setAttribute("spoilLogList", spoilloglist);
            response.sendRedirect("logIngredientSpoil.jsp");
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
