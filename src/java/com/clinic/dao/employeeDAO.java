/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clinic.dao;

import com.clinic.model.Employee;
import com.clinic.model.login_empBean;
import com.clinic.model.register_empBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.clinic.utils.dbConnection;
import java.sql.Statement;
import java.sql.Timestamp;

/**
 *
 * @author Farah
 */
public class employeeDAO {
    
    private static Employee emp = null;
    
    public Employee loginProcess(login_empBean login_empBean)
    {
      
       String username = login_empBean.getUsername();
       String password = login_empBean.getPassword();       
       Connection con = null;
       Statement statement = null;
       PreparedStatement preparedStatement = null;
       try
       {
           con = dbConnection.dbConnection();
           String query= "select EMPLOYEEICNO,USERNAME,EMPLOYEETYPEID from employee where username = ? and password = ?";
           
           preparedStatement = con.prepareStatement(query);
           preparedStatement.setString(1, username);
           preparedStatement.setString(2, password);
           
           ResultSet resultSet = preparedStatement.executeQuery();
          
               
            while( resultSet.next()){
                emp = new Employee();
                emp.setEmployeeICNo(resultSet.getString(1));
                //emp.setEmployeeFirstName(resultSet.getString("EmployeeFirstName"));
                //emp.setEmployeeLastName(resultSet.getString("EmployeeLastName"));
                //emp.setEmployeeAddress(resultSet.getString("EmployeeAddress"));
                //emp.setEmployeePhone(resultSet.getString("EmployeePhone"));
                emp.setUsername(resultSet.getString(2));
                emp.setEmployeeTypeID(resultSet.getInt(3));
                
                    return emp;
            }
        
       
           
        }catch(SQLException e){
          e.printStackTrace();
          }
        return emp;
        
    }
    
    public String registerProcess(register_empBean register_empBean){
       
       String employeeICNo = register_empBean.getEmployeeICNo();
       String employeeFirstName = register_empBean.getEmployeeFirstName();  
       String employeeLastName = register_empBean.getEmployeeLastName();
       String employeeAddress = register_empBean.getEmployeeAddress(); 
       String employeePhone = register_empBean.getEmployeePhone();
       String username = register_empBean.getUsername();
       String password = register_empBean.getPassword();       
       Connection con = null;
       Statement statement = null;
       PreparedStatement preparedStatement = null;
        
        try{
            con = dbConnection.dbConnection();
            String query = "INSERT INTO EMPLOYEE (employeeICNo, employeeFirstName, employeeLastName, employeeAddress, employeePhone, employeestartdate, username, password,EMPLOYEETYPEID) " +
                         "VALUES (?,?,?,?,?,?,?,?,?)";
            
            preparedStatement = con.prepareStatement(query);
            
            
            
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            
            preparedStatement.setString(1, employeeICNo);
            preparedStatement.setString(2, employeeFirstName);
            preparedStatement.setString(3, employeeLastName);
            preparedStatement.setString(4, employeeAddress);
            preparedStatement.setString(5, employeePhone);
            preparedStatement.setTimestamp(6, timestamp);
            preparedStatement.setString(7, username);
            preparedStatement.setString(8, password);      
            preparedStatement.setInt(9, 1);
            int i = preparedStatement.executeUpdate();
            
            
            if(i==1){
                return "Registration Successful!";
            }
        } 
        catch (Exception ex){
            ex.printStackTrace();
        }
        return "Registration failed.";
         
     }
}
       
    

