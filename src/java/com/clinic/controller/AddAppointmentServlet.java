/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clinic.controller;

import com.clinic.utils.dbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class AddAppointmentServlet extends HttpServlet {
    
   
    private static PreparedStatement pstmt = null;
    private static Connection conn = null;
    private static ResultSet rs = null;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         List errMessage = new LinkedList();
         
        try
        {

            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            String AppointmentDateTime = request.getParameter("AppointmentDateTime");
            String PatientICNo = request.getParameter("PatientICNo");
            String EmployeeICNo = request.getParameter("EmployeeICNo");
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
            Timestamp appDate =null;
            try
            {
                if(AppointmentDateTime.trim().equalsIgnoreCase(""))
                {
                    errMessage.add("Please enter Appointment Date.");
                }
                else{
                    String ReplaceDate = AppointmentDateTime.replace('T', ' ');
                    
                    java.util.Date datechange = formatter.parse(ReplaceDate);
                    appDate = new Timestamp(datechange.getTime());
                }
                
                if(PatientICNo.trim().equalsIgnoreCase("") || EmployeeICNo.trim().equalsIgnoreCase("") )
                {
                    errMessage.add("Please enter all data correctly.");
                }
                else{
                    conn = dbConnection.dbConnection();
                    if(!checkPatientDoctor(PatientICNo,EmployeeICNo)){
                        
                        errMessage.add("Please ensure Patient / Doctor exist in the system!");
                        
                    }
                }
                    
                
                if(!errMessage.isEmpty()){
                    request.setAttribute("errMessage", errMessage);
                    RequestDispatcher view = getServletContext().getRequestDispatcher("/AddAppointmentForm.jsp");
                    view.forward(request, response);
                    return;
                }
                
                
                
                
                addAppointment(appDate, EmployeeICNo, PatientICNo);
                request.getRequestDispatcher("/AddAppointmentForm.jsp").forward(request, response);
            }
            catch(Exception ex)
            {
                out.println("Error: " + ex.getMessage());
            }
            finally
            {
                out.close();
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(AddAppointmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private boolean checkPatientDoctor(String icPatient,String icDoctor){
        
        boolean testPatient = false;
        boolean testDoctor = false;
        
        try{
            
            pstmt = conn.prepareStatement("SELECT PATIENTICNO FROM PATIENT WHERE PATIENTICNO = ? ");
            pstmt.setString(1,icPatient);
            pstmt.setMaxRows(1);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                testPatient = true;
            }
            
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        if(!testPatient){
            return false;
        }
        
        try{
            
            pstmt = conn.prepareStatement("SELECT EMPLOYEEICNO FROM EMPLOYEE WHERE EMPLOYEEICNO = ? AND EMPLOYEETYPEID = 2 ");
            pstmt.setString(1,icDoctor);
            pstmt.setMaxRows(1);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                testDoctor = true;
            }
            
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return testDoctor;
        
        
    }
   
    
    private void addAppointment(Timestamp appDate, String EmployeeICNo, String PatientICNo) throws SQLException
    {
        
        try{
            
            pstmt = conn.prepareStatement("INSERT INTO APPOINTMENT (AppointmentDateTime, MedicineList, Prescription, EmployeeICNo, PatientICNo) values (?, ?, ?, ?, ?)");
            pstmt.setTimestamp(1,appDate);
            pstmt.setString(2,null);
            pstmt.setString(3,null);
            pstmt.setString(4, EmployeeICNo);
            pstmt.setString(5, PatientICNo);
            
            pstmt.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
}

