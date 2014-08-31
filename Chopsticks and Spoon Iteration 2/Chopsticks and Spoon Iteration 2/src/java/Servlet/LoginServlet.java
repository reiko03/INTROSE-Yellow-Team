/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Bean.IngredientBean;
import Bean.PackagedBean;
import Bean.UsersBean;
import DAOImplementation.IngredientImplementation;
import DAOImplementation.PackagedImplementation;
import DAOImplementation.UserImplementation;
import DAOInterface.IngredientInterface;
import DAOInterface.PackagedInterface;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
            PackagedInterface packInterface = new PackagedImplementation();
           UsersInterface account = new UserImplementation();
           HttpSession session = request.getSession();
           UsersBean user = new UsersBean();
          
           if(account.userLogin(request.getParameter("username"), request.getParameter("password")))
           {
            ArrayList<IngredientBean> ib =  ingInterface.getIngredientList();
            session.setAttribute("ingredientlist", ib);
            ArrayList<PackagedBean> pb =  packInterface.getPackagedList();
            session.setAttribute("packagedlist", pb);
            user = account.getUser(request.getParameter("username"));
            session.setAttribute("userAccount", user);
            session.setAttribute("userID", user.getUser_id());
            session.setAttribute("userName", user.getUser_name());
               response.sendRedirect("dishes.jsp");
           } 
           else{
               out.println("<script>alert('Login fail.')</script>");
               out.println("<script>window.location='index.jsp'</script>");
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
