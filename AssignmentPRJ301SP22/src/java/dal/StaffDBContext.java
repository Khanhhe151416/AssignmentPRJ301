/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.staff;

/**
 *
 * @author doan7
 */
public class StaffDBContext extends DBContext{
    
    public void insert(staff s){
        try {
            String sql = "";
            
            PreparedStatement stm = connection.prepareStatement(sql);
        } catch (SQLException ex) {
            Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
