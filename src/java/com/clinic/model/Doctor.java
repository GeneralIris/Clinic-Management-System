/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clinic.model;

/**
 *
 * @author Farah
 */
public class Doctor {
    private String EmpICNo; 
    private String EmpFName;
    private String EmpLName;
    private String EmpAddress;
    private String StartDate;
    private String EmpPhone;
    private String Username;
    private String Password;
    
    public Doctor(String EmpICNo, String EmpFName, String EmpLName, String EmpAddress, String StartDate, String EmpPhone, String Username, String Password)
    {
        this.EmpICNo=EmpICNo;
        this.EmpFName=EmpFName;
        this.EmpLName=EmpLName;
        this.EmpAddress=EmpAddress;
        this.StartDate=StartDate;
        this.EmpPhone=EmpPhone;
        this.Username=Username;
        this.Password=Password;
    }

    /**
     * @return the EmpICNo
     */
    public String getEmpICNo() {
        return EmpICNo;
    }

    /**
     * @param EmpICNo the EmpICNo to set
     */
    public void setEmpICNo(String EmpICNo) {
        this.EmpICNo = EmpICNo;
    }

    /**
     * @return the EmpFName
     */
    public String getEmpFName() {
        return EmpFName;
    }

    /**
     * @param EmpFName the EmpFName to set
     */
    public void setEmpFName(String EmpFName) {
        this.EmpFName = EmpFName;
    }

    /**
     * @return the EmpLName
     */
    public String getEmpLName() {
        return EmpLName;
    }

    /**
     * @param EmpLName the EmpLName to set
     */
    public void setEmpLName(String EmpLName) {
        this.EmpLName = EmpLName;
    }

    /**
     * @return the EmpAddress
     */
    public String getEmpAddress() {
        return EmpAddress;
    }

    /**
     * @param EmpAddress the EmpAddress to set
     */
    public void setEmpAddress(String EmpAddress) {
        this.EmpAddress = EmpAddress;
    }

    /**
     * @return the StartDate
     */
    public String getStartDate() {
        return StartDate;
    }

    /**
     * @param StartDate the StartDate to set
     */
    public void setStartDate(String StartDate) {
        this.StartDate = StartDate;
    }

    /**
     * @return the EmpPhone
     */
    public String getEmpPhone() {
        return EmpPhone;
    }

    /**
     * @param EmpPhone the EmpPhone to set
     */
    public void setEmpPhone(String EmpPhone) {
        this.EmpPhone = EmpPhone;
    }

    /**
     * @return the EmpTypeID
     */


    /**
     * @param EmpTypeID the EmpTypeID to set
     */

    /**
     * @return the Username
     */
    public String getUsername() {
        return Username;
    }

    /**
     * @param Username the Username to set
     */
    public void setUsername(String Username) {
        this.Username = Username;
    }

    /**
     * @return the Password
     */
    public String getPassword() {
        return Password;
    }

    /**
     * @param Password the Password to set
     */
    public void setPassword(String Password) {
        this.Password = Password;
    }
  
    
}
