/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import model.bill;
import model.billDetails;
import model.table;

/**
 *
 * @author doan7
 */
public class BillDBContext extends DBContext {
    public  ArrayList<bill> getAllBll(){
        ArrayList<bill> arrayList = new ArrayList<bill>();
        try{
            PreparedStatement st = connection.prepareStatement("select * from Bill");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                bill b = new bill();
               b.setId(rs.getInt("bid"));
               b.setName(rs.getString("name"));
               b.setDateBill(rs.getDate("datebill"));
               b.setTotalPayment(rs.getFloat("totalpayment"));
               b.setStaffid(rs.getInt("staffid"));
                b.setTableid(rs.getInt("tableid"));
                arrayList.add(b);
            }
        }catch(Exception e){
            
        }
      return arrayList;
    }
     public int getAllBllbyID(int tableID){
      int  checkBillID = 0;
        try{
            PreparedStatement st = connection.prepareStatement("select * from Bill where tableid=? and status = 1");
            st.setInt(1, tableID);
            ResultSet rs = st.executeQuery();
           if(rs.next()){
               checkBillID = rs.getInt("bid");
           }           
            
        }catch(Exception e){
            
        }
      return checkBillID;
    }
    public void addBill(int tableID, int foodID,int staffID,float money,int quantity){
        int billID = getAllBllbyID(tableID);
        if(getAllBllbyID(tableID) == 0){
            addNewBill(tableID, staffID);
            billID = getAllBllbyID(tableID);
        }
         billDetails detail = new billDetails();
        detail.setBillID(billID);
        detail.setPrice(money);
        detail.setFoodID(foodID);
        detail.setQuantity(quantity);
        BillDetailsContext billDetailsContext = new BillDetailsContext();
        billDetailsContext.addbillDetail(detail);
    }
    public void addNewBill(int tableID, int staffId){
       long date_temp = System.currentTimeMillis();
       java.sql.Date date=new java.sql.Date(date_temp);  
           try {
            PreparedStatement st = connection.prepareStatement("insert into Bill values (?,?,?,?,?,?)");
            st.setString(1,"Bill");
            st.setInt(2, tableID);
            st.setDate(3, date);
            st.setFloat(4, 0);
            st.setInt(5, staffId);
            st.setInt(6, 1);
            st.execute();
        } catch (Exception e) {
        }
    }
    

}
