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
    <link rel="stylesheet" href="../css/iconmoon.css">
    <title>文件簽核系統-查詢結果</title>

<script type="text/javascript">    
   /* function ShowPage( Tmp_Id,Dou_No )
    {
        document.location.href="subDetail.jsp?Dou_No=" + Tmp_Id +"&realNo="+ Dou_No;
    }*/
    
    function opnefile( Tmp_Id,Dou_No )
    {
    	str = "subDetail.jsp?Dou_No=" + Tmp_Id +"&realNo="+ Dou_No;
    	var p = window.open( str, "文件內容", config="height=720,width=960" );
        p.focus();
    }

</script>    
<style>
*{
    margin:0px 0px;
    padding:0px 0px;
    }
table#table-b, table#table-h{
    border-spacing:0;
    border-collapse:collapse;
    table-layout:fixed;
    width:1000px;
}
.title{

    background:#43464c;
    color:white;
    font-family: 微軟正黑體;
    text-align:center;
    font-size: 22px;
    padding: 6px;

}
#table-h,tr,th{
    border-collapse:collapse;
    border: 0px;
    padding: 6px;
    }
#table-b,tr,td{
    border-collapse:collapse;
    border: 0px;
    padding: 6px;
        text-overflow:ellipsis;
    -moz-text-overflow: ellipsis;
    }
table#table-b td, table#table-h th{
    overflow:hidden;
    white-space:nowrap;	
}
#table-body table tr:nth-child(2n+1){
    background-color:#f6f6f6;
    }
div#table-head{
    overflow:hidden;
    text-align: left;
    font-size: 18px;
    font-family:微軟正黑體;
    background:#0dadb7;
    color:white;

}
#table-con{
   position:relative;
}
div#table-body{
    width:800px;
    overflow:hidden;
    height:auto !important;
    height:300px;
    max-height:300px;
    text-align: left;
    font-size: 16px;
    font-family:微軟正黑體;
}

#table-warp{
    width:800px;
    margin:6px auto;
    text-align:center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    overflow:hidden;

}

#table-head th:first-of-type,#table-body td:first-of-type{
    width:150px;
}
#table-head th:nth-child(2),#table-body td:nth-child(2)
{
    width:80px;
}
#table-head th:nth-child(3),#table-body td:nth-child(3)
{
    width:80px;
}
#table-head th:nth-child(4),#table-body td:nth-child(4)
{
    width:80px;
}
#table-head th:nth-child(5),#table-body td:nth-child(5)
{
    width:80px;
}
#table-head th:last-of-type,#table-body td:last-of-type
{
    width:330px;
}
#y-fake-scroll{
    overflow-y:scroll; 
    overflow-x:hidden;
    background:transparent; 
    right:0;
    position:absolute;
    max-height:300px;
    top:50px;
}

#x-fake-scroll{
    height:40px;
    margin-top:-23px;
    overflow-x:auto;
    overflow-y:hidden;
    margin-top:expression('0px');/* IE 7 fix*/
    height:expression('17px'); /* IE 7 fix*/
}

#y-scroll{
    max-height:150px;
    overflow-y:auto;
    overflow-x:hidden;
    overflow:scroll;
    width:1000px;
    padding:0px 1px 1px 1px;
}
#table-head
{
    padding:1px 1px 0 1px;
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
<body>
<div id="table-warp">
<div class="title">查詢結果</div>
<form action="" method="post">
<div id="table-con">
    <div id="table-head">
        <table id="table-h">
				<tr>
					<th>查詢編號</th>
					<th>文件類型</th>
					<th>開始日期</th>
					<th>承辦人</th>
					<th>部門</th>
					<th>主旨</th>
				</tr>
        </table>
    </div>
    <div id="table-body">
        <table id="table-b">
                <!--更改下面-->
                <% 
                for(int i=0 ; i<r.length ; i++){
                	String funcStr = "\"opnefile('" +r[i].getLib_DocNo()+ "',"+r[i].getLib_TmpId()+")\"";
				%>
		   		<tr onclick=<% out.print( funcStr ); %>>
                    <td><%out.print(r[i].getLib_DocNo()); %></td>
                    <td>
                    <%
	                String status = "";
                    if(r[i].getDou_Type()==1){status="\"icon-gonggao\"";}
                    else{status="\"icon-normal\"";}
                    //out.print(r[i].getDou_Type());
                    %> 
                    <span class = <%=status %>></span>
                    </td>
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
        </table>
    </div>
</form>
	<div id="y-fake-scroll" >
		<div id="y-table-emulator" style="width:40px;">
		&nbsp;
		</div>
	</div>
	<div id="x-fake-scroll">
		<div id="x-table-emulator">
		&nbsp;
		</div>
	</div>
	<script type="text/javascript" src="../js/script.js"></script>
</div>
</div>
</body>
</html>