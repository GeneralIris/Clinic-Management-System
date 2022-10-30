
<!-- header-->
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.0/dist/sweetalert2.all.min.js"></script>
</head>
<body>
	<!-- FOR 1ST ENTRY PLS PUT SESSION HANDLER TO AVOID LOADER ALWAYS RUN-->
        
        <% if(session.getAttribute("loop")==null){%>
	<div class="pre-loader" style="background: #0C2340;">
		<div class="pre-loader-box">
                    <div class="loader-logo"><img src="<c:url value="/resources/src/images/loader/loader.jpeg"/>" alt=""></div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text" style="color:white;">
				Look at me goooo
			</div>
		</div>
	</div>
        <%
             session.setAttribute("loop",1);
            }
            
        %>
	<div class="header">
		<div class="header-left">
			<div class="menu-icon dw dw-menu"></div>
			<div class="header-search"><b>Clinic Management System's [CMS] Dashboard - DeskApp</b></div>
		</div>
		<div class="header-right">
			<div class="user-info-dropdown">
				<a class="dropdown-toggle no-arrow" >
					<span class="user-icon">
                                            <img src="<c:url value="/resources/vendors/images/photo1.jpg"/>" alt="">
					</span>
                                            <span class="user-name UserName"></span>
				</a>
			</div>
			<div class="github-link">
                            <img src="<c:url value="/resources/vendors/images/github.svg"/>" alt=""></a>
			</div>
		</div>
	</div>

	<div class="left-side-bar">
		<div class="brand-logo">
			<a href="DoctorList.jsp">
                            <img src="<c:url value="/resources/vendors/images/deskapp-logo.svg"/>" alt="" class="dark-logo">
                            <img src="<c:url value="/resources/vendors/images/deskapp-logo-white.svg"/>" alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>

		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li class="dropdown num1"><!--show-->
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-edit2"></span><span class="mtext">Patient</span>
						</a>
						<ul class="submenu num1submenu"> <!-- style diplay : block -->
							<li><a class="num1sub1" href="AddPatient.jsp">Add Patient</a></li> <!-- class="active"-->
						</ul>
					</li>
                                        <li class="dropdown num3"><!--show-->
						<a href="javascript:;" class="dropdown-toggle ">
							<span class="micon dw dw-edit3"></span><span class="mtext">Doctor</span>
						</a>
						<ul class="submenu num3submenu"> <!-- style diplay : block -->
							<li><a class="num3sub1" href="addDoctor.jsp">Add Doctor</a></li> <!-- class="active"-->
						</ul>
					</li>
					<li class="dropdown num2">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-library"></span><span class="mtext">Appointment</span>
						</a>
						<ul class="submenu num2submenu">
							<li><a class="num2sub1" href="AddAppointmentForm.jsp">Add Appointment</a></li>
							<li><a  class="num2sub2" href="AppointmentList.jsp">Update Appointment</a></li>
						</ul>
					</li>
                                        
					<li>
						<a href="GenerateInvoiceList2.jsp" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-calendar1"></span><span class="mtext">Generate Bill</span>
						</a>
					</li>

					<li>
						<div class="dropdown-divider"></div>
					</li>
					<li>
						<div class="sidebar-small-cap">Extra</div>
					</li>
					<li>
						<a href="logout.jsp" target="" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-right-arrow1"></span>
							<span class="mtext">Logout</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="mobile-menu-overlay"></div>