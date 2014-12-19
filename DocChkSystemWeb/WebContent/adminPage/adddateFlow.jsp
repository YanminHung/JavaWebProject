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

String flowname = request.getParameter("flowname");
String radio = request.getParameter("radio");
String[] posId = request.getParameterValues("leftop"); 

int status = radio.equals("Enable") ? Document_FlowType.Enable : Document_FlowType.Disable;

out.println( flowname + radio );

for( String o : posId )
{
    out.println( o + " " );
}

Document_FlowType newFlow  = new Document_FlowType( flowname, posId.length, status );

int result = 1;

result = impl.add( newFlow );

if( result != 0 )
{
    newFlow = impl.getFlowType( flowname );
    
    Document_FlowSeq[] flowSeq = new Document_FlowSeq[ posId.length ];
    
    for( int i = 0; i < posId.length; i++ )
    {
        flowSeq[ i ] = new Document_FlowSeq( newFlow.getFlowType(),
                                             i + 1,
                                             (int)Integer.valueOf( posId[ i ] ) );
    }
    
    Document_FlowSeqDAOImpl flowSeqImpl = new Document_FlowSeqDAOImpl();
    
    result = flowSeqImpl.add( flowSeq );
    
}

%>

<script type="text/javascript">    
    function ReloadPage( result )
    {
    	if( result == 0 )
        {
    		alert( "新增流程錯誤" );
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