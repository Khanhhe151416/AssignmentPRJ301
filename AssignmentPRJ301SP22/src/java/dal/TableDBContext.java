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
import model.table;

/**
 *
 * @author doan7
 */
public class TableDBContext extends DBContext{
     public List<table> getTables(){
        List<table> tables = new ArrayList<>();
        try {
            String sql ="select * from TBL ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                table table = new table();
                table.setId(rs.getInt("tblid"));
                table.setName(rs.getString("name"));
                table.setStatus(rs.getBoolean("status"));
                
                tables.add(table);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tables;
    }
    public void insert(table table){
        try {
            String sql = "insert into TBL(name,status) values(?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, table.getName());
            stm.setBoolean(2, table.isStatus());
            
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TableDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void update(table table){
        try {
            String sql="UPDATE [TBL]\n" +
                        "   SET [name] = ?\n" +
                        "      ,[status] = ?\n" +                        
                        " WHERE tblid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, table.getName());
            stm.setBoolean(2, table.isStatus());           
            stm.setInt(3, table.getId());
            stm.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(TableDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public table getTableWithName(String name){
      
        try {
            String sql ="select * from TBL where name like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {                
                table table = new table();
                table.setId(rs.getInt("tblid"));
                table.setName(rs.getString("name"));
                table.setStatus(rs.getBoolean("status"));
                
                return table;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public table getTable(int id){
      
        try {
            String sql ="select tblid, [name], [status] from TBL where tblid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {                
                table table = new table();
                table.setId(rs.getInt("tblid"));
                table.setName(rs.getString("name"));
                table.setStatus(rs.getBoolean("status"));
                              
                return table;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public void delete(int id){
        try {
            String sql = "Delete from TBL where tblid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(TableDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
}
