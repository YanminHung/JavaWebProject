<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*"%>
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

DocLibraryListDAODBImpl  impl = new DocLibraryListDAODBImpl();
DocLibraryList[] r = impl.findAnnouncementAll();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="../css/iconmoon.css">
    <meta charset="UTF-8">
    <title>公告欄</title>
<style>
*{
    margin:0px 0px;
    padding:0px 0px;
    }
#table-warp{
    width:800px;
    margin:6px auto;
    text-align:center;
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
    background-color:#0dadb7;
    color:white;
    font-family: 微軟正黑體;
    text-align:left;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    }
.table-body{
    width:100%; 
    height:auto !important;
    height:220px;
    max-height:220px;
    overflow-y:scroll;
    text-align:left;
    background:#e9e9e9;
    font-family: 微軟正黑體;
    font-size: 16px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
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
#iframe-con{
        height: 100%;
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
	color:#C0392B;
	padding:0px 0px 0px 6px;
}
.icon-1{
	font-size:22px;
	color:#34495E;
	padding:0px 0px 0px 6px;
}
.icon-2{
	font-size:22px;
	color:#2980B9;
	padding:0px 0px 0px 6px;
}
.icon-gonggao{
	font-size:18px;
	color:#F1C40F;
}
.icon-normal{
	font-size:18px;
	color:#43464c;
}
</style>
</head>

<script type="text/javascript">

function changeSubBrowse( str )
{
	//alert( "atPMP: " + str );
    parent.changeSubBrowse( str );;
}

function ShowPage( DocLibNo, Lib_TmpId )
{
    document.location.href="announcement_list.jsp?Lib_TmpId=" + Lib_TmpId +
                           "&DocLibNo=" + DocLibNo;
}

</script>

<body>
<div id="table-warp">
    <div class="table-head">
        <div class="title">公告</div>
        <table id="table-h">
            <thead>
                <tr>
                <th>件速</th>
                <th>類型</th>
                <th>日期</th> 
                 <th>&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;</th>                 
                <th>&nbsp;&nbsp&nbsp;&nbsp主旨</th>
                </tr>
            </thead>
        </table>
    </div>
    <div class="table-body">
        <table id="table-b">
            <tbody>
                <!--更改下面-->
            <%
            if( r != null )
            {
                for (int i=0;i<r.length;i++)
                {
                    String DocLibNo = r[i].getLib_DocNo();
                    String funcStr = "\"ShowPage('" + DocLibNo + "', " + r[i].getLib_TmpId() + ")\"";
                    %>
                    <tr onclick=<% out.print( funcStr ); %> >
                    <td>
                    <%   
	                String status = "";
                    if(r[i].getDou_Speed()==0){status="\"icon-0\"";}
                    else if(r[i].getDou_Speed()==1){status="\"icon-1\"";}
                    else{status="\"icon-2\"";}
                    //out.print(r[i].getDou_Speed());
                    %>
                    <span class = <%=status %>></span>
                    </td>
                    <td>
                    <%
	                String status2 = "";
                    if(r[i].getDou_Type()==1){status2="\"icon-gonggao\"";}
                    else{status2="\"icon-normal\"";}
                    //out.print(r[i].getDou_Type());
                    %> 
                    <span class = <%=status2 %>></span>
                    </td>    
                    <td>
                    <%  if (r[i].getDou_Date() !=null)
                        {
                            out.print(r[i].getDou_Date().substring(0,11));
                        }
                        else
                        {
                            out.print(" ");
                        }
                    %>
                    </td>
                    <td>
                     <%
	                     String status3 = "" ;
                         if(r[i].getLib_SetTop()==1){status3="\"icon-push_1\"";}
             
                     %> 
                    <i class = <%=status3 %>></i></td><td><%=r[i].getDou_Keynote()%></td>
                </tr>
            <%  }
            }
            else
            {
            %>
                <tr><td colspan="4" >無公告資料</td></tr> 
            <%
            }
            %>
            </tbody>
        </table>
    </div>
    <% if( !login.equals("administrator") ) {%>
    <div id="iframe-con">
        <iframe name="Personnel" width="100%" height="350" src="personnel.jsp" frameborder="0" scrolling="no"></iframe>
    </div>
    <% } %>
</div>
</body>
</html>