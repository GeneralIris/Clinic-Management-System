<%@page import="java.util.*,com.clinic.model.Employee"%>
<%  
    
    response.setHeader( "Pragma", "no-cache" );
    response.setHeader( "Cache-Control", "no-cache" );
    response.setDateHeader( "Expires", 0 );
    
    if(session.getAttribute("EmployeeObject")!=null ){
        
        if(((Employee)session.getAttribute("EmployeeObject")).getEmployeeTypeID()==1)
            response.sendRedirect("DoctorList.jsp");
        else
            response.sendRedirect("MyPageDoctor.jsp");
    }

%>

<!DOCTYPE html>
<html>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>Clinic Management - DeskApp</title>

	<!-- Site favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="<c:url value="/resources/vendors/images/apple-touch-icon.png"/>">
	<link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/vendors/images/favicon-32x32.png"/>">
	<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/vendors/images/favicon-16x16.png"/>">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/styles/core.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/styles/icon-font.min.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/styles/style.css"/>">
        
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/src/plugins/jquery-steps/jquery.steps.css"/>">
        
	
        

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
</head>

<body class="login-page">
	<div class="login-header box-shadow">
		<div class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo">
				<a href="login_emp.jsp">
					<img src="<c:url value="/resources/vendors/images/deskapp-logo.svg"/>" alt="">
				</a>
			</div>
			<div class="login-menu">
				<ul>
					<li><a href="login_emp.jsp">Login</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="register-page-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img src="<c:url value="/resources/vendors/images/login-page-img.png"/>" alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="register-box bg-white box-shadow border-radius-10">
						<div class="wizard-content">
							<form action="register_empServlet2" method="post" class="tab-wizard2 wizard-circle wizard">
								<h5>Basic Account Credentials</h5>
								<section>
									<div class="form-wrap max-width-600 mx-auto">
										<div class="form-group row">
											
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">Username*</label>
											<div class="col-sm-8">
												<input type="text" name="u" id="u" class="form-control">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">Password*</label>
											<div class="col-sm-8">
												<input type="password" name="p" id="p" class="form-control">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">Confirm Password*</label>
											<div class="col-sm-8">
												<input type="password" class="form-control">
											</div>
										</div>
                                                                             <p style="color:red"><%=(request.getAttribute("message")==null)? "" : request.getAttribute("message")%></p>
									</div>
								</section>
								<!-- Step 2 -->
								<h5>Personal Information</h5>
								<section>
									<div class="form-wrap max-width-600 mx-auto">
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">First Name</label>
											<div class="col-sm-8">
												<input type="text" name="fN" id="fN" name="" class="form-control">
											</div>
										</div>
                                                                                <div class="form-group row">
											<label class="col-sm-4 col-form-label">Last Name</label>
											<div class="col-sm-8">
												<input type="text" name="lN" id="lN" class="form-control">
											</div>
										</div>
										<div class="form-group row align-items-center">
											
											<div class="col-sm-8">
												
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">IC Number</label>
											<div class="col-sm-8">
												<input type="text" name="IC" id="IC" class="form-control">
											</div>
										</div>
                                                                                <div class="form-group row">
											<label class="col-sm-4 col-form-label">Phone Number</label>
											<div class="col-sm-8">
												<input type="text" name="pN" id="pN" class="form-control">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">Address</label>
											<div class="col-sm-8">
												<input type="text" name="Add" id="Add" class="form-control">
											</div>
										</div>
                                                                                
                                                                               
									</div>
								</section>
								
								<!-- Step 3 -->
								<h5>Confirmation</h5>
								<section>
									<div class="form-wrap max-width-600 mx-auto">
										
										<div class="custom-control custom-checkbox mt-4">
											
											
                                                                                        <label >I have read and agreed to the terms of services and privacy policy</label>
										</div>
                                                                            
                                                                            <div class="centre">
                                                                                    <input class="btn btn-primary"type="submit" value="Yes I Agree">
                                                                                </div>
                                                                            
									</div>
								</section>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- success Popup html End -->
	<!-- js -->
	<script src="<c:url value="/resources/vendors/scripts/core.js"/>"></script>
	<script src="<c:url value="/resources/vendors/scripts/script.min.js"/>"></script>
	<script src="<c:url value="/resources/vendors/scripts/process.js"/>"></script>
	<script src="<c:url value="/resources/vendors/scripts/layout-settings.js"/>"></script>
        
        <script src="<c:url value="/resources/src/plugins/jquery-steps/jquery.steps.js"/>"></script>
        <script src="<c:url value="/resources/vendors/scripts/steps-setting.js"/>"></script>
</body>

</html>
