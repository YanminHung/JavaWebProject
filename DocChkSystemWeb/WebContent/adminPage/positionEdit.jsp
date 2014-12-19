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

String PosTitle = request.getParameter("PosTitle");
String EmpName = request.getParameter("EmpName");
String EmpID = request.getParameter("EmpID");
String EmpNameSearch = request.getParameter("EmpNameSearch");
String posEditSubmit = request.getParameter("posEditSubmit");

if( PosTitle == null ) PosTitle = "NULL";
if( EmpName == null ) EmpName = "NULL";
if( EmpID == null ) EmpID = "NULL";

ArrayList<Empolyee> EmpList = null;
EmpolyeeDAOImpl impl = new EmpolyeeDAOImpl();
/*
out.print( EmpID + " - " );

if( ( posEditSubmit != null ))
{
    out.print( posEditSubmit + " - " );
}
*/
Document_PositionDAOImpl posImpl = new Document_PositionDAOImpl();

int isUpdataDb = 0;

if( ( posEditSubmit != null && posEditSubmit.equals("變更") ) &&
    ( !PosTitle.equals( "NULL" ) ) && ( !EmpID.equals( "NULL" ) ) )
{
    out.print( "GGG" );
    EmpolyeeDAOImpl empImpl = new EmpolyeeDAOImpl();
    Empolyee emp = empImpl.findById( EmpID );
    int result = posImpl.updatePosEmpId(PosTitle, emp.getNo() );
    
    isUpdataDb = ( result == 1 ) ? 1 : 2;
}
else
{
//    out.print( "EEE" );
	if( ( posEditSubmit != null && posEditSubmit.equals("全部列出") ) &&
	    !PosTitle.equals("NULL") )
	{
	//    out.print( "getAllWork - " );
	    EmpNameSearch = "";
	    EmpList = impl.getAllWork();
	}
	else if( EmpNameSearch != null && EmpNameSearch != "" )
	{
	//    out.print( "getAll - " + EmpNameSearch + " - " );
	    EmpList = impl.findByName( "%" + EmpNameSearch + "%" );
	}
}

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公司職位維護</title>
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/input_button_b.css">
    <link rel="stylesheet" href="../css/input_button_g.css">
<style>
*{
    margin:0px 0px;
    padding:0px 0px;
    }
#table-warp{
    width:400px;
    margin:0px auto;
    text-align:center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
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
    height:391px;
    overflow-y:scroll;
    text-align:left;
    background:#e9e9e9;
    font-family: 微軟正黑體;
    font-size: 16px;
    }
#table-h_3{
    width:400px;
    background-color:#466278;
    color:white;
    font-family: 微軟正黑體;
    text-align:center;
    }
#table-h_2 tr td{
    padding:6px;
}
#table-h_2{
    width:400px;
    background-color:#43464c;
    color:white;
    font-family: 微軟正黑體;
    text-align:center;
    }
#table-h_2 tr td{
    padding:5px;
}
#table-h{
    text-align: center;
}
.table-head th:first-of-type{
    width:100px;
}
.table-head th:last-of-type{
    width:300px;
}
.table-body td:first-of-type{
    width:200px;
}
.table-body td:last-of-type{
    width:200px;
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
a{
    text-decoration: none;
    color:white;
    display: inline-block;
    width: 92px;
}
a:active{
    color:#a7f9cf;
}
#delete{
    text-align: right;
    background:#0dadb7;
    padding: 6px;
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
}
.text{
width: 160px;
height:22px;
border: 1px solid #58C3E5;
border-radius: 2px 0 0 2px;
background-color: #fbfbfb;
margin: 0 0 0 20px;
}
#table-b tr:hover{
    background: gray;
    color: white;
    }
</style>
</head>

<script type="text/javascript">
function changePos( EmpName, EmpID )
{
    var EmpNameElement = document.getElementById("EmpName");
    
    var EmpIDElement = document.getElementById("EmpID");
    
    EmpNameElement.value = EmpName;
    
    EmpIDElement.value = EmpID;
}

function doSearchSubmit( str ){
//	alert( "doSearchSubmit" + str );
	document.getElementById('EmpName').disabled=false;
	document.getElementById('posEmpSearchForm').action="positionEdit.jsp?posEditSubmit=" + str;
    document.getElementById("posEmpSearchForm").submit();
}
 
function doUpdateSubmit( str ){
//	alert( "doUpdateSubmit" );
    if( confirm( "請確認修改?" ) ){
    	document.getElementById('EmpName').disabled=false;
    	document.getElementById('posEmpSearchForm').action="positionEdit.jsp?posEditSubmit=" + str;
        document.forms["posEmpSearchForm"].submit();
    }else{
        return false;
    }
}

function ReloadPage( isReload )
{
    if( isReload != 0 )
    {
        if( isReload == 2) alert( "人員變更錯誤" );
        
    	parent.ReloadPage();
    }
    
}

</script>

<%
   String onLoadStr = "\"ReloadPage(" + isUpdataDb + ")\"";
%>

<body onLoad=<%=onLoadStr %> >
<form id = "posEmpSearchForm" action="positionEdit.jsp" method="post" >
<!-- 2014/12/17 Add Start -->
    <table id="table-h_3">
        <tr>
            <td>職務名稱</td>
            <td colspan="2">
                <input type="text" id="PosTitle" name="PosTitle" value="<%=PosTitle %>" class="text">
            </td>
       </tr>
       <tr>     
            <td>職務人員</td>
            <td colspan="2">
                <input type="text" id="EmpName" name="EmpName" value="<%=EmpName %>" disabled="disabled" class="text" >
                <input type="hidden" id="EmpID" name="EmpID" value="<%=EmpID %>"  >
            </td>
        </tr>
    </table>    
<!-- 2014/12/17 Add End -->
    <table id="table-h_2">
        <tr>
            <td>搜索人員</td>
            <td colspan="2">
            <input type="search" id="EmpNameSearch" name="EmpNameSearch" placeholder="員工姓名" class="bar" <% if( EmpNameSearch != null && EmpNameSearch != "" ) {%> value=<%=EmpNameSearch %> <%} %> >
            <input type="button" value="搜索" name="posEditSubmit" class="sbutton" onclick="doSearchSubmit('搜索');" >
            <input type="button" value="全部列出" name="posEditSubmit" class="input_button_b" onclick="doSearchSubmit('全部列出');" >
            </td>
        </tr>
    </table>
    <div class="table-head">
        <table id="table-h">
            <thead>
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
                if( EmpList != null )
                {
                    for( Empolyee o : EmpList )
                    {
                        String funcStr = "\"changePos('" +
                                         o.getName() + "','" +
                                         o.getId() + "')\"";
                
                %>
                <tr onclick=<%=funcStr %> >
                    <td><%=o.getId() %></td>
                    <td><%=o.getName() %></td>
                </tr>
                <%
                    }
                }
                else
                {
                %>
                <tr>
                    <td colspan="2" >查無資料</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
        
    <div id="delete">
        <input type="button" value="變更" name="posEditSubmit" class="input_button_g" onclick="doUpdateSubmit('變更');"></a>
    </div>
</form>

</body>
</html>