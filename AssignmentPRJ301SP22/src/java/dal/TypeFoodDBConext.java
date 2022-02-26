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
import model.TypeFood;

/**
 *
 * @author doan7
 */
public class TypeFoodDBConext extends DBContext{
    
    public List<TypeFood> getTypeFoods(){
        List<TypeFood> types = new ArrayList<>();
        try {
            String sql = "select * from TypeFood";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                TypeFood tf = new TypeFood();
                tf.setId(rs.getInt("tid"));
                tf.setName(rs.getString("name"));
                types.add(tf);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TypeFoodDBConext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return types;
    }
    
}
