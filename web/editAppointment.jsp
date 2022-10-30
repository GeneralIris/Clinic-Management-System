<%@page import="java.util.*,com.clinic.model.Employee"%>
<%
    Employee emp1 = null;
   
    if(session.getAttribute("EmployeeObject")==null){
        response.sendRedirect("login_emp.jsp");
    }

    else{
        if(((Employee)session.getAttribute("EmployeeObject")).getEmployeeTypeID()!=1)
            response.sendRedirect("MyPageDoctor.jsp");
        else{
            emp1= (Employee)session.getAttribute("EmployeeObject");
            pageContext.setAttribute("empic", emp1.getEmployeeICNo());
           
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ClinicManagement" user="root"
                   password="root"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Appointment</title>
    </head>
    <body>
        <jsp:include page="/resources/pages/clerk/HeaderFooter/header.jsp" />
        <!--header-->
        
        <c:set var="AppointmentID" value="${param.AppointmentID}"/>
        <c:set var="patientICNo" value="${param.patientICNo}"/>
        <c:set var="patientName" value="${param.patientName}"/>
        <c:set var="AppointmentDateTime" value="${param.AppointmentDateTime}"/>
        <c:set var="doctorName" value="${param.doctorName}"/>
        
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT appointment.appointmentid,
            patient.patienticno,
            patient.patientfirstname ||' '|| patient.patientlastname AS "fullname",
            appointment.appointmentdatetime
            FROM appointment  JOIN patient 
            ON appointment.patienticno=patient.patienticno 
            WHERE appointment.appointmentid=?
            <sql:param value="${AppointmentID}"/>
        </sql:query>
        <c:forEach var="table" items="${result.rows}">
            <c:set var="id_query1" value="${table.appointmentid}"/>
            <c:set var="ic_query2" value="${table.patienticno}"/>
            <c:set var="name_query3" value="${table.fullname}"/>
            <c:set var="dateTime_query4" value="${table.appointmentdatetime}"/>
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
                            <h4 class="text-blue h4">Edit Appointment</h4>
                            <p class="mb-30">Please fill up the form</p>
                        </div>
                    </div>
                    <form method="post" action="editAppController">
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
                            <table>
                            <tr><td><label>Appointment Time</label></td></tr>
                            <tr><td><input  type="datetime-local" name="AppointmentDateTime" value="${dateTime_query4}" ></td></tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label>Doctor Name</label>
                            <select class="custom-select2 form-control" name="doctorName" style="width: 100%; height: 38px;">
                                <sql:query var="result" dataSource="${myDatasource}">
                                    SELECT EMPLOYEEFIRSTNAME FROM EMPLOYEE
                                    WHERE EMPLOYEETYPEID=2
                                </sql:query>
                                <c:forEach var="row" items="${result.rowsByIndex}">
                                    <c:forEach var="column" items="${row}">
                                        <option> 
                                            <c:out value="${column}"/>
                                        </option>
                                    </c:forEach>
                                </c:forEach>
                            </select>
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
<jsp:include page="/resources/pages/clerk/HeaderFooter/footer.jsp" />
</html>
