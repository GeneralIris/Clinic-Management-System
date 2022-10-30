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
public class login_empBean implements java.io.Serializable
{
    
    private String username;
    private String password;
   
    
    public login_empBean()
    {
        
    }
    
    public login_empBean(String username, String password)
    {
        
        this.username = username;
        this.password = password;
        
    }
    
   
    
    public String getUsername()
    {
        return username;
    }
     
     public String getPassword()
    {
        return password;
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
