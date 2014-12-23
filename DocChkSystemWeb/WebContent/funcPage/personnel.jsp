<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.ArrayList" %>
<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if ( ( !login.equals("administrator") ) && ( !login.equals("Employee") ) )
{
    response.sendRedirect("../login.jsp");
}

Empolyee m =( Empolyee) session.getAttribute("Empolyee");

if( m == null )
    response.sendRedirect("../login.jsp");

ArrayList<DocProcess> chkDocList = new DocProcessDAODBImpl().findByReadyCheck( m.getNo() );

DetailDAOImpl impl = new DetailDAOImpl();

ArrayList<Document_Detail> chkDocDetailList = new ArrayList<Document_Detail>();

for( DocProcess o : chkDocList ) 
{
    chkDocDetailList.add( impl.searchNo( o.getProc_TmpNo() ) );
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/iconmoon.css">
    <meta charset="UTF-8">
    <title>個人事務</title>
<style>
*{
    margin:0px 0px;
    padding:0px 0px;
    }
#table-warp{
    width:800px;
    margin:6px auto;
    text-align:center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    }
.title{
    width: 788px;
    background:#43464c;
    color:white;
    font-family: 微軟正黑體;
    text-align:center;
    font-size: 22px;
    padding: 6px;
}
.table-head{
    padding-right:17px;
    background:#0dadb7;
    color:white;
    font-family: 微軟正黑體;
    text-align:left;
    }
.table-body{
    width:100%; 
    height:auto !important;
    height:270px;
    max-height:270px;
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
    width:50px;
}
.table-head th:nth-child(3),.table-body td:nth-child(3)
{
    width:100px;
}
.table-head th:last-of-type,.table-body td:last-of-type
{
    width:600px;
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
    cursor: pointer;
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
.icon-push_1{
    -webkit-font-smoothing: antialiased;
    -webkit-text-stroke-width: 0.2px;
    color:#ea8010;
    font-size:18px;
    padding-right:6px;
}
.icon-0{
    font-size:22px;
    color:#c11920;
    padding:0px 0px 0px 6px;
}
.icon-1{
    font-size:22px;
    color:#546b7e;
    padding:0px 0px 0px 6px;
}
.icon-2{
    font-size:22px;
    color:#a78b51;
    padding:0px 0px 0px 6px;
}
.icon-gonggao{
    font-size:18px;
    color:#ea8010;
}
.icon-normal{
    font-size:18px;
    color:#43464c;
}
</style>
</head>

<script type="text/javascript">

function changeSubBrowse( Dou_No )
{
	var str = "funcPage/DocCheckUi.jsp?Dou_No=" + Dou_No;
	
	//alert( str );
	
	parent.changeSubBrowse( str );;
}

</script>

<body>
<div id="table-warp">
    <div class="table-head">
        <div class="title">個人待簽事務</div>
        <table id="table-h">
            <thead>
                <tr>
                <th>件速</th>
                <th>類型</th>
                <th>日期</th>
                <th>主旨</th>
                </tr>
            </thead>
        </table>
    </div>
    <div class="table-body">
        <table id="table-b">
            <tbody>
                <!--更改下面-->
                <%
                    if( chkDocDetailList.size() != 0 )
                    {
                        for( Document_Detail o : chkDocDetailList )
                        {
                            String DocSpeedStr = "";
                            switch( o.getDou_Speed())
                            {
                                case 0:
                                    DocSpeedStr = "\"icon-0\"";
                                    break;
                                case 1:
                                    DocSpeedStr = "\"icon-1\"";
                                    break;
                                case 2:
                                default:
                                    DocSpeedStr = "\"icon-2\"";
                                    break;
                            }
                            
                            String DocTypeStr = "";
                            switch( o.getDou_Type())
                            {
                                case 1:
                                    DocTypeStr = "\"icon-gonggao\"";
                                    break;
                                case 2:
                                default:
                                    DocTypeStr = "\"icon-normal\"";
                                    break;
                            }
                            
                            String OnClickStr = "\"changeSubBrowse(" +
                                                o.getDou_No() + ")\"";
                %>
                <tr onclick=<%=OnClickStr %> >
                    <td><span class = <%=DocSpeedStr %> ></span></td>
                    <td><span class = <%=DocTypeStr %> ></span></td>
                    <td><%=o.getDou_Date().substring(0,11) %></td>
                    <td><%=o.getDou_Keynote() %></td>
                </tr>
                <%      }
                    }
                    else
                    {
                %>
                <tr >
                    <td colspan="4" >目前沒有待簽核事項</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>