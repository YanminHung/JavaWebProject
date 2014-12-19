<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
String login = null;

if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if (!login.equals("administrator"))
{
    response.sendRedirect("../login.jsp");
}

Document_PositionDAOImpl impl = new Document_PositionDAOImpl();

request.setCharacterEncoding("utf-8");
String TitleName = request.getParameter("titleName");


out.println( TitleName );

int result = 1;

if( TitleName != null )
{
    result = impl.addNewTitle( TitleName );
}

out.println( result );

%>

<script type="text/javascript">    
    function ReloadPage( result )
    {
        if( result == 0 )
        {
            alert( "新增職階錯誤" );
        }
        else
        {
        	alert( "新增成功" );
        }
        document.location.href="positionData.jsp";
    }
    
</script>

<%
   String onLoadStr = "\"ReloadPage(" + result + ")\"";
%>

<body onLoad=<%= onLoadStr %> >


<body>

</body>
</html>