/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clinic.dao;
import com.clinic.utils.dbConnection;
import com.clinic.model.Doctor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USER
 */
public class DoctorDAO {
    
   

    private static final String INSERT_DOCTOR = "INSERT INTO EMPLOYEE (EmployeeICNo,EmployeeFirstName ,EmployeeLastName ,EmployeeAddress ,EmployeeStartDate ,EmployeePhone ,Username,Password, EmployeeTypeID )"
            + "values (?,?,?,?,?,?,?,?,?)";


    public void insertDoctor(Doctor doctor) throws SQLException, ParseException {
        
        // try-with-resource statement will auto close the connection.
        try (Connection connection = dbConnection.dbConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DOCTOR);
            preparedStatement.setString(1, doctor.getEmpICNo());
            preparedStatement.setString(2, doctor.getEmpFName());
            preparedStatement.setString(3, doctor.getEmpLName());
            preparedStatement.setString(4, doctor.getEmpAddress());
            String ReplaceDate = doctor.getStartDate().replace('T', ' ');
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
            java.util.Date datechange = formatter.parse(ReplaceDate);
            Timestamp appDate = new Timestamp(datechange.getTime());
            preparedStatement.setTimestamp(5,appDate);
            preparedStatement.setString(6, doctor.getEmpPhone());        
            preparedStatement.setString(7, doctor.getUsername());
            preparedStatement.setString(8, doctor.getPassword());
            preparedStatement.setInt(9, 2);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
        
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}
