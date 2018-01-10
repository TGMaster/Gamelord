/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Billing;

/**
 *
 * @author TGMaster
 */
public class BillDetail {

    private int ID;
    private long Bid;
    private int Pid;
    private double price;
    private int quantity;

    public BillDetail() {
    }

    public BillDetail(int ID, long Bid, int Pid, double price, int quantity) {
        this.ID = ID;
        this.Bid = Bid;
        this.Pid = Pid;
        this.price = price;
        this.quantity = quantity;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public long getBid() {
        return Bid;
    }

    public void setBid(long Bid) {
        this.Bid = Bid;
    }

    public int getPid() {
        return Pid;
    }

    public void setPid(int Pid) {
        this.Pid = Pid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    
}
