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
public class register_empBean implements java.io.Serializable
{
    private String employeeICNo;
    private String employeeFirstName;
    private String employeeLastName;
    private String employeeAddress;
    
    private String employeePhone;
    private String username;
    private String password;
    
    
    public register_empBean()
    {
        
    }
    
    public register_empBean(String employeeICNo, String employeeFirstName, String employeeLastName, String employeeAddress, String employeePhone, String username, String password)
    {
        this.employeeICNo = employeeICNo;
        this.employeeFirstName = employeeFirstName;
        this.employeeLastName = employeeLastName;
        this.employeeAddress = employeeAddress;
        
        this.employeePhone = employeePhone;
        this.username = username;
        this.password = password;
        
    }

    
    
    public String getEmployeeICNo()
    {
        return employeeICNo;
    }
    
    public String getEmployeeFirstName()
    {
        return employeeFirstName;
    }
    
    public String getEmployeeLastName()
    {
        return employeeLastName;
    }
    
    public String getEmployeeAddress()
    {
        return employeeAddress;
    }
    
   
    
    public String getEmployeePhone()
    {
        return employeePhone;
    }
    
    public String getUsername()
    {
        return username;
    }
     
     public String getPassword()
    {
        return password;
    }
      
   
    
    
    public void setEmployeeICNo(String employeeICNo)
    {
        this.employeeICNo = employeeICNo;
    }
    
    public void setEmployeeFirstName(String employeeFirstName)
    {
        this.employeeFirstName = employeeFirstName;
    }
    
    public void setEmployeeLastName(String employeeLastName)
    {
        this.employeeLastName = employeeLastName;
    }
    
    public void setEmployeeAddress(String employeeAddress)
    {
        this.employeeAddress = employeeAddress;
    }
    
   
    
    public void setEmployeePhone(String employeePhone)
    {
        this.employeePhone = employeePhone;
    }
    
    public void setUsername(String username)
    {
        this.username = username;
    }
    
    public void setPassword(String password)
    {
        this.password = password;
    }
    
   
}
