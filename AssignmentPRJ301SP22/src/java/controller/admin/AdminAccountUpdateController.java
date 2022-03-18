/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.account;

/**
 *
 * @author doan7
 */
public class AdminAccountUpdateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    

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
        String user = request.getParameter("username");
        AccountDBContext aDB = new AccountDBContext();
        account account = aDB.getAccountByUser(user);
        request.setAttribute("Account", account);
       request.getRequestDispatcher("../../view/admin/adminAccountUpdate.jsp").forward(request, response);
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
        String user = request.getParameter("user");
        String OldPass = request.getParameter("OldPass");
        String NewPass = request.getParameter("NewPass");
        String RePass = request.getParameter("RePass");
        AccountDBContext aDB = new AccountDBContext();
        account acc = aDB.getAccountByUser(user);
        String err;
        if(user.isEmpty() || OldPass.isEmpty() || NewPass.isEmpty() || RePass.isEmpty()){
            err = "Infomation is not empty !";
            request.setAttribute("err", err);
            request.getRequestDispatcher("../../view/admin/adminAccountUpdate.jsp").forward(request, response);
        }
        else if(acc==null){
              err = "User is not exist!";   
            request.setAttribute("err", err);
            request.getRequestDispatcher("../../view/admin/adminAccountUpdate.jsp").forward(request, response);
        }
        
        else if(!acc.getPass().equals(OldPass)|| !NewPass.equals(RePass)){
              err = "Old Password or RePassword is wrong !";   
            request.setAttribute("err", err);
            request.getRequestDispatcher("../../view/admin/adminAccountUpdate.jsp").forward(request, response);
        }
        else{
            aDB.update(user, RePass);
            String success = "Change Password Successful !";
            request.setAttribute("success", success);
            request.getRequestDispatcher("../../view/admin/adminAccountUpdate.jsp").forward(request, response);
        }
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
