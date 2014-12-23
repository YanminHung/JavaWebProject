<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.ArrayList"%>
<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if (!login.equals("Employee"))
{
    response.sendRedirect("../login.jsp");
}
%>

<%
String TempNo = request.getParameter("Proc_TempNo");
//findByDocDetailPk
int TmpNo = Integer.valueOf(TempNo);
DocProcessDAODBImpl impl = new DocProcessDAODBImpl();
ArrayList<DocProcess> rs = impl.findByDocDetailPk(TmpNo);
EmpolyeeDAOImpl implEmp = new EmpolyeeDAOImpl();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文件簽核系統-簽核明細</title>
    <link rel="stylesheet" href="../css/iconmoon.css">
<style>
*{
    margin:0px 0px;
    padding:0px 0px;
    }
#table-warp{
    width:450px;
    height:auto !important;
    height: 250px;
    max-height: 250px;
    margin:0px auto;
    text-align:center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);  
    }
.title{
    width: 438px;
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
    height:150px;
    max-height:150px;
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
    width:125px;
    text-align: center;
}
.table-head th:nth-child(3),.table-body td:nth-child(3)
{
    width:100px;
}
.table-head th:last-of-type,.table-body td:last-of-type
{
    width:175px;
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
.icon-back_1{/*退回*/
    color:#d81e06;
    font-size: 22px;
}
.icon-pendover_1{/*審核完*/
    color:#0e932e;
    font-size: 22px;
}
.icon-pend_1{/*未審核*/
    color:#33475f;
    font-size: 22px;
}
.icon-pending_1{/*審核中*/
    color:#ea8010;
    font-size: 22px;
}
.icon-back_2{/*退回*/
    color:#d81e06;
    font-size: 22px;
}
.icon-pendover_2{/*審核完*/
    color:#0e932e;
    font-size: 22px;
}
.icon-pend_2{/*未審核*/
    color:#33475f;
    font-size: 22px;
}
.icon-pending_2{/*審核中*/
    color:#ea8010;
    font-size: 22px;
}
</style>
</head>
<body>
<div id="table-warp">
<form action="" method="post">
    <div class="table-head">
        <div class="title">簽核明細</div>
        <table id="table-h">
            <thead>
                <tr>
                <th>No</th>
                <th>簽核主管</th>
                <th>狀態</th>
                <th>審核時間</th>
                </tr>
            </thead>
        </table>
    </div>
    <div class="table-body">
        <table id="table-b">
            <tbody>
                <!--更改下面-->
                <%
                int index = 1;
                for (DocProcess o:rs ){ %>
                <tr>
                    <td><% out.print( index++ ); %></td>
                    <td>
                    <% 
                    int No = o.getProc_Emp_Id();
                    Empolyee m = implEmp.findByNo(No);
                    out.print(m.getName());
                    %></td>
                    <td>
                    <% 
                    int Proc_BO = o.getProc_BreakOff();
                    String status="";
                    /*
                    if( o.getProc_CheckD() != null ){
                        if(Proc_BO==0){status="已審核";}
                        else if(Proc_BO==1){status="退件";}
                    }else{status="未審核";}
                    out.print(status);
                    */
                    if( o.getProc_CheckD() != null ){
                        if(Proc_BO==0){status="\"icon-pendover_1\"";}
                        else if(Proc_BO==1){status="\"icon-back_1\"";}
                    }else{status="\"icon-pend_1\"";}
                    %><span class = <%=status %>></span></td>
                    <td><%
                    if( o.getProc_CheckD() != null )
                    {
                        out.print(o.getProc_CheckD().substring(0,16));
                    }
                    %></td>
                    
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</form>
</div>
</body>
</html>