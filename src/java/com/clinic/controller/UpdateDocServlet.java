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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
 * @author Asiah
 */
public class UpdateDocServlet extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        
        List errMessage = new LinkedList();
        
        try (PrintWriter out = response.getWriter()) {
            
            String empIC = request.getParameter("empIC");
            String empFname = request.getParameter("empFname");
            String empLname = request.getParameter("empLname");
            String empAdds = request.getParameter("empAdds");
            String empPhone = request.getParameter("empPhone");
            String date=request.getParameter("Startdate");
            String Replacedate =date.replace('T',' ');
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm", Locale.ENGLISH);            
            java.util.Date  datechange = formatter.parse(Replacedate);
            Timestamp Startdate = new Timestamp( datechange.getTime());;
            
            //Form verification
            if (empAdds.equals(null) || empAdds.trim().length() == 0) {
                errMessage.add("Please enter the address.");
            }
            if (empPhone.equals(null) || empPhone.trim().length() == 0) {
                errMessage.add("Please enter the phone number.");
            }
            if (!errMessage.isEmpty()) {
                request.setAttribute("errMessage", errMessage);
                RequestDispatcher view = getServletContext().getRequestDispatcher("/UpdateDetailsDoctor.jsp");
                view.forward(request, response);
                return;
            }
            
            //connect to database
            Connection con = null;
            Statement stmt = null;
            ResultSet relSet = null;
            
            try {
                con = dbConnection.dbConnection();
                
                String sql = "UPDATE EMPLOYEE SET EMPLOYEEADDRESS=?, EMPLOYEEPHONE=? WHERE EMPLOYEEICNO=?";
                PreparedStatement pstmt = con.prepareStatement(sql);
                
                pstmt.setString(1, empAdds);
                pstmt.setString(2, empPhone);
                pstmt.setString(3, empIC);
                pstmt.executeUpdate();

                pstmt.close();
                con.close();
                
                //Dispatch to Success view
                //response.sendRedirect("/MyPageDoctor.jsp");
                RequestDispatcher view = request.getRequestDispatcher("/MyPageDoctor.jsp");
                //RequestDispatcher view = getServletContext().getRequestDispatcher("/MyPageDoctor.jsp");
                view.forward(request, response);
                return;
            }
            catch (SQLException e) {
                e.printStackTrace();
                errMessage.add("An unexpected error: " + e.getMessage());
                request.setAttribute("errMessage", errMessage);
                RequestDispatcher view = request.getRequestDispatcher("/UpdateDetailsDoctor.jsp");
                view.forward(request, response);
                return;
            }
        }
        catch (RuntimeException e) {
            e.printStackTrace();
            errMessage.add("An unexpected error: " + e.getMessage());
            request.setAttribute("errMessage", errMessage);
            RequestDispatcher view = request.getRequestDispatcher("/UpdateDetailsDoctor.jsp");
            return;
        }
        //response.sendRedirect("MyPageDoctor.jsp");
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
            Logger.getLogger(UpdateDocServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateDocServlet.class.getName()).log(Level.SEVERE, null, ex);
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
