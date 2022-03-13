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
                "(select ROW_NUMBER() over (order by sid asc) as rownum, sid,name,salary, username,password,displayname from Staff s join Account a on s.account = a.username) t\n" +
                "where rownum >= (@PageIndex - 1)*@PageSize +1 and rownum <= @PageIndex*@PageSize";
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
                account acc = new account();
                acc.setUser(rs.getString("username"));
                acc.setPass(rs.getString("password"));
                acc.setDisplayName(rs.getString("displayname"));
                s.setAccount(acc);
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public void insert(staff s){
        try {
            String sql = "";
            
            PreparedStatement stm = connection.prepareStatement(sql);
        } catch (SQLException ex) {
            Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
