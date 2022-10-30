/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clinic.model;

/**
 *
 * @author General IRIS
 */
public class Patient implements java.io.Serializable{
    
    String patientICno,fname,lname,address,ph,eph;
    
    public Patient(String ic, String fname,String lname,String add,String ph,String eph){
        
        this.patientICno=ic;
        this.fname=fname;
        this.lname=lname;
        this.address=add;
        this.ph=ph;
        this.eph=eph;
    }

    public String getPatientICno() {
        return patientICno;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }


    public String getAddress() {
        return address;
    }

    public String getPh() {
        return ph;
    }

    public String getEph() {
        return eph;
    }

    
    
    
    
    public void setPatientICno(String patientICno) {
        this.patientICno = patientICno;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }
 
    public void setAddress(String address) {
        this.address = address;
    }

    public void setPh(String ph) {
        this.ph = ph;
    }

    public void setEph(String eph) {
        this.eph = eph;
    }
    
    
    
    
}
