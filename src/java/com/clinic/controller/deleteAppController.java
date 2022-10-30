/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clinic.controller;
import com.clinic.model.*;
import com.clinic.utils.dbConnection;
import java.util.*;
import java.sql.*;
import java.text.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fatin Amalin
 */
public class deleteAppController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
            response.setBufferSize(500000);
        List errorMsgs=new LinkedList();
        
        try(PrintWriter out=response.getWriter())
        {   int id=Integer.parseInt(request.getParameter("AppointmentID"));
            
           
            if(errorMsgs.isEmpty())
            {
                Connection con=null;
                PreparedStatement pstmt=null;
                try{
                    con=dbConnection.dbConnection();
                    
                    request.setAttribute("appID",id);
                    pstmt=con.prepareStatement("Delete from APPOINTMENT WHERE APPOINTMENTID=?");
                    pstmt.setInt(1, id);
                    pstmt.executeUpdate();

                    pstmt.close();
                    con.close();
                    errorMsgs.add("Successfully delete appointment " +id);
                    request.setAttribute("errorMsgs", errorMsgs);
                    RequestDispatcher view = getServletContext().getRequestDispatcher("/AppointmentList.jsp");

                    view.forward(request,response);
                }
                
		catch (SQLException ex)
		{   ex.printStackTrace();
                    errorMsgs.add("An unexpected error: " + ex.getMessage());
                    request.setAttribute("errorMsgs", errorMsgs);
                    RequestDispatcher view = request.getRequestDispatcher("/AppointmentList.jsp");
                    view.forward(request, response); 
                }
            }
            else
                 {  
                    request.setAttribute("errorMsgs", errorMsgs);
                    RequestDispatcher view = request.getRequestDispatcher("/AppointmentList.jsp");
                    view.forward(request, response); 
                }
        }
            catch (RuntimeException e) {
                e.printStackTrace();
                errorMsgs.add("An unexpected error: " + e.getMessage());
                request.setAttribute("errorMsgs", errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("/AppointmentList.jsp");
//                view.forward(request, response); 
                return;
            }
            
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(editPrescriptionController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(editPrescriptionController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}