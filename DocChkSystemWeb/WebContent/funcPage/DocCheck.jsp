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
    DocLibraryDAODBImpl libimpl = new DocLibraryDAODBImpl();
    DetailDAOImpl docimpl = new DetailDAOImpl();
    
	if( submit.equals("簽核") )
	{
        impl.AddCheckD( docDetail.getDou_No() );
        impl.updateCheckFlag( docDetail.getDou_No() );
        // 完成最後簽核
	    if ( impl.checkIsFinish( docDetail.getDou_No())==1 )
	    {
	    	int topflag=0;
	    	if ( docDetail.getDou_Type()==1 )
	    	{
	    		topflag=1;
	    	}
	    	//out.print(docDetail.getDou_No());
	    	libimpl.add(new DocLibrary(docDetail.getDou_No(),topflag),
	    	            docDetail.getDou_Type());	
	    	docimpl.updateStatusFlag(docDetail.getDou_No(), 1);
	    } 
    }
	else if( submit.equals("退回") )
	{
	    impl.updateBreakOff( docDetail.getDou_No() );
        docimpl.updateStatusFlag(docDetail.getDou_No(), 2);
	}
}

response.sendRedirect("PersonnelMainPage.jsp");

%>

<body>

</body>
</html>