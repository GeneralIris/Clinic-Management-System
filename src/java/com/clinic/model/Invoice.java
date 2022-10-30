package com.clinic.model;


import java.sql.Timestamp;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Fatin Amalin
 */
public class Invoice implements java.io.Serializable{
    private int InvoiceID; 
    private double amount;
    private Timestamp transactionTime;

    public Invoice() {
    }

    public int getInvoiceID() {
        return InvoiceID;
    }

    public double getAmount() {
        return amount;
    }

    public Timestamp getTransactionTime() {
        return transactionTime;
    }

    public void setInvoiceID(int InvoiceID) {
        this.InvoiceID = InvoiceID;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public void setTransactionTime(Timestamp transactionTime) {
        this.transactionTime = transactionTime;
    }
    
    
    
}
