/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Bean.IngredientBean;
import Bean.IngredientRestockLogBean;
import Bean.PackagedBean;
import Bean.PackagedRestockLogBean;
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
@WebServlet(name = "GetPackagedRestockLogListServlet", urlPatterns = {"/GetPackagedRestockLogListServlet"})
public class GetPackagedRestockLogListServlet extends HttpServlet {

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
            PackagedInterface packInterface = new PackagedImplementation();
            UsersInterface userInterface = new UserImplementation();            
            HttpSession session = request.getSession();
            
            ArrayList<PackagedRestockLogBean> packagedrestockloglist =  packInterface.getPackagedRestockLogList();
            ArrayList<PackagedBean> packlist = packInterface.getPackagedList();
            ArrayList<UsersBean> userlist = userInterface.getUsersList();
            
            for(int i = 0; i < packagedrestockloglist.size(); i++){
                int temppackagedid;
                temppackagedid = packagedrestockloglist.get(i).getP_restock_packagedid();
                
                for(int j = 0; j < packlist.size(); j++){
                    if(temppackagedid == packlist.get(j).getPackaged_id())
                    packagedrestockloglist.get(i).setPackagedname(packlist.get(j).getPackaged_name());
                }
            }
            
            for(int m = 0; m < packagedrestockloglist.size(); m++){
                int tempuserid;
                tempuserid = packagedrestockloglist.get(m).getP_restock_userid();
                
                for(int n = 0; n < userlist.size(); n++){
                    if(tempuserid == userlist.get(n).getUser_id())
                    packagedrestockloglist.get(m).setUsername(userlist.get(n).getUser_name());
                }
            }
            
           
            session.setAttribute("packagedRestockLogList", packagedrestockloglist);
            response.sendRedirect("logPackagedRestock.jsp");
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
