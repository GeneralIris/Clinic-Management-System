package com.clinic.model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
/**
 *
 * @author Fatin Amalin
 */
public class Appointment implements java.io.Serializable{
    private int AppointmentID;
    private Timestamp AppointmentDateTime;
    private String MedicineList;
    private String Prescription;

    public Appointment() {
    }

    public int getAppointmentID() {
        return AppointmentID;
    }

    public Timestamp getAppointmentDateTime() {
        return AppointmentDateTime;
    }

    public String getMedicineList() {
        return MedicineList;
    }

    public String getPrescription() {
        return Prescription;
    }

    public void setAppointmentID(int AppointmentID) {
        this.AppointmentID = AppointmentID;
    }

    public void setAppointmentDateTime(Timestamp AppointmentDateTime) {
        this.AppointmentDateTime = AppointmentDateTime;
    }

    public void setMedicineList(String MedicineList) {
        this.MedicineList = MedicineList;
    }

    public void setPrescription(String Prescription) {
        this.Prescription = Prescription;
    }
   
    
}
