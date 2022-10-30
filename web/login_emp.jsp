
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
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
					<li><a href="register_emp.jsp">Register</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
                                    <img src="<c:url value="/resources/vendors/images/login-page-img.png"/>" alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">Login To CMS System</h2>
						</div>
						<form action="login_empServlet2" method="post">
                                                        
							
							<div class="input-group custom">
								<input type="text" name="n" class="form-control form-control-lg" autocomplete="off"placeholder="Username">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input type="password" name="p" class="form-control form-control-lg" placeholder="**********">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							<div class="row pb-30">
								<c:if test="${not empty e}">
                                                                    <p><h2>Error!</h2>
                                                                        <font color='red'>Please correct the following errors:
                                                                            <ul>
                                                                                <c:forEach var="message" items="${e}">
                                                                                    <li>${message}</li>
                                                                                </c:forEach>
                                                                            </ul>
                                                                        </font>
                                                                     </p>
                                                                </c:if>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										
                                                                            <input type="submit" class="btn btn-primary btn-lg btn-block" value="Sign In">
									</div>
									<div class="font-16 weight-600 pt-10 pb-10 text-center" data-color="#707373">OR</div>
									<div class="input-group mb-0">
										<a class="btn btn-outline-primary btn-lg btn-block" href="register_emp.jsp">Register To Create Account</a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="<c:url value="/resources/vendors/scripts/core.js"/>"></script>
	<script src="<c:url value="/resources/vendors/scripts/script.min.js"/>"></script>
	<script src="<c:url value="/resources/vendors/scripts/process.js"/>"></script>
	<script src="<c:url value="/resources/vendors/scripts/layout-settings.js"/>"></script>
</body>
</html>
