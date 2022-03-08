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
    
    public food getfood(int id){
        try {
            String sql ="select f.fid,f.name as fname,f.price,f.image,tf.tid,tf.name from Food f join TypeFood tf on f.typeId = tf.tid where fid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                food f = new food();
                f.setId(id);
                f.setName(rs.getString("fname"));
                f.setPrice(rs.getFloat("price"));
                f.setImage(rs.getString("image"));
                TypeFood tf = new TypeFood();
                tf.setId(rs.getInt("tid"));
                tf.setName(rs.getString("name"));
                f.setType(tf);
                return f;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
        
    }
    
    public void insert(food f){
        try {
            String sql = "Insert into Food(name,price,image,typeId) values(?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, f.getName());
            stm.setFloat(2, f.getPrice());
            stm.setString(3, f.getImage());
            stm.setInt(4, f.getType().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void update( food f){
        try {
            String sql =" Update [Food] SET name = ?, price = ?, image = ?, typeId = ? where fid = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, f.getName());
            stm.setFloat(2, f.getPrice());
            stm.setString(3,f.getImage());
            stm.setInt(4, f.getType().getId());
            stm.setInt(5, f.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void delete(int id){
        try {
            String sql = "Delete from Food where fid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
