/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clinic.utils;

import java.sql.*;

public class dbConnection {
    
    static Connection conn;
    
    
    public static Connection dbConnection(){
        return dbInitialization();
    }
    
    private static Connection dbInitialization(){
        
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String url = "jdbc:derby://localhost/ClinicManagement";
            String user = "root";
            String pass = "root";
            conn = DriverManager.getConnection(url, user, pass);

        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return conn;
    }
}
