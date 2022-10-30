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

<sql:setDaraSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"></sql:setDaraSource>



	<div class="main-container">
            <div class="pd-ltr-20 xs-pd-20-10">
                <div class="min-height-200px">
                    
                    
                    <!-- Default Basic Forms Start -->
                    <div class="pd-20 card-box mb-30">
                        <div class="clearfix">
                            <div class="pull-left">
                                <h4 class="text-blue h4">Add Doctor</h4>
                            </div>
                        </div>
                        <c:if test="${not empty errMessage}">
                            <p><h2>Error Report</h2>
                                <font color='red'>Please correct the following errors:
                                    <ul>
                                        <c:forEach var="message" items="${errMessage}">
                                            <li>${message}</li>
                                        </c:forEach>
                                    </ul>
                                </font>
                             </p>
                        </c:if>
                        <form class="form" action="addDoctorServlet" method="POST" >  

                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Doctor IC Number</label>
                                        <input class="form-control" type="text" name="employeeICNo" autocomplete="off" placeholder="IC Number">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Start Date</label>
                                        <input class="form-control" type="datetime-local" name="employeeStartDate" autocomplete="off" placeholder="Start Date">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Doctor First Name</label>
                                        <input class="form-control" type="text" name="dFName" autocomplete="off" placeholder="First Name">
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Doctor Address</label>
                                        <input class="form-control" type="text" name="employeeAddress" autocomplete="off" placeholder="Address">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Doctor Last Name</label>
                                        <input class="form-control" type="text" name="dLName" autocomplete="off" placeholder="Last Name">
                                    </div>
                                </div>


                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input class="form-control" type="text" name="username" autocomplete="off" placeholder="Username">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <input class="form-control" type="text" name="employeePhone" autocomplete="off" placeholder="Phone Number">
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input class="form-control" type="text" name="password" autocomplete="off" placeholder="Password">
                                    </div>
                                </div>


                            </div>
                            <div class="row">
                                <div class="col-md-3 col-sm-12">
                                </div>
                                <div class="col-md-3 col-sm-12">
                                    <input class="btn btn-danger" type="reset" name="Empty" value="Reset">
                                </div>
                                <div class="col-md-3 col-sm-12">
                                </div>
                                <div class="col-md-3 col-sm-12">
                                    <input class="btn btn-primary" type="submit" name="Submit" value="Submit">
                                </div>
                            </div>

                        </form>
                    </div>
                    
                    <!--footer-->
                <jsp:include page="/resources/pages/clerk/HeaderFooter/footer.jsp" />
                  
    </body>
</html>
