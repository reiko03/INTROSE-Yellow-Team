/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Bean.DishBean;
import Bean.PackagedBean;
import Bean.UsersBean;
import DAOImplementation.DishImplementation;
import DAOImplementation.PackagedImplementation;
import DAOImplementation.UserImplementation;
import DAOInterface.DishInterface;
import DAOInterface.PackagedInterface;
import DAOInterface.UsersInterface;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JasonTan
 */
@WebServlet(name = "SubmitReceiptServlet", urlPatterns = {"/SubmitReceiptServlet"})
public class SubmitReceiptServlet extends HttpServlet {

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
            DishInterface dishDAO = new DishImplementation();
            DishBean dbean = new DishBean();
            PackagedInterface packDAO = new PackagedImplementation();
            PackagedBean pbean = new PackagedBean();
            String receiptTotals = request.getParameter("receiptTotals");
            String payment = request.getParameter("payment");
            String receiptChange = request.getParameter("receiptChange");
            String x = request.getParameter("packagedArray");
            String a = request.getParameter("dishArray");
            String[] packagedArray = x.split(",");
            String[] dishArray = a.split(",");
            UsersBean userAccount = new UsersBean();
            UsersInterface userDAO = new UserImplementation();
            String username = request.getParameter("username");
            
            boolean pass = false;
             if(!dishArray[0].isEmpty()){
            for(int i = 0; i < dishArray.length;i++){
             dbean = dishDAO.getDish(Integer.parseInt(dishArray[i]));
             System.out.println("Name:"+dbean.getDish_name());
             System.out.println("cost:"+dbean.getDish_cost());
             System.out.println("price:"+dbean.getDish_price());
             System.out.println("id:"+dbean.getDish_id());
            
             if(dishDAO.sellDish(dbean, userDAO.getUser(username)))
               pass=true;
            }
             }
            if(!packagedArray[0].isEmpty()){
            for(int i = 0; i < packagedArray.length;i++){
               pbean = packDAO.getPackaged(Integer.parseInt(packagedArray[i]));
               
               if(packDAO.sellPackaged(pbean, userDAO.getUser(username)))
                   pass=true;
                
            }
            }
            if(pass)
                 response.sendRedirect("pos.jsp#successCreate");
            else
                response.sendRedirect("pos.jsp#failCreate");
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
