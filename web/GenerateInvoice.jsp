
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ClinicManagement" user="root"
                   password="root"/>

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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/resources/pages/clerk/HeaderFooter/header.jsp" />
	

	<div class="main-container">
            <div class="pd-ltr-20 xs-pd-20-10">
                <div class="min-height-200px">
                    <div class="page-header">
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <div class="title">
                                        <h4>Form</h4>
                                </div>
                                <nav aria-label="breadcrumb" role="navigation">
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Form</li>
                                        </ol>
                                </nav>
                            </div>
                            <div class="col-md-6 col-sm-12 text-right">
                                <div class="dropdown">
                                    <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                        January 2018
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">Export List</a>
                                        <a class="dropdown-item" href="#">Policies</a>
                                        <a class="dropdown-item" href="#">View Assets</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="invoice-wrap">
                        <div class="invoice-box">
                            <div class="invoice-header">
                                <div class="logo text-center">
                                    <img src="<c:url value="/resources/vendors/images/deskapp-logo.png"/>" alt="">
                                </div>
                            </div>
                            <h4 class="text-center mb-30 weight-600">MEDICAL INVOICE PRIVATE</h4>
                            <h3 class="text-center mb-30 weight-600">CMS System Generator</h3>
                            <div class="row pb-30">
                                <sql:query var="result" dataSource="${myDatasource}">
                                    SELECT INVOICE.INVOICEID, APPOINTMENT.APPOINTMENTDATETIME,
                                    PATIENT.PATIENTFIRSTNAME ||''|| PATIENT.PATIENTLASTNAME AS PATIENTNAME, PATIENT.PATIENTADDRESS
                                    FROM INVOICE
                                    JOIN APPOINTMENT
                                    ON APPOINTMENT.APPOINTMENTID = INVOICE.APPOINTMENTID 
                                    JOIN PATIENT
                                    ON APPOINTMENT.PATIENTICNO = PATIENT.PATIENTICNO WHERE INVOICE.INVOICEID=?

                                    <sql:param value="${param.invoiceID}"/>

                                </sql:query>
                                <c:forEach var="row" items="${result.rows}">
                                    <c:set var="invoiceid" value="${row.invoiceid}"/>
                                    <c:set var="appointmentdatetime" value="${row.appointmentdatetime}"/>
                                    <c:set var="PATIENTNAME" value="${row.PATIENTNAME}"/>
                                    <c:set var="patientaddress" value="${row.patientaddress}"/>
                                </c:forEach>
                                <div class="col-md-6">

                                        <h5 class="mb-15">Patient : <c:out value="${PATIENTNAME}" /></h5>
                                        <p class="font-14 mb-5">Date Issued: <strong class="weight-600"><c:out value="${appointmentdatetime}" /></strong></p>
                                        <p class="font-14 mb-5">Invoice No: <strong class="weight-600"><c:out value="${invoiceid}" /></strong></p>
                                </div>
                            </div>
                            <div class="invoice-desc pb-30">
                                        <!-- Simple Datatable start -->
                    <div class="card-box mb-30">
                                <div class="pd-20" style="text-align : center">
                                    <h4 class="text-blue h4" >Invoice List</h4>
                                </div>

                                <table border="1">
                                <sql:query var="result" dataSource="${myDatasource}">
                                    SELECT APPOINTMENT.APPOINTMENTID, APPOINTMENT.APPOINTMENTDATETIME, APPOINTMENT.MEDICINELIST, APPOINTMENT.PRESCRIPTION, INVOICE.AMOUNT
                                    FROM INVOICE
                                    JOIN APPOINTMENT
                                    ON APPOINTMENT.APPOINTMENTID = INVOICE.APPOINTMENTID WHERE INVOICE.INVOICEID=?
                                    <sql:param value="${param.invoiceID}"/>
                                </sql:query>


                                <div class="pb-20">

                                        <table class="data-table table stripe hover nowrap">
                                                <thead>
                                                        <tr>
                                                            <!-- column headers -->
                                                            <th> APPOINTMENT ID </th>
                                                            <th> DATE & TIME </th>
                                                            <th> NOTES </th>
                                                            <th> MEDICINE </th>
                                                            <th> AMOUNT </th>
                                                        </tr>
                                                </thead>
                                                <tbody>
                                                        <!-- column data -->
                                                            <c:forEach var="row" items="${result.rowsByIndex}">
                                                            <tr>
                                                                <c:forEach var="column" items="${row}">
                                                                    <td><c:out value="${column}"/></td>
                                                                </c:forEach>
                                                            </c:forEach>

                                                <div class="invoice-desc-footer">
                                                        <div class="invoice-desc-head clearfix" >
                                                                <div class="invoice-sub" ></div>
                                                                <div class="invoice-rate"></div>
                                                        </div>
                                                        <div class="invoice-desc-body">
                                                                <ul>
                                                                        <li class="clearfix">
                                                                                <div class="invoice-rate font-20 weight-600"></div>
                                                                                <div class="invoice-subtotal"><span class="weight-600 font-24 text-danger"></span></div>
                                                                        </li>
                                                                </ul>
                                                        </div>
                                                </div>

                                                <p class="text-center pb-20">TERMS & CONDITION <br>
                                                    Payment must be made after the invoice date. <br>
                                                    Payments made cannot be refunded unless the appointment is canceled. <br>
                                                    We Care Clinic will not be bound by any patient purchase order terms <br>
                                                    or other documents that are additional or inconsistent here with the <br>
                                                    terms and conditions and all such terms will be excluded.
                                                </p>
                                </div>
                        </div>
                    </div>
                <jsp:include page="/resources/pages/clerk/HeaderFooter/footer.jsp" /> 
</body>
</html>