

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ClinicManagement" user="root"
                   password="root"/>


<jsp:include page="/resources/pages/doctor/HeaderFooter/header2.jsp" />

<%@page import="java.util.*,com.clinic.model.Employee"%>


<%
    Employee emp1 = null;
   
    if(session.getAttribute("EmployeeObject")==null){
        response.sendRedirect("login_emp.jsp");
    }

    else{
        if(((Employee)session.getAttribute("EmployeeObject")).getEmployeeTypeID()!=2)
            response.sendRedirect("DoctorList.jsp");
        else{
            emp1= (Employee)session.getAttribute("EmployeeObject");
            pageContext.setAttribute("empic", emp1.getEmployeeICNo());
           
        }
    }

%>
        <!--header-->
        
        <c:set var="AppointmentID" value="${param.AppointmentID}"/>
        <c:set var="patientICNo" value="${param.patientICNo}"/>
        <c:set var="patientName" value="${param.patientName}"/>
        <c:set var="doctorName" value="${param.doctorName}"/>
        <c:set var="AppointmentDateTime" value="${param.AppointmentDateTime}"/>
        <c:set var="medicineList" value="${param.medicineList}"/>
        <c:set var="prescription" value="${param.prescription}"/>
        
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT appointment.appointmentid,
            patient.patienticno,
            patient.patientfirstname ||' '|| patient.patientlastname AS "patientname",
            employee.employeefirstname ||' '|| employee.employeelastname AS "doctorname",
            appointment.appointmentdatetime,
            appointment.medicinelist,
            appointment.prescription
            FROM appointment  JOIN patient 
            ON appointment.patienticno=patient.patienticno 
            JOIN employee 
            ON employee.EMPLOYEEICNO=appointment.EMPLOYEEICNO
            WHERE appointment.appointmentid=?
            <sql:param value="${AppointmentID}"/>
        </sql:query>
        <c:forEach var="table" items="${result.rows}">
            <c:set var="id_query1" value="${table.appointmentid}"/>
            <c:set var="ic_query2" value="${table.patienticno}"/>
            <c:set var="name_query3" value="${table.patientname}"/>
            <c:set var="doctorname_query4" value="${table.doctorname}"/>
            <c:set var="dateTime_query5" value="${table.appointmentdatetime}"/>
            <c:set var="medicine_query6" value="${table.medicinelist}"/>
            <c:set var="presc_query7" value="${table.prescription}"/>
        </c:forEach>
        <div class="main-container">
            <div class="card-box mb-30">
                 <c:if test="${not empty errorMsgs}">
                    <p><h2>Error Report</h2>
                        <font color='red'>Please correct the following errors:
                            <ul>
                                <c:forEach var="message" items="${errorMsgs}">
                                    <li>${message}</li>
                                </c:forEach>
                            </ul>
                        </font>
                     </p>
                </c:if>
                <div class="pd-20 card-box mb-30">
                    <div class="clearfix">
                        <div class="pull-left">
                            <h4 class="text-blue h4">Edit Prescription</h4>
                            <p class="mb-30">Please fill up the form</p>
                        </div>
                    </div>
                    <form method="post" action="editPrescriptionController">
                        <div class="form-group">
                                <label>Appointment ID</label>
                                <input class="form-control" type="text" name="AppointmentID" value="${id_query1}" readonly="" >
                        </div>
                        <div class="form-group">
                                <label>Patient IC No.</label>
                                <input class="form-control" type="text" name="patientICNo" value="${ic_query2}" readonly="">
                        </div>
                        <div class="form-group">
                                <label>Patient Name</label>
                                <input class="form-control" type="text" name="patientName" value="${name_query3}" readonly="">
                        </div>
                        <div class="form-group">
                                <label>Doctor Name</label>
                                <input class="form-control" type="text" name="doctorName" value="${doctorname_query4}"  readonly="">
                        </div>
                        <div class="form-group">
                            <table>
                            <tr><td><label>Appointment Time</label></td></tr>
                            <tr><td><input  type="datetime-local" name="AppointmentDateTime" value="${dateTime_query4}"></td></tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label>Medicine List</label>
                            <input class="form-control" type="text" name="medicineList" value="${medicine_query6}">
                        </div>
                        <div class="form-group">
                            <label>Notes</label>
                            <input class="form-control" type="text" name="prescription" value="${presc_query7}">
                        </div>
                        <div class="btn-list">
                            <input class="btn btn-primary" type="submit" value="Submit">
                        </div>
                    </form>
                </div>
            </div>
        </div>                      
    </body>
    <!--footer-->
<jsp:include page="/resources/pages/doctor/HeaderFooter/footer2.jsp" />
</html>

