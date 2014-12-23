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
%>
<%
	request.setCharacterEncoding( "UTF-8" ) ; 
	
	String LibDocNo 	="%"+request.getParameter("doctype")+"%";
	String DouType 		="%"+request.getParameter("type")+"%";
	String DocKeynote	="%"+request.getParameter("key")+"%";
	String Emp_Name		="%"+request.getParameter("name")+"%";
	String Emp_Depart	="%"+request.getParameter("depart")+"%";
	String Dou_Date_B	=request.getParameter("start");
	String Dou_Date_E	=request.getParameter("end");
	
	
	
	DocLibraryListDAODBImpl impl=new DocLibraryListDAODBImpl();
	DocLibraryList[] r = impl.SearchDocData(LibDocNo, DouType, DocKeynote , Emp_Name , Emp_Depart , Dou_Date_B, Dou_Date_E);
	
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/input_button_g.css">
    <title>文件簽核系統-查詢結果</title>

<script type="text/javascript">    
   /* function ShowPage( Tmp_Id,Dou_No )
    {
        document.location.href="subDetail.jsp?Dou_No=" + Tmp_Id +"&realNo="+ Dou_No;
    }*/
    
    function opnefile( Tmp_Id,Dou_No )
    {
    	str = "subDetail.jsp?Dou_No=" + Tmp_Id +"&realNo="+ Dou_No;
    	window.open( str, "文件內容", config="height=720,width=1024" );
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
    background:#0dadb7;
    color:white;
    font-family: 微軟正黑體;
    text-align:left;
    }
.table-body{
    width:100%; 
    height:auto !important;
    height:300px;
    max-height:300px;
    overflow-y:scroll;
    text-align:left;
    background:#e9e9e9;
    font-family: 微軟正黑體;
    font-size: 16px;
    }
.table-head table,.table-body table{
    width:100%;
    }
.table-head th:first-of-type,.table-body td:first-of-type{
    width:80px;
}
.table-head th:nth-child(2),.table-body td:nth-child(2)
{
    width:80px;
}
.table-head th:nth-child(3),.table-body td:nth-child(3)
{
    width:150px;
}
.table-head th:nth-child(4),.table-body td:nth-child(4)
{
    width:80px;
}
.table-head th:nth-child(5),.table-body td:nth-child(5)
{
    width:80px;
}
.table-head th:last-of-type,.table-body td:last-of-type
{
    width:330px;
}
.table-body table tr:nth-child(2n+1){
    background-color:#f6f6f6;
    }
#table-b{
    border-collapse:collapse;
    border: 0px;
    table-layout: fixed;
    cursor: pointer;
    }
#table-h,tr,th{
    border-collapse:collapse;
    border: 0px;
    padding: 6px 5px 6px 7px;
    }
#table-b,tr,td{
    border-collapse:collapse;
    border: 0px;
    padding: 6px 1px 6px 6px;
    text-overflow:ellipsis;
    -moz-text-overflow: ellipsis;
    white-space:nowrap;
    overflow-x:hidden;
    }
#table-b tr:hover{
	background: gray;
	color: white;
	}
</style>
</head>

<body>
<div id="table-warp">
<form action="" method="">
    <div class="table-head">
        <div class="title">查詢結果</div>
        <table id="table-h">
            <thead>
				<tr>
					<th>查詢編號</th>
					<th>文件類型</th>
					<th>開始日期</th>
					<th>承辦人</th>
					<th>部門</th>
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
                for(int i=0 ; i<r.length ; i++){
                	String funcStr = "\"opnefile('" +r[i].getLib_DocNo()+ "',"+r[i].getLib_TmpId()+")\"";
				%>
		   		<tr onclick=<% out.print( funcStr ); %>>
                    <td><%out.print(r[i].getLib_DocNo()); %></td>
                    <td><%
                    String type="";
                    if(r[i].getDou_Type()==1) type="公告";
                    if(r[i].getDou_Type()==2) type="一般文件";
                    out.print(type); 
                    %></td>
                    <td><%out.print(r[i].getDou_Date().substring(0,11)); %></td>
                    <td><%
                    EmpolyeeDAOImpl Eimpl = new EmpolyeeDAOImpl();
                    Empolyee em = Eimpl.findByNo(r[i].getDou_Author());
                    out.print(em.getName()); 
                    %></td>
                    <td><%out.print(r[i].getEmp_Depart()); %></td>
                    <td><%out.print(r[i].getDou_Keynote()); %></td>
                </tr>
				<% } %>
            </tbody>
        </table>
    </div>
</form>
</div>
</body>
</html>