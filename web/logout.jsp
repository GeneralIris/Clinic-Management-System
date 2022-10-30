<%
    if(session.getAttribute("EmployeeObject")==null){
        response.sendRedirect("login_emp.jsp");
    }
    else{
        session.invalidate();
        response.sendRedirect("login_emp.jsp");
    }
    
%>