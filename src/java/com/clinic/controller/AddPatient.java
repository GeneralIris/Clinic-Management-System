/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clinic.controller;


import com.clinic.utils.dbConnection;
import com.clinic.model.Patient;

import com.google.gson.*;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author General IRIS
 */
public class AddPatient extends HttpServlet {
    
    final static String errorResponse = "qLCk5QxYwCnY7zDsYs9ezFgipHwnk84Fx97J";
    static PrintWriter out;
    static Connection conn;
    static PreparedStatement statement;
    static Patient p=null;
    
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
            String IC = data.get("IC").getAsString().trim();
            String Fname = data.get("Fname").getAsString(); 
            String Lname = data.get("Lname").getAsString();
            String ph = data.get("ph").getAsString();
            String address = data.get("address").getAsString();
            String Eph = data.get("Eph").getAsString();
            
            
            
            String responses=null;
            if(IC.isEmpty() || Fname.isEmpty() || Lname.isEmpty() || ph.isEmpty() || address.isEmpty()){
                responses=errorResponse;
                
            }
            else if(IC.length()<=11 || IC.length()>12 || Fname.length()>=30 || Lname.length() >=30 || 
                    address.length()>=100 || ph.length()>=13 || ph.length()<=9){
                responses=errorResponse;
            }
            else if((!checkInt(IC))||(!checkInt(ph))){
                responses=errorResponse;
            }
            else if(!Eph.isEmpty()){
                if(!checkInt(Eph)||Eph.length()>=13 || Eph.length()<=9){
                    responses=errorResponse;
                }
            }

            if(responses!=null){
                response.getWriter().write(responses);
            }
            else{
                p = new Patient (IC,Fname,Lname,address,ph,Eph);
                
                conn=dbConnection.dbConnection();
                insertIntoDB(p);

                conn.close();
                statement.close();
                return;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    

    protected static void insertIntoDB(Patient p){
        
        try{

            statement = conn.prepareStatement("INSERT INTO PATIENT (PatientICNo,PatientFirstName,PatientLastName,PatientAddress,PatientPhone,PatientEmergencyPhone)" +
                                              " VALUES (?,?,?,?,?,?)");
            statement.setString(1, p.getPatientICno());
            statement.setString(2, p.getFname());
            statement.setString(3, p.getLname());
            statement.setString(4, p.getAddress());
            statement.setString(5, p.getPh());
            if(p.getEph().isEmpty()){
                statement.setString(6, null);
            }else{
                statement.setString(6, p.getEph());
            }
            statement.executeUpdate(); 
            
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
