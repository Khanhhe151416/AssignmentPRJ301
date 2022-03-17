/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.billDetails;

/**
 *
 * @author doan7
 */
public class BillDetailsContext extends DBContext {

    public ArrayList<billDetails> getAllBll(int billID) {
        ArrayList<billDetails> arrayList = new ArrayList<billDetails>();
        try {
            PreparedStatement st = connection.prepareStatement("select * from billDetails where billID = '"+billID+"' ");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                billDetails detail = new billDetails();
                detail.setBillID(rs.getInt(1));
                detail.setPrice(rs.getFloat(2));
                detail.setFoodID(rs.getInt(5));
                detail.setBillID(rs.getInt(4));
                detail.setQuantity(rs.getInt(3));
                arrayList.add(detail);
            }
        } catch (Exception e) {
            System.out.println("loi get bilk details : " + e);
        }
        return arrayList;
    }

    public int checkdoublebillDetails(int billID, int foodid) {
        int quantity = 0;
        try {
            PreparedStatement st = connection.prepareStatement("select * from billDetails where billID = ? && foodID =? ");
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (Exception e) {
            System.out.println("loi get bil details : " + e);
        }
        return quantity;
    }

    public void updatebillDetail(int billID, int foodID, int quantity) {
        try {
            PreparedStatement st = connection.prepareStatement("update billDetails set quantity = ? where billID = ? and foodID =?");
            st.setInt(1, quantity);
            st.setInt(2, billID);
            st.setInt(3, foodID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("loi update bill details : " + e);
        }
    }

    public void addbillDetail(billDetails detail) {
        int quantity = 0;
        quantity = checkdoublebillDetails(detail.getBillID(), detail.getFoodID());
        if(quantity > 0){
            updatebillDetail(detail.getBilDetaiID(), detail.getFoodID(), quantity+1);
        }else{
              try {
            PreparedStatement st = connection.prepareStatement("insert into billDetails values (?,?,?,?)");
            st.setFloat(1, detail.getPrice());
            st.setInt(2, detail.getQuantity());
            st.setInt(3, detail.getBillID());
            st.setInt(4, detail.getFoodID());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("loi add bill details : " + e);
        }
        }
      
    }
}
