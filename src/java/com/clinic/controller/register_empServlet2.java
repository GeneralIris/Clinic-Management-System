/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clinic.controller;
 
import com.clinic.model.register_empBean;
import com.clinic.dao.employeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 


public class register_empServlet2 extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
        
            boolean validated = false;
        
            
            String employeeICNo = request.getParameter("IC");
            String employeeFirstName = request.getParameter("fN");
            String employeeLastName = request.getParameter("lN");
            String employeeAddress = request.getParameter("Add");      
            String employeePhone = request.getParameter("pN");
            String username = request.getParameter("u");
            String password = request.getParameter("p");
            
           
            
                       
            employeeDAO  employee= new employeeDAO();
            
        
            register_empBean emp = new register_empBean(employeeICNo, employeeFirstName, employeeLastName,employeeAddress, employeePhone, username, password);
            String RegisterStatus = employee.registerProcess(emp);
        
            if(RegisterStatus.equals("Registration Successful!")){
                request.setAttribute("message", RegisterStatus);
                request.getRequestDispatcher("login_emp.jsp").forward(request, response);
            } else{
                request.setAttribute("errMessage", RegisterStatus);
                request.getRequestDispatcher("register_emp.jsp").forward(request, response);
            }
        }
        
             
             
        
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         doGet(request,response);
        
          }

}