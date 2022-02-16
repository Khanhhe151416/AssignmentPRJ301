/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.auth;

import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.account;

/**
 *
 * @author doan7
 */
public class InsertController extends HttpServlet {

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
        request.getRequestDispatcher("../view/auth/signUp.jsp").forward(request, response);
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
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        
        AccountDBContext aDB = new AccountDBContext();
        account acc = aDB.getAccountByUser(user);
        String err;
          if(user.isEmpty() || pass.isEmpty()){
             err = "Username, Password and Repeat Password is not empty ! ";
            request.setAttribute("err", err);
            request.getRequestDispatcher("../view/auth/signUp.jsp").forward(request, response);
        }
          else if(!pass.equals(repass) || acc != null ){
              err = "Username is exist or repassword is wrong ! ";
            request.setAttribute("err", err);
            request.getRequestDispatcher("../view/auth/signUp.jsp").forward(request, response);
        }      
        else{
            account newAcc = new account();
            newAcc.setUser(user);
            newAcc.setPass(pass);
            newAcc.setDisplayName(user);
            aDB.insert(newAcc);
            String success ="Register successfull!";
            request.setAttribute("success", success);
            request.getRequestDispatcher("../view/auth/signUp.jsp").forward(request, response);
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
