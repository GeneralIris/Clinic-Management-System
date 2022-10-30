

<jsp:include page="/resources/pages/clerk/HeaderFooter/header.jsp" />



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
                            <h4>Doctor List</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Doctor List</li>
                            </ol>
                        </nav>
                    </div>

                </div>
            </div>
            <!-- Simple Datatable start -->
            <div class="card-box mb-30">
                <div class="pd-20">
                    <h4 class="text-blue h4">Doctors List</h4>
                    
                    <sql:query var="result" dataSource="${myDatasource}">
                        SELECT EMPLOYEEICNO, EMPLOYEEFIRSTNAME || ' ' || EMPLOYEELASTNAME, EMPLOYEEADDRESS, 
                        EMPLOYEEPHONE, EMPLOYEESTARTDATE FROM EMPLOYEE WHERE EMPLOYEETYPEID = 2
                    </sql:query>

                </div>
                <div class="pb-20">
                    <table class="data-table table stripe hover nowrap">
                        <thead>
                            <tr>
                                <th class="table-plus datatable-nosort">IC NO.</th>
                                <th>Doctor Name</th>
                                <th>Address</th>
                                <th>Phone Number</th>
                                <th>Start Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- column data -->
                            <c:forEach var="row" items="${result.rowsByIndex}">
                                <tr>
                                    <c:forEach var="column" items="${row}">
                                        <td><c:out value="${column}"/></td>
                                    </c:forEach>
                                    
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Simple Datatable End -->
        </div>
        <!--footer-->
        <jsp:include page="/resources/pages/clerk/HeaderFooter/footer.jsp" />
    </div>
</div>



</body>
</html>