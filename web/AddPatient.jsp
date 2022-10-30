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

        <!--header-->

	<div class="main-container">
            <div class="pd-ltr-20 xs-pd-20-10">
                <div class="min-height-200px">
                    <div class="page-header">
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <div class="title">
                                        <h4>Add Patient</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Input Validation Start -->
                    <div class="pd-20 card-box mb-30">
                        <div class="clearfix">
                            <div class="pull-left">
                                    <h4 class="text-blue h4">Patient IC Validation</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <!--  has-success has-warning has-danger-->
                                <!--   	class="form-control form-control-success"
                                                class="form-control form-control-warning"
                                                class="form-control form-control-danger"
                                -->
                                <div class="form-group has-error" id="disp">
                                    <input type="text" class="form-control verify form-control-warning" name="patientIC" id="patientIC" autocomplete="off" placeholder="Patient IC Number" maxlength="12">
                                    <div class="form-control-feedback dispFeedBack"></div>
                                    <small class="form-text text-muted">Ensure IC Number Without '-'</small>
                                </div>
                            </div>
                        </div>


                    </div>
                    <!-- Input Validation End -->
                
                    <!-- FORM INPUT-->
                    <div class="pd-20 card-box mb-30 allowed" style="display:none">
                        <div class="clearfix">
                            <div class="pull-left">
                                <h4 class="text-blue h4">Patient Form</h4>
                            </div>
                        </div>
                    
                        <form class="form" method="POST" action="AddPatient" id="patientform" name="patientform" >  
                            
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input class="form-control" type="text" name="Fname" id="Fname" autocomplete="off" placeholder="First Name">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input class="form-control" type="text" name="Lname" id="Lname" autocomplete="off" placeholder="Last Name">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <input class="form-control" type="text" name="ph" id="ph" autocomplete="off" placeholder="Phone Number">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Emergency Phone Number</label>
                                        <input class="form-control" type="text" name="Eph" id="Eph" autocomplete="off" placeholder="Phone Number">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <textarea class="form-control" name="address" id="address" form="patientform"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 col-sm-12">
                                </div>
                                <div class="col-md-3 col-sm-12">
                                    <input class="btn btn-danger" id="helpReset"type="reset" name="Empty" value="Reset">
                                </div>
                                <div class="col-md-3 col-sm-12">
                                </div>
                                <div class="col-md-3 col-sm-12">
                                    <input class="btn btn-primary" type="button" name="Submit" id="submit" value="Submit">
                                </div>
                            </div>
                        </form>
                    <!-- FORM INPUT End -->
                    </div>

                <!--footer-->
                <jsp:include page="/resources/pages/clerk/HeaderFooter/footer.jsp" />
                
                
                
                
        <script src="<c:url value="/resources/src/scripts/addPatient.js" />"</script>
        <script>
            function tempForceScripts(){
                a;
            }
        </script>
        <script>
            $(document).ready(function(){

                $(".num1").addClass("show");  
                $(".num1submenu").css('display','block');
                $(".num1sub1").addClass("active");  
                
                $(".num3").addClass("show");  
                $(".num3submenu").css('display','none');
                $(".num3sub1").removeClass("active");
                
                
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