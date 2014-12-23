<!-- 可輸入中文-不亂碼-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String [] doudel = request.getParameterValues("chkboxflag");              
    DocLibraryDAODBImpl  impl = new DocLibraryDAODBImpl();
    if ( doudel != null )
    {    
        for (String o: doudel)
        {
          	//out.print("aaa");
          	DocLibrary topr=impl.findbyLibTmpId(Integer.valueOf(o));
        	if ( topr != null) 
        	   {
          		impl.updateLibSetTop(Integer.valueOf(o));
        	   }

        }
    }
    response.sendRedirect("AnnPushUp.jsp");
%>
</body>
</html>