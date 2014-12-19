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

Document_FlowTypeDAOImpl impl = new Document_FlowTypeDAOImpl();

request.setCharacterEncoding("utf-8");
String oldflowname = request.getParameter("oldflowname");
String flowname = request.getParameter("flowname");
String radio = request.getParameter("radio");

out.println( oldflowname + flowname + radio );

if( radio != null && oldflowname != null )
{
    if( radio.equals("Enable") )
    {
        impl.enableFlowType( oldflowname );
        //out.println( "Enable" );
    }
    else
    {
        impl.disableFlowType( oldflowname );
        //out.println( "Disable" );
    }
}

int result = 1;

if( flowname != null && oldflowname != null && !oldflowname.equals(flowname)  )
{
    result = impl.updateFlowTypeName( oldflowname, flowname );
    
    //out.println( "GG" );
}

%>

<script type="text/javascript">    
    function ReloadPage( result )
    {
    	if( result == 0 )
        {
    		alert( "流程名稱重複" );
        }
        parent.ReloadPage();
    }
    
</script>

<%
   String onLoadStr = "ReloadPage(" + result + ")";
%>

<body onLoad=<% out.print( "\"" + onLoadStr + "\"" ); %> >

</body>
</html>