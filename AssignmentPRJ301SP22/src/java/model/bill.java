/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author doan7
 */
public class bill {
    private int id;
    private String name;
    private Date dateBill;
    private float totalPayment;
    private table table;
    private staff staff;
    
    private List<FoodBill> foodBill = new ArrayList<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDateBill() {
        return dateBill;
    }

    public void setDateBill(Date dateBill) {
        this.dateBill = dateBill;
    }

    public float getTotalPayment() {
        return totalPayment;
    }

    public void setTotalPayment(float totalPayment) {
        this.totalPayment = totalPayment;
    }

    public table getTable() {
        return table;
    }

    public void setTable(table table) {
        this.table = table;
    }

    public staff getStaff() {
        return staff;
    }

    public void setStaff(staff staff) {
        this.staff = staff;
    }

    public List<FoodBill> getFoodBill() {
        return foodBill;
    }

    public void setFoodBill(List<FoodBill> foodBill) {
        this.foodBill = foodBill;
    }
    
    
    
}
