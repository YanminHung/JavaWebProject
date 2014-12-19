<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.ArrayList" %>
<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if (!login.equals("administrator"))
{
    response.sendRedirect("../login.jsp");
}

Document_FlowTypeDAOImpl impl = new Document_FlowTypeDAOImpl();
ArrayList< Document_FlowType > flowList = impl.getAll();

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文件流程篩選選取</title>
    <script type="text/javascript" src="../js/jquery-1.6.min.js"></script>
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../js/jquery-1.11.1.js"></script>
    <link rel="stylesheet" href="../css/input_button_g.css">
<style>
*{
    margin:0px 0px;
    padding:0px 0px;
    }
#table-warp{
    width:824px;
    margin:6px auto;
    text-align:center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    position: relative;
    background:#e9e9e9;
    }
.table-head{
    padding-right:26px;
    background-color:#0dadb7;
    color:white;
    font-family: 微軟正黑體;
    text-align:left;
    }
.table-body{
    width:100%; 
    height:500px;
    overflow-y:scroll;
    text-align:left;
    background:#e9e9e9;
    font-family: 微軟正黑體;
    font-size: 16px;
    }
.table-head th:first-of-type,.table-body td:first-of-type{
    width:50px;
}
.table-head th:nth-child(2),.table-body td:nth-child(2)
{
    width:90px;
}
.table-head th:last-of-type,.table-body td:last-of-type
{
    width:260px;
}
.table-head table,.table-body table{
    width:100%;
    }
.table-body table tr:nth-child(2n+1){
    background-color:#f6f6f6;
    }
#table-b{
    border-collapse:collapse;
     border: 0px;
    }
#table-h,tr,th{
    border-collapse:collapse;
    border: 0px;
    padding: 6.5px;
    }
#table-b,tr,td{
    border-collapse:collapse;
    border: 0px;
    padding: 6px;
    }
#table-b tr:hover{
    background: gray;
    color: white;
    }
#delete{
    text-align: left;
    background:#0dadb7;
    padding: 6px;
}
#right{
    display: inline-block;
    margin-right:20px; 
    width: 400px;
    vertical-align: top;
}
#left{
    display: inline-block;
    width: 400px;
    height: 500px;
    vertical-align: top;
}
#table-b
{
    cursor: pointer;
}
</style>
</head>

<script type="text/javascript">
    function ifram_subflowRefresh( msg )
    {
        var iframeElement = document.getElementById("subflow");
        iframeElement.src = "subflowPage.jsp?msg=" + msg;
        //alert( msg );
    }
    
    function ifram_subflowAdd( msg )
    {
        var iframeElement = document.getElementById("subflow");
        iframeElement.src = "subflowAddPage.jsp";
    }
    
    function ReloadPage()
    {
        window.location.reload();
    }
</script>


<body>
<div id="table-warp">
    <div id="right">
    <form action="" method="post">
        <div class="table-head">
            <table id="table-h">
                <thead>
                    <th>編號</th>
                    <th>狀態</th>
                    <th>流程名</th>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="table-body">
            <table id="table-b">
                <tbody>
                    <% int index = 1;
                       for( Document_FlowType o : flowList ){
                        String iframStr = "ifram_subflowRefresh('" + o.getFlowName() + "')";
                    %>
                    <tr onclick= <% out.print( "\"" + iframStr + "\""); %> >
                        <td><% out.print( index++ ); %></td>
                        <td><% out.print( o.getFlowEnable()==Document_FlowType.Enable ? "Enable" : "Disable" ); %></td>
                        <td><% out.print( o.getFlowName() );%></td>
                    </tr>
                    <% } %>
                    
                </tbody>
            </table>
        </div>
        <div id="delete">
            <input type="button" value="新增" name='add' class="input_button_g" onclick="ifram_subflowAdd()">
        </div>
    </form>
    </div>
        <div id="left">
            <iframe id = "subflow" name="subflow" width="100%" height="600" src="subflowPage.jsp" frameborder="0" scrolling="no"></iframe>
        </div>
</div>
</body>
</html>