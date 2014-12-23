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
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>版面公告維護-置頂</title>
    <link rel="stylesheet" href="../css/iconmoon.css">
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/input_button_g.css">
<script type="text/javascript"> 
function check_all(obj,cName) 
{ 
    var checkboxs = document.getElementsByName(cName); 
    for(var i=0;i<checkboxs.length;i++){checkboxs[i].checked = obj.checked;} 
} 
</script> 
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
    height:430px;
    max-height:430px;
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
    text-align: left;
    background:#0dadb7;
    padding: 6px;
}
a:hover{
    color:#58C3E5;
}

td a{
    text-decoration: none;
    color:black;
}
td a:hover{
    text-decoration: none;
    color:#58C3E5;
}
#table-b tr:hover{
    background: gray;
    color: white;
}
#table-b
{
    cursor: pointer;
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
	font-size:22px;
	color:#ea8010;
}
.icon-normal{
	font-size:22px;
	color:#43464c;
}
</style>
<script type="text/javascript"> 
function check_all(obj,cName) 
{ 
    var checkboxs = document.getElementsByName(cName); 
    for(var i=0;i<checkboxs.length;i++){checkboxs[i].checked = obj.checked;} 
} 
</script>
<script type="text/javascript"> 
function checkAll(eventInfo) {

    var options = document.getElementsByClassName("checkboxExample2");
    for (var i = 0; i < options.length; i++) {
        options[i].checked = event.srcElement.checked;
    }
}
</script>
<script type="text/javascript">    
    function ShowPage( DocLibNo, Lib_TmpId )
    {
        document.location.href="../funcPage/doc_list.jsp?Lib_TmpId=" + Lib_TmpId +
        		               "&DocLibNo=" + DocLibNo;
    }

</script> 
</head>
<body>
<%             
request.setCharacterEncoding("utf-8");
DocLibraryListDAODBImpl  impl = new DocLibraryListDAODBImpl();
DocLibraryList[] r  = impl.findAnnouncementAll();
%>
<div id="table-warp">
<form action="AnnPushUpEdit.jsp" method="post">
    <div class="table-head">
        <div class="title">版面維護</div> 
        <table id="table-h">
            <thead>
                <tr>
                <th><input type="checkbox" name="allselect" id="allselect" onclick="check_all(this,'select')"/></th>
                <th>狀態</th>
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
                            if( ( r != null ) && ( r.length != 0 ) )
                            {
                            for (int i=0;i<r.length;i++)
                            {    
                            	  String DocLibNo = r[i].getLib_DocNo();
                                  String funcStr = "\"ShowPage('" +DocLibNo + "',"+r[i].getLib_TmpId()+ ")\"";
                                 
                            %>
                            <tr>
                            <td><input type="checkbox" name="chkboxflag" id="chkboxflag" value=<%=r[i].getLib_Id()%> ></td> 
                            <td>
	                        <% 	  
	                         String status = "";
                             if(r[i].getLib_SetTop()==0){status="";}
                             else if(r[i].getLib_SetTop()==1){status="\"icon-push_1\"";}
	                        %>
	                        <span class = <%=status %>></span>
                            </td>
                            <td><%=r[i].getDou_Date().substring(0,11)%></td>
                            <td onclick=<% out.print( funcStr ); %>><%=r[i].getDou_Keynote() %></td>
                            </tr>
                           <%  }
                           }
                            else
                            {
                            %>
                            <tr><td colspan="2" >無公告資料</td></tr> 
                            <%
                            }
                            %>
            </tbody>
        </table>
    </div>
        <div id="delete">
            <input type="submit" value="置頂變更" name='delete' class="input_button_g">
        </div>
</form>
</div>
</body>
</html>