/* 
 * To change this license header, choose License Headers in Project Properties. 
 * To change this template file, choose Tools | Templates 
 * and open the template in the editor. 
 */ 
package com.clinic.controller; 
 
import com.clinic.model.Doctor; 
import com.clinic.dao.DoctorDAO; 
import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
 
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.SQLException; 
import java.sql.Timestamp; 
 
import java.text.ParseException; 
import java.text.SimpleDateFormat; 
import java.util.LinkedList;
import java.util.List;
 
import java.util.logging.Level; 
import java.util.logging.Logger; 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
 
/* 
 * 
 * @author User 
 */ 
public class addDoctorServlet extends HttpServlet { 
     
    private DoctorDAO doctorDAO; 
 
    public void init(){ 
        doctorDAO=new DoctorDAO(); 
    } 
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException { 
        response.setContentType("text/html;charset=UTF-8"); 
        try (PrintWriter out = response.getWriter()) { 
        } 
    } 
 
    @Override 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException { 
         
        response.setContentType("text/html;charset=UTF-8"); 
        PrintWriter out = response.getWriter(); 
        List errMessage = new LinkedList();
        try { 
 
            String EmpICNo = request.getParameter("employeeICNo"); 
            String EmpFName = request.getParameter("dFName"); 
            String EmpLName = request.getParameter("dLName"); 
            String EmpAddress = request.getParameter("employeeAddress"); 
            String StartDate = request.getParameter("employeeStartDate"); 
            String EmpPhone = request.getParameter("employeePhone");   
            String Username = request.getParameter("username"); 
            String Password = request.getParameter("password"); 
             
            if(EmpICNo.trim().equalsIgnoreCase("")|| EmpFName.trim().equalsIgnoreCase("")|| EmpLName.trim().equalsIgnoreCase("")|| EmpAddress.trim().equalsIgnoreCase("") || StartDate.trim().equalsIgnoreCase("")||  
                    EmpPhone.trim().equalsIgnoreCase("")|  Username.trim().equalsIgnoreCase("") || Password.trim().equalsIgnoreCase("")) 
            { 
                errMessage.add("Please fill in the form completely");

            } 
            
            if(EmpICNo.length() >12 || EmpICNo.length() <12) 
            { 
                errMessage.add("Enter Proper IC NO");
             
            } 
            
            if (!errMessage.isEmpty()) {
                request.setAttribute("errMessage", errMessage);
                RequestDispatcher view = getServletContext().getRequestDispatcher("/addDoctor.jsp");
                view.forward(request, response);
                return;
            }
            
            Doctor newDoctor = new Doctor(EmpICNo,EmpFName,EmpLName,EmpAddress,StartDate,EmpPhone,Username,Password);     
            doctorDAO.insertDoctor(newDoctor); 
                                
            request.getRequestDispatcher("/addDoctor.jsp").forward(request, response); 
             
            } 
            catch(Exception ex) { 
                throw new ServletException(ex); 
            }            
        } 
         
     
    @Override 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {     
        doPost(request, response); 
    } 
   
}