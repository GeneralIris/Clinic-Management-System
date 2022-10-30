package com.clinic.model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Fatin Amalin
 */
public class Employee implements java.io.Serializable{
    private String EmployeeICNo;
    private String EmployeeFirstName;
    private String EmployeeLastName;
    private String EmployeeAddress;
    private String EmployeePhone;
    private int EmployeeTypeID;
    private String Username;
    private String Password;

    public Employee() {
    }

    public Employee(String EmployeeICNo, String EmployeeFirstName, String EmployeeLastName, String EmployeeAddress, String EmployeePhone,int EmployeeTypeID,String Username, String Password) {
        this.EmployeeICNo = EmployeeICNo;
        this.EmployeeFirstName = EmployeeFirstName;
        this.EmployeeLastName = EmployeeLastName;
        this.EmployeeAddress = EmployeeAddress;
        this.EmployeePhone = EmployeePhone;
        this.Username = Username;
        this.Password = Password;
        this.EmployeeTypeID=EmployeeTypeID;
    }
    public int getEmployeeTypeID() {
        return EmployeeTypeID;
    }
    public String getEmployeeICNo() {
        return EmployeeICNo;
    }

    public String getEmployeeFirstName() {
        return EmployeeFirstName;
    }

    public String getEmployeeLastName() {
        return EmployeeLastName;
    }

    public String getEmployeeAddress() {
        return EmployeeAddress;
    }

    public String getEmployeePhone() {
        return EmployeePhone;
    }

    public String getUsername() {
        return Username;
    }

    public String getPassword() {
        return Password;
    }
    
    public void setEmployeeTypeID(int EmployeeTypeID) {
        this.EmployeeTypeID = EmployeeTypeID;
    }
    
    public void setEmployeeICNo(String EmployeeICNo) {
        this.EmployeeICNo = EmployeeICNo;
    }

    public void setEmployeeFirstName(String EmployeeFirstName) {
        this.EmployeeFirstName = EmployeeFirstName;
    }

    public void setEmployeeLastName(String EmployeeLastName) {
        this.EmployeeLastName = EmployeeLastName;
    }

    public void setEmployeeAddress(String EmployeeAddress) {
        this.EmployeeAddress = EmployeeAddress;
    }

    public void setEmployeePhone(String EmployeePhone) {
        this.EmployeePhone = EmployeePhone;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
    
}
