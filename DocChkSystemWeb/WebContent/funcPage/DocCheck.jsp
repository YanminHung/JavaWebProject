<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if (!login.equals("Employee"))
{
    response.sendRedirect("../login.jsp");
}

request.setCharacterEncoding("utf-8");

String submit = request.getParameter("submit");

if( submit != null )
{
    Document_Detail docDetail = (Document_Detail)session.getAttribute("docDetail");

    DocProcessDAODBImpl impl = new DocProcessDAODBImpl();
    
	if( submit.equals("簽核") )
	{
	    impl.AddCheckD( docDetail.getDou_No() );
	    impl.updateCheckFlag( docDetail.getDou_No() );
	    
	    
	    
	    
	}
	else if( submit.equals("退回") )
	{
	    impl.updateBreakOff( docDetail.getDou_No() );
	}
}

response.sendRedirect("PersonnelMainPage.jsp");

%>

<body>

</body>
</html>