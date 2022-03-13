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
public class PaggingDBContext extends DBContext{
    
    public List<food> getFoods(int PageSize, int PageIndex){
        List<food> foods = new ArrayList<>();
        try {
            String sql = "SELECT fid,fname,price,[image],tid,name FROM \n" +
                "(SELECT ROW_NUMBER() OVER (ORDER BY fid asc) as rownum, fid,f.name as fname,price,[image],tid,tf.name\n" +
                "FROM Food f join TypeFood tf on f.typeId = tf.tid ) t\n" +
                "WHERE \n" +
                "rownum >= (? - 1)*? + 1 AND rownum <= ? * ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, PageIndex);
            stm.setInt(2, PageSize);
            stm.setInt(3, PageIndex);
            stm.setInt(4, PageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                food f = new food();
                f.setId(rs.getInt("fid"));
                f.setName(rs.getString("fname"));
                f.setPrice(rs.getFloat("price"));
                f.setImage(rs.getString("image"));
                TypeFood tf = new TypeFood();
                tf.setId(rs.getInt("tid"));
                tf.setName(rs.getString("name"));
                f.setType(tf);
                foods.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaggingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return foods;
    }
    
       public List<food> getFoods(int PageSize, int PageIndex, int type){
        List<food> foods = new ArrayList<>();
        try {
            String sql = "SELECT fid,fname,price,[image],tid,name FROM \n" +
                "(SELECT ROW_NUMBER() OVER (ORDER BY fid asc) as rownum, fid,f.name as fname,price,[image],tid,tf.name\n" +
                "FROM Food f join TypeFood tf on f.typeId = tf.tid where tid = ? ) t\n" +
                "WHERE \n" +
                "rownum >= (? - 1)*? + 1 AND rownum <= ? * ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, type);
            stm.setInt(2, PageIndex);
            stm.setInt(3, PageSize);
            stm.setInt(4, PageIndex);
            stm.setInt(5, PageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                food f = new food();
                f.setId(rs.getInt("fid"));
                f.setName(rs.getString("fname"));
                f.setPrice(rs.getFloat("price"));
                f.setImage(rs.getString("image"));
                TypeFood tf = new TypeFood();
                tf.setId(rs.getInt("tid"));
                tf.setName(rs.getString("name"));
                f.setType(tf);
                foods.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaggingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return foods;
    }
    public int getRowCount(String type){
        try {
            String sql="Select count(*) as total from Food where typeId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, type);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaggingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
     public int getRowCount(){
        try {
            String sql="Select count(*) as total from Food ";
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
