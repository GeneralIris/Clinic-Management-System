/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clinic.controller;



import com.google.gson.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddPatientCheckIC extends HttpServlet {

    static PrintWriter out;
    static Connection conn;
    static PreparedStatement statement;
    static ResultSet rs;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            response.setContentType("text/html;charset=UTF-8");
        
            JsonObject data = new Gson().fromJson(request.getReader(), JsonObject.class);
            String ic = data.get("IC").getAsString().trim();
            
            String responses;
            
            if(!checkInt(ic)){
                responses="unknown";
            }
            
            else if(ic.length()<=11 || ic.length()>12){
                
                responses="unknown";
                
            }else{

                dbInitialization();
                searchICInDatabase(ic);

                if(!rs.last()){
                    responses="New Patient"; 
                }
                else{
                    responses="DBSame";
                }

                conn.close();
                statement.close();
                rs.close();
 
            }
            
            response.getWriter().write(responses);

        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    
    
    
    protected static void dbInitialization(){
        
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
        
    }
    
    
    
    
    protected static void searchICInDatabase(String ic){
        
        try{
            
            statement = conn.prepareStatement("SELECT PatientICNo FROM PATIENT WHERE PatientICNo=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            statement.setString(1,ic);
            statement.setMaxRows(1);
            rs=statement.executeQuery(); 
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        
    }
    
    
    
    
    protected static boolean checkInt(String randString){

        try{
            
            long test = Long.parseLong(randString);
            
        }catch(NumberFormatException nfez){
            return false;
        }
        return true;
        
    }
    
}