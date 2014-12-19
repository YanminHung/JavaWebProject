<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8" import="DocChkDbAccess.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>change Password</title>
</head>

<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if (!login.equals("Employee"))
{
    response.sendRedirect("login.jsp");
}

request.setCharacterEncoding("utf-8");
Empolyee m =( Empolyee) session.getAttribute("Empolyee");
EmpolyeeDAOImpl imp2 = new EmpolyeeDAOImpl();
request.setCharacterEncoding("utf-8");

int result = 0;

if (m.getPwd().equals(request.getParameter("pw")))
{     
    if (request.getParameter("pw1").equals(request.getParameter("pw2")))
    {
        m.setPwd(request.getParameter("pw1"));
//        out.print(request.getParameter("pw1"));
        imp2.update(m,m.getNo());
        
        result = 1;
    }
    
}
//response.sendRedirect("funcPage/PersonnelMainPage.jsp");
%>

<script type="text/javascript">    
    function ReloadPage( result )
    {
        if( result == 0 )
        {
            alert( "密碼修改錯誤" );
        }
        else if( result == 1 )
        {
        	alert( "密碼修改成功" );
        }
        
        document.location.href="funcPage/PersonnelMainPage.jsp";
    }
    
</script>

<%
   String onLoadStr = "ReloadPage(" + result + ")";
%>

<body onLoad=<% out.print( "\"" + onLoadStr + "\"" ); %> >


<body>

</body>