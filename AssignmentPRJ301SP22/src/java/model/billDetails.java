/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author doan7
 */
public class billDetails {
  private int bilDetaiID;
   private float price;
   private int quantity;
   private int billID;
   private int foodID;

    public billDetails(int bilDetaiID, float price, int quantity, int billID, int foodID) {
        this.bilDetaiID = bilDetaiID;
        this.price = price;
        this.quantity = quantity;
        this.billID = billID;
        this.foodID = foodID;
    }

    public int getBilDetaiID() {
        return bilDetaiID;
    }

    public void setBilDetaiID(int bilDetaiID) {
        this.bilDetaiID = bilDetaiID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public billDetails() {
    }
   
}
