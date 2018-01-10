/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Billing;

import java.sql.Timestamp;

/**
 *
 * @author TGMaster
 */
public class Bill {

    private long id;
    private int Uid;
    private Timestamp date;
    private String payment;
    private String address;
    private double total;

    public Bill() {
    }

    public Bill(long id, int Uid, Timestamp date, String payment, String address,double total) {
        this.id = id;
        this.Uid = Uid;
        this.date = date;
        this.payment = payment;
        this.address= address;
        this.total = total;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getUid() {
        return Uid;
    }

    public void setUid(int Uid) {
        this.Uid = Uid;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

}
