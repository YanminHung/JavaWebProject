<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,org.apache.commons.fileupload.*, org.apache.commons.io.*, org.apache.commons.fileupload.servlet.*, org.apache.commons.fileupload.disk.*, java.io.*, java.util.Iterator, java.util.regex.Pattern , java.text.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    Document_Detail d=new Document_Detail();
    
    String Dou_TmpNo=request.getParameter("Dou_TmpNo");
    int Dou_Type=Integer.valueOf(request.getParameter("Dou_Type"));
    int Dou_Speed=Integer.valueOf(request.getParameter("Dou_Speed"));
    String Dou_Keynote=request.getParameter("Dou_Keynote");
    String Dou_Content=request.getParameter("Dou_Content");
    int name=Integer.valueOf(request.getParameter("name"));
    String Dou_Date=request.getParameter("Dou_Date");
    int Dou_FlowType=Integer.valueOf(request.getParameter("Dou_FlowType"));
    int Status=Integer.valueOf(request.getParameter("Status"));
    int Dou_IsHistoryCheck=Integer.valueOf(request.getParameter("Dou_IsHistoryCheck"));
    String Dou_Link=request.getParameter("Dou_Link");
    int Dou_Draft=Integer.valueOf(request.getParameter("Dou_Draft"));
    
    d.setDou_TmpNo(Dou_TmpNo);
    d.setDou_Type(Dou_Type);
    d.setDou_Speed(Dou_Speed);
    d.setDou_Keynote(Dou_Keynote);
    d.setDou_Content(Dou_Content);
    d.setDou_Author(name);
    d.setDou_Date(Dou_Date);
    d.setDou_Flow(Dou_FlowType);
    d.setStatus(Status);
    d.setDou_IsHistoryCheck(Dou_IsHistoryCheck);
    d.setDou_Link(Dou_Link);
    if(request.getParameter("submit").equals("發送"))
    {    
    	d.setDou_Draft(0);
    }
    if(request.getParameter("submit").equals("暫存"))
    {    
    	d.setDou_Draft(1);
    }
     DetailDAOImpl impl= new DetailDAOImpl();
    impl.add(d);
    response.sendRedirect("PersonnelMainPage.jsp");
%>


</body>
</html>