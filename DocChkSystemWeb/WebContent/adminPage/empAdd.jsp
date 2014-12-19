<!-- 可輸入中文-不亂碼-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
<%
	request.setCharacterEncoding( "UTF-8" ) ; 
	Empolyee rs = new Empolyee();
	rs.setId(request.getParameter("Id"));
	rs.setPwd(request.getParameter("Pwd"));
	rs.setName(request.getParameter("Name"));
	rs.setBirthD(request.getParameter("BirthD"));
	rs.setEmail(request.getParameter("Email"));
	rs.setTel(request.getParameter("Tel"));
	rs.setCellPhone(request.getParameter("CellPhone"));
	rs.setAddr(request.getParameter("Addr"));
	rs.setInD(request.getParameter("InD"));
	rs.setTitle(Integer.valueOf(request.getParameter("Title")));
	rs.setDepart(request.getParameter("Depart"));
	rs.setBossPosId(Integer.valueOf(request.getParameter("BossPosId")));
	int i=Integer.valueOf( request.getParameter("msg") );
	
	
	if (i==1){
	    rs.setOutD(request.getParameter("OutD"));
	    EmpolyeeDAOImpl impl = new EmpolyeeDAOImpl();
	    int No=Integer.valueOf( request.getParameter("Emp_No"));
	    out.print(No);
		impl.update(rs,No);
	}
	
	else{
		EmpolyeeDAOImpl impl = new EmpolyeeDAOImpl();
		impl.add(rs);
	}
	response.sendRedirect("empData.jsp");
%>

</body>
</html>