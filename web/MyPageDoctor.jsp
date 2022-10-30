

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ClinicManagement" user="root"
                   password="root"/>

<!--header-->


<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>My Profile</h4>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Default Basic Forms Start -->
            <div class="pd-20 card-box mb-30">
               
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT * FROM EMPLOYEE WHERE EMPLOYEEICNO=?
                    <sql:param value="${empic}"/>
                </sql:query>
                <c:forEach var="row" items="${result.rows}">
                    <c:set var="empIC" value="${row.employeeicno}"/>
                    <c:set var="empFname" value="${row.employeefirstname}"/>
                    <c:set var="empLname" value="${row.employeelastname}"/>
                    <c:set var="empAdds" value="${row.employeeaddress}"/>
                    <c:set var="empPhone" value="${row.employeephone}"/>
                    <c:set var="Startdate" value="${row.employeestartdate}"/>
                </c:forEach>

                <form>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Doctor IC</label>
                        <div class="col-sm-12 col-md-10">
                            <input class="form-control" type="text" name="empIC" value="${empIC}" disabled="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Doctor Name</label>
                        <div class="col-sm-12 col-md-10">
                            <input class="form-control" type="text" name="empFname" value="${empFname}" disabled="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Address</label>
                        <div class="col-sm-12 col-md-10">
                            <input class="form-control" type="text" name="empLname" value="${empAdds}" disabled="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Contact Number</label>
                        <div class="col-sm-12 col-md-10">
                            <input class="form-control" type="text" name="empPhone" value="${empPhone}" disabled="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Start Date</label>
                        <div class="col-sm-12 col-md-10">
                            <input class="form-control" type="local-datetime" name="Startdate" value="${Startdate}" disabled="">
                        </div>
                    </div>
                </form>

            </div>
            <!-- Default Basic Forms End -->
        </div>
        <!--footer-->
        <jsp:include page="/resources/pages/doctor/HeaderFooter/footer2.jsp" />
    </div>
</div>

</body>
</html>
