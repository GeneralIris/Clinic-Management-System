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
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;
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
public class deletePrescriptionController extends HttpServlet {

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
                    errorMsgs.add("Successfully delete prescription " +id);
                    request.setAttribute("errorMsgs", errorMsgs);
                    RequestDispatcher view = getServletContext().getRequestDispatcher("/prescriptionList.jsp");

                    view.forward(request,response);
                }
                
		catch (SQLException ex)
		{   ex.printStackTrace();
                    errorMsgs.add("An unexpected error: " + ex.getMessage());
                    request.setAttribute("errorMsgs", errorMsgs);
                    RequestDispatcher view = request.getRequestDispatcher("/prescriptionLis.jsp");
                    view.forward(request, response); 
                }
            }
            else
                 {  
                    request.setAttribute("errorMsgs", errorMsgs);
                    RequestDispatcher view = request.getRequestDispatcher("/prescriptionLis.jsp");
                    view.forward(request, response); 
                }
        }
            catch (RuntimeException e) {
                e.printStackTrace();
                errorMsgs.add("An unexpected error: " + e.getMessage());
                request.setAttribute("errorMsgs", errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("/prescriptionLis.jsp");
//                view.forward(request, response); 
                return;
            }
            
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(deletePrescriptionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(deletePrescriptionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
