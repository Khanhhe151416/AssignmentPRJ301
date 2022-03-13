/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.bill;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author doan7
 */
public class BillController extends HttpServlet {

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
//    @Override
//   protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("utf-8");
//        Cookie arr[] = request.getCookies();
//        PrintWriter out = response.getWriter();
//        List<Product> listProduct = new ArrayList<>();
//        ProductDAO dao = new ProductDAO();
//        for (Cookie o : arr) {
//            if (o.getName().equals("id")) {
//         
//                    String txt[] = o.getValue().split(",");
//                    for (String s : txt) {
//                        if(!s.isEmpty())
//                        listProduct.add(dao.getProductByIDProductToDetail(Integer.parseInt(s)));//
//                    }
//                
//            }
//        }
//        request.setAttribute("listF", listProduct); 
//        request.getRequestDispatcher("favour.jsp").forward(request, response);
//    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.setCharacterEncoding("UTF8");
//        String id = request.getParameter("pid"); // pid
//        Cookie arr[] = request.getCookies(); // lấy cookies cũ
//        String txt = ""; // tạo string để lưu cookies cũ
//        for (Cookie o : arr) { 
//            if (o.getName().equals("id")) {
//                txt = txt + o.getValue(); // dán vào string mới
//                o.setMaxAge(0); // xoá cookies cũ đi
//                response.addCookie(o);
//            }
//        }
//
//        int check = 0; // kiểm tra id sản phẩm đã tồn tại chưa
//        if (txt.isEmpty()) { //nếu string mới rỗng thì chỉ thêm vào 
//            txt = id;
//        } else {
//            String[] txt1 = txt.split(",");
//            for (String s : txt1) { 
//                if (s.equals(id)) { 
//                    check++;//
//                }
//            }
//            if (check == 0) {
//                txt = txt + "," + id;
//            }
//        }
//        Cookie c = new Cookie("id", txt);
//        c.setMaxAge(60 * 60 * 24);
//        response.addCookie(c);
//    }

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
