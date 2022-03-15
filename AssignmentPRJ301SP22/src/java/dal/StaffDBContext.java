/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.account;
import model.staff;

/**
 *
 * @author doan7
 */
public class StaffDBContext extends DBContext{
    public List<staff> getStaffs(int pageIndex,int pageSize){
        List<staff> list = new ArrayList<>();
        try {
            String sql = "select * from\n" +
                "(select ROW_NUMBER() over (order by sid asc) as rownum, sid,name,DOB,gender,phone,salary from Staff ) t\n" +
                "where rownum >= (? - 1)*? +1 and rownum <= ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageIndex);
            stm.setInt(4, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                staff s = new staff();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("name"));
                s.setSalary(Float.parseFloat(rs.getString("salary")));
                s.setDOB(rs.getDate("DOB"));
                s.setGender(rs.getBoolean("gender"));
                s.setPhone(rs.getString("phone"));
               
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public void insert(staff s){
        try {
            String sql = "insert into Staff(name,DOB,phone,salary,gender) values(?,?,?,?,?)";            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, s.getName());
            stm.setDate(2, s.getDOB());
            stm.setString(3, s.getPhone());
            stm.setFloat(4, s.getSalary());
            stm.setBoolean(5, s.isGender());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public staff getStaff(int id){
        
        try {
            String sql = "select * from Staff where sid = ? ";
      
            PreparedStatement stm = connection.prepareStatement(sql);         
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {                
                staff s = new staff();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("name"));
                s.setSalary(Float.parseFloat(rs.getString("salary")));
                s.setDOB(rs.getDate("DOB"));
                s.setGender(rs.getBoolean("gender"));
                s.setPhone(rs.getString("phone"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public void update(staff s){
        try {
            String sql = "UPDATE [Staff]\n" +
                            "   SET [name] = ?\n" +
                            "      ,[salary] = ?\n" +
                            "      ,[DOB] = ?\n" +
                            "      ,[gender] = ?\n" +
                            "      ,[phone] = ?\n" +
                            " WHERE sid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(6, s.getId());
            stm.setString(1, s.getName());
            stm.setFloat(2, s.getSalary());
            stm.setDate(3, s.getDOB());
            stm.setBoolean(4, s.isGender());
            stm.setString(5, s.getPhone());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
     
     public void delete(int id){
        try {
            String sql = "Delete from Staff where sid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
    
    public int getRowCount(){
        try {
            String sql="Select count(*) as total from Staff ";
            PreparedStatement stm = connection.prepareStatement(sql);           
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaggingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
