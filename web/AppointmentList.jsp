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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ClinicManagement" user="root"
                   password="root"/>
<html>
    <head>
        <title>View Appointment</title>
    </head>
    <body>
        <jsp:include page="/resources/pages/clerk/HeaderFooter/header.jsp" />
        <!--header-->
    <sql:query var="result" dataSource="${myDatasource}">
        SELECT A.AppointmentID,P.PatientFirstName ||' '|| P.PatientLastName,
        A.AppointmentDateTime,
        D.EmployeeFirstName ||' '|| D.EmployeeLastName,
        A.MedicineList,
        A.Prescription FROM APPOINTMENT A JOIN PATIENT P ON A.PatientICNo=P.PatientICNo 
        JOIN EMPLOYEE D ON A.EmployeeICNo=D.EmployeeICNo
    </sql:query>
    <div class="main-container">
        <div class="card-box mb-30">
            <c:if test="${not empty errorMsgs}">               
                <font color='green'>
                <ul>
                    <c:forEach var="message" items="${errorMsgs}">
                        <li>${message}</li>
                        </c:forEach>
                </ul>
                </font>
            </p>
        </c:if>
            <div class="pd-20">
                <h4 class="text-blue h4">View Appointment</h4>
            </div>
            <div class="pb-20">
                <table class="data-table table stripe hover nowrap">
                    <thead>
                        <tr>
                            <th class="table-plus datatable-nosort">Appointment ID</th>
                            <th>Patient Name</th>
                            <th>Date & Time</th>
                            <th>Doctor Name</th>
                            <th>Medical List</th>
                            <th>Notes</th>
                            <th class="datatable-nosort">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${result.rowsByIndex}">
                            <tr>
                                <c:forEach var="column" items="${row}">
                                    <td class="table-plus"><c:out value="${column}"/></td>
                                </c:forEach>
                                <td><div class="dropdown">
                                        <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                            <i class="dw dw-more"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                            <a class="dropdown-item" href="#"><i class="dw dw-edit2"></i>
                                                <form action="editAppointment.jsp" method="POST">
                                                    <input type="hidden" name="AppointmentID" value="${row[0]}"/>
                                                    <input class="btn btn-primary" type="submit" value="Edit"></form>
                                            </a>
                                            <a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i>
                                                <form action="deleteAppController" method="POST">
                                                    <input type="hidden" name="AppointmentID" value="${row[0]}"/>
                                                    <input class="btn btn-primary" type="submit" value="Delete"></form>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<!--footer-->
<jsp:include page="/resources/pages/clerk/HeaderFooter/footer.jsp" />
</body>
</html>

