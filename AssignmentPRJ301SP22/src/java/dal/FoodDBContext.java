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
import model.food;

/**
 *
 * @author doan7
 */
public class FoodDBContext extends DBContext{
    
    public List<food> getFoods(){
        List<food> foods = new ArrayList<>();
        try {
            String sql ="select fid,f.name,price,image,tid\n" +
                        "from Food f join TypeFood t on f.typeId = t.tid;  ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                food f = new food();
                
                f.setId(rs.getInt("fid"));
                f.setName(rs.getString("name"));
                f.setPrice(rs.getFloat("price"));
                f.setImage(rs.getString("image"));
                TypeFood tf = new TypeFood();
                tf.setId(rs.getInt("tid"));
                f.setType(tf);
                foods.add(f);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(FoodDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return foods;
    }
}
