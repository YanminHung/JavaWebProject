<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.*" %>

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

request.setCharacterEncoding("utf-8");

Document_PositionDAOImpl posImpl = new Document_PositionDAOImpl();

ArrayList<Document_Position> posList = posImpl.getAll();

ArrayList<Empolyee> EmpList = new ArrayList<Empolyee>();

for( Document_Position o : posList )
{
    Empolyee tmp = new Empolyee();
    
    tmp.setName( "NoData" );
    tmp.setId( "NoData" );
    
    Empolyee emp = new EmpolyeeDAOImpl().findByNo( o.getEmpolyeeID() );
    
    if( emp != null ) tmp = emp;
    
    EmpList.add( tmp );
}

//ArrayList<Empolyee> empSearchList = null;
//session.setAttribute( "empSearchList", empSearchList );

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公司職位維護</title>
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/input_button_g.css">
<style>
*{
    margin:0px 0px;
    padding:0px 0px;
    }
#table-warp{
    width:824px;
    height: 589px;
    margin:6px auto;
    text-align:center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    position: relative;
    background:#e9e9e9;
    }
#table-h_2{
    width:400px;
    background-color:#43464c;
    color:white;
    font-family: 微軟正黑體;
    text-align:center;
    }
#table-h_2 tr td{
    padding:6px;
}
.table-head{
    padding-right:15px;
    background:#0dadb7;
    color:white;
    font-family: 微軟正黑體;
    text-align:left;
    }
.table-body{
    width:100%; 
    height:509px;
    overflow-y:scroll;
    text-align:left;
    background:#e9e9e9;
    font-family: 微軟正黑體;
    font-size: 16px;
    }
.table-head th:first-of-type,.table-body td:first-of-type{
    width:100px;
}
.table-head th:nth-child(2),.table-body td:nth-child(2)
{
    width:150px;
}
.table-head th:last-of-type,.table-body td:last-of-type
{
    width:150px;
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
#delete{
    text-align: right;
    background:#0dadb7;
    padding: 6px;
}
a{
    text-decoration: none;
    color:white;
    display: inline-block;
    width: 92px;
}
.bar{
float: left;
width: 160px;
height: 31px;
padding: 4px 7px;
border: 1px solid #58C3E5;
border-radius: 2px 0 0 2px;
background-color: #fbfbfb;
margin: 0 0 0 20px;
font-family: 微軟正黑體;
}
.sbutton{
float: left;
width: 50px;
height: 31px;
padding: 0 12px;
border-radius: 0 2px 2px 0;
border: 1px solid #58C3E5;
background-color: #58C3E5;
cursor: pointer;
font-size: 12px;
color: #f3f7fc;
font-family: 微軟正黑體;
}
#right{
    display: inline-block;
    width: 400px;
    vertical-align: top;
}
#left{
    display: inline-block;
    margin-right:20px; 
    width: 400px;
    height: 500px;
    vertical-align: top;
}
#table-b tr:hover{
    background: gray;
    color: white;
    }
</style>
</head>

<script type="text/javascript">
function ifram_subflowRefresh( PosTitle, EmpName, EmpID )
{
    var iframeElement = document.getElementById("posEditFrame");
    
    var str = "positionEdit.jsp?PosTitle=" + PosTitle +
              "&EmpName=" + EmpName +
              "&EmpID=" + EmpID;
    
    iframeElement.src = str;
}

function ReloadPage()
{
    window.location.reload();
}
</script>

<body>
<div id="table-warp">
    <div id="left">
        <form action="addNewPos.jsp" method="post" onsubmit="confirm( '請確認新增?' )" >
            <table id="table-h_2">
                <tr>
                    <td>新增職位</td>
                    <td colspan="2">
                    <input type="search" name="titleName" placeholder="新增職位" class="bar" required>
                    <input type="submit" value="新增" class="sbutton">
                    </td>
                </tr>
            </table>
            <div class="table-head">
                <table id="table-h">
                    <thead>
                        <th>職位名稱</th>
                        <th>員工編號</th>
                        <th>員工姓名</th>
                    </thead>
                </table>
            </div>
            <div class="table-body">
                <table id="table-b">
                    <tbody>
                        <!--更改下面-->
                        <%
                        int index = 0;
                        
                        for( Document_Position o : posList )
                        {
                            String iframStr = "\"ifram_subflowRefresh('" +
                                              o.getPosTitle() + "','" +
                                              EmpList.get( index ).getName() + "','" +
                                              EmpList.get( index ).getId() +"')\"";
                        %>
                        <tr onclick=<%= iframStr %>  >
                            <td><%= o.getPosTitle() %></td>
                            <td><%= EmpList.get( index ).getId() %></td>
                            <td><%= EmpList.get( index ).getName() %></td>
                        </tr>
                        <%
                            index++;
                        }
                        
                        %>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
    <div id="right">
            <iframe id="posEditFrame" name="posEditFrame" width="100%" height="600" src="positionEdit.jsp" frameborder="0" scrolling="no"></iframe>
    </div>
</div>
</body>
</html>