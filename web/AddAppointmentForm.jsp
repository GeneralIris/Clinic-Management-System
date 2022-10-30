

        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">

                            <div class="pd-20 card-box mb-30">
                                <div class="clearfix">
                                        <div class="pull-left">
                                                <h4 class="text-blue h4">Add Appointment</h4>
                                        </div>
                                </div>
                                <form class="form" method="POST" action="AddAppointmentServlet">  
                            
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>Appointment Date/Time</label>
                                                <input class="form-control" type="datetime-local" name="AppointmentDateTime" autocomplete="off" placeholder="Choose Date and Time">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <c:if test="${not empty errMessage}">
                                                <p><h2>Error !</h2>
                                                    <font color='red'>Please correct the following errors:
                                                        <ul>
                                                            <c:forEach var="message" items="${errMessage}">
                                                                <li>${message}</li>
                                                            </c:forEach>
                                                        </ul>
                                                    </font>
                                                 </p>
                                            </c:if>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>Patient IC Number</label>
                                                <input class="form-control" type="text" name="PatientICNo" autocomplete="off" placeholder="Patient IC Number">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>Doctor IC Number</label>
                                                <input class="form-control" type="text" name="EmployeeICNo" autocomplete="off" placeholder="Doctor IC Number">
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
				<!-- Input Validation End -->
			<jsp:include page="/resources/pages/clerk/HeaderFooter/footer.jsp" />
                        
        <script>
            function tempForceScripts(){
                a;
            }
        </script>
        <script>
            $(document).ready(function(){

                $(".num2").addClass("show");  
                $(".num2submenu").css('display','block');
                $(".num2sub1").addClass("active");  

                $("#patientIC").keyup(function(e){
                    Checker();
                });
                $("#submit").click(function(){
                    Submiting();
                });


            });

        </script>
</body>
</html>
