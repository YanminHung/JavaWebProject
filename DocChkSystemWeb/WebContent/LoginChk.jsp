<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

<%
    String emplid = request.getParameter("emplid");
    String password = request.getParameter("password");
    
    EmpolyeeDAOImpl impl = new EmpolyeeDAOImpl();
    String DbPwd = impl.GetLoginPwd( emplid );
    Empolyee m = impl.findById(emplid);
    
    if ( DbPwd != null )
    {
        if( password.equals( DbPwd ) )
        {
            session.setAttribute("Empolyee", m);
            /*
            if( emplid.equals( "Admin" ) )
            {
                session.setAttribute( "Login", "administrator" );
                session.setAttribute( "Personnel", emplid );
                response.sendRedirect( "SystemUsePage.jsp" );
            }
            else*/
            {
                session.setAttribute( "Login", "Employee" );
                session.setAttribute( "Personnel", emplid );
                response.sendRedirect( "EmpUsePage.jsp" );
            }
        }
        else
        {
            response.sendRedirect("login.jsp?msg=1");
        }
    }
    else
    {
        if( emplid.equals( "Admin" ) && password.equals( "123456" ) )
        {
            session.setAttribute( "Login", "administrator" );
            session.setAttribute( "Personnel", emplid );
            response.sendRedirect( "SystemUsePage.jsp" );
        }
        else
        {
            response.sendRedirect("login.jsp?msg=2");
        }
    }
%>

</body>
</html>