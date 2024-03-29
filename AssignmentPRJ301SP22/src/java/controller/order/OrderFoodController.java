/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.order;

import dal.PaggingDBContext;
import dal.TableDBContext;
import dal.TypeFoodDBConext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.food;
import model.table;

/**
 *
 * @author doan7
 */
public class OrderFoodController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            int tid = Integer.parseInt(request.getParameter("tid"));
            request.setAttribute("tid", tid);
            String raw_type = request.getParameter("typeId");
            if(raw_type == null ) raw_type = "0";
            if(raw_type ==  null || raw_type.equals("0")){
            PaggingDBContext pDB = new PaggingDBContext();
            String raw_page = request.getParameter("page");
            int pageSize = 10;
            
            if(raw_page == null || raw_page.length() == 0){
                raw_page = "1";
                
            }
            
            
            int pageIndex = Integer.parseInt(raw_page);
            int totalRow = pDB.getRowCount();
            int totalPage = (totalRow % pageSize == 0)? totalRow / pageSize : (totalRow / pageSize) + 1;
            List<food> foods = pDB.getFoods(pageSize, pageIndex);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("Foods", foods);
            request.setAttribute("rawType", raw_type);
            TypeFoodDBConext tDB = new TypeFoodDBConext();
            request.setAttribute("TypeFoods", tDB.getTypeFoods());
             TableDBContext tblDB = new TableDBContext();
            List<table> tables = tblDB.getTables();
            request.setAttribute("Tables", tables);
            
            request.getRequestDispatcher("../view/order/orderFood.jsp").forward(request, response);
            } 
            else{
                PaggingDBContext pDB = new PaggingDBContext();
            String raw_page = request.getParameter("page");
            int pageSize = 10;
            
            if(raw_page == null || raw_page.length() == 0){
                raw_page = "1";
                
            }
            
            
            int pageIndex = Integer.parseInt(raw_page);
            int totalRow = pDB.getRowCount(raw_type);
            int totalPage = (totalRow % pageSize == 0)? totalRow / pageSize : (totalRow / pageSize) + 1;
            List<food> foods = pDB.getFoods(pageSize, pageIndex, Integer.parseInt(raw_type));
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("Foods", foods);
            request.setAttribute("rawType", raw_type);
            TypeFoodDBConext tDB = new TypeFoodDBConext();
            request.setAttribute("TypeFoods", tDB.getTypeFoods());
             TableDBContext tblDB = new TableDBContext();
            List<table> tables = tblDB.getTables();
            request.setAttribute("Tables", tables);
            
            request.getRequestDispatcher("../view/order/orderFood.jsp").forward(request, response);
            }
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
