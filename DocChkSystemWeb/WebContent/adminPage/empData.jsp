<!-- 測試完成 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.*"  %>
<!DOCTYPE html>

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
%>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>員工資料維護-新增</title>
	<link rel="stylesheet" href="../css/input_button_g.css">
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
	padding-right:15px;
	background:#0dadb7;
	color:white;
    font-family: 微軟正黑體;
    text-align:left;
	}
.table-body{
	width:100%;
	height:auto !important;
	height:500px;
	max-height:500px;
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
	width:125px;
}
.table-head th:nth-child(3),.table-body td:nth-child(3)
{
	width:125px;
}
.table-head th:nth-child(4),.table-body td:nth-child(4)
{
	width:125px;
}
.table-head th:nth-child(5),.table-body td:nth-child(5)
{
	width:125px;
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
.tdselect{
	text-align: left;
}
#delete{
	text-align: left;
	background:#0dadb7;
	padding: 6px;
}
#delete button{
	margin: 0px 10px;
}
#delete a{
	text-decoration: none;
	color:white;
	display:block;
    width:72px;
    height:20px;
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
</style>
</head>

<script type="text/javascript">    
    function ShowPage( Emp_No )
    {
        document.location.href="empEdit.jsp?Emp_No=" + Emp_No ;
    }
</script>

<body>

<% 
    EmpolyeeDAOImpl impl = new EmpolyeeDAOImpl();
    ArrayList <Empolyee> R = impl.getAll(); 
%>

<div id="table-warp">
<form action="" method="">
    <div class="table-head">
    	<div class="title">員工基本資料維護</div>
	    <table id="table-h">
	        <thead>
				<th id="Id">編號</th>
				<th id="Name">姓名</th>
				<th id="InD">到職日</th>
				<th id="Depart">Depart</th>
				<!-- <th id="Title">職階</th>  -->
				<th id="BossPosId">直屬主管</th>
	        </thead>
	    </table>
    </div>
    <div class="table-body">
	    <table id="table-b">
	        <tbody>
	            <!--更改下面-->
	            <%
	            Document_PositionDAOImpl Posimpl=new Document_PositionDAOImpl();
	            
	            String TitleStr;
	            
	            for(int i=0 ; i<R.size() ; i++) 
	            { 
	            	Empolyee r = R.get(i);  
	            	
	            	String funcStr = "\"ShowPage(" + r.getNo() + ")\"";
	            	
	            	TitleStr = Posimpl.getPosDataFromPosId( r.getBossPosId() ).getPosTitle();
	            %>
	            	<tr onclick=<%= funcStr %> >
						<td headers="Id"><% out.print(r.getId()); %></td>
						<td headers="Name"><% out.print(r.getName()); %></td>
						<td headers="InD"><% out.print(r.getInD()); %></td>
						<td headers="Depart"><% out.print(r.getDepart()); %></td>
						<!-- <td headers="Title"><% out.print(r.getTitle()); %></td> -->
						<td headers="BossPosId"><% out.print(TitleStr); %></td>
	            	</tr>
	            <% } %>
	        </tbody> 
	    </table>
    </div>
	    <div id="delete" align="left">
	    	<button type="button" class="input_button_g"><a href="empAddUi.jsp" >新增</a>
	    </div>
</form>
</div>
</body>
</html>