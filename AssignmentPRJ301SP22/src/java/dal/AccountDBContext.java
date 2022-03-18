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
import model.Role;
import model.account;

/**
 *
 * @author doan7
 */
public class AccountDBContext extends DBContext{
    
     public List<account> getAccounts(){
        List<account> accounts = new ArrayList<>();
        try {
            String sql ="select * from Account a join Role r on a.roleId = r.rid";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                 account account = new  account();
                account.setUser(rs.getString("username"));
                account.setPass(rs.getString("password"));
                account.setDisplayName(rs.getString("displayname"));
                Role r = new Role();
                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("name"));
                account.setRole(r);
                accounts.add(account);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }
    
    public account getAccountByUser(String user){
            
        try {
            String sql = "select * from Account where [username] = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                account acc = new account();
                acc.setUser(rs.getString("username"));
                acc.setPass(rs.getString("password"));
                acc.setDisplayName(rs.getString("displayname"));
                
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    } 
    
    public account getAccount(String user, String pass){
        try {
            String sql = "select * from Account a join Role r on a.roleId = r.rid  where [username] = ? and [password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                account acc = new account();
                acc.setUser(rs.getString("username"));
                acc.setPass(rs.getString("password"));
                acc.setDisplayName(rs.getString("displayname"));
                acc.setStaffId(rs.getInt("staffId"));
                Role r = new Role();
                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("name"));
                acc.setRole(r);
                
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
       
    }
    
    public void insert(account acc){
        try {
            String sql = "Insert into Account ([username],[password],[displayname],roleId) values(?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, acc.getUser());
            stm.setString(2, acc.getPass());
            stm.setString(3, acc.getDisplayName());
            stm.setInt(4, acc.getRole().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    public void update(String user,String pass){
        try {
            String sql = "Update [Account] set [password] = ? where [username]= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pass);
            stm.setString(2, user);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  
    
    
    
}
