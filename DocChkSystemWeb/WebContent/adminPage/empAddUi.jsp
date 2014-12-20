<!-- 測試完成 -->

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
%>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>員工資料維護-編輯</title>
	<link rel="stylesheet" href="../css/buttons_small.css"> 
<style>
*{
	margin:0px 0px;
	padding:0px 0px;
	}
#warp{
	width:100%;
	}
#table-warp{
	width:800px;
	margin:0px auto;
	text-align:center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    position: relative;
	float: left;
	left: 50%;
	margin: 100px -400px;
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
	background:#ea6153;
	color:white;
    font-family: 微軟正黑體;
    text-align:left;
	}
.table-body{
	width:100%; 
	height:350px;
    font-family: 微軟正黑體;
    font-size: 16px;
	}
.table-head th:first-of-type,.table-body td:first-of-type{
	width:150px;
	text-align: right;
}
.table-head th:nth-child(2),.table-body td:nth-child(2)
{
	width:250px;
	text-align: left;
}
.table-head th:nth-child(3),.table-body td:nth-child(3)
{
	width:150px;
	text-align: right;
}
.table-head th:last-of-type,.table-body td:last-of-type
{
	width:250px;
	text-align: left;
}

.table-head table,.table-body table{
	width:100%;
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
	text-align: center;
	padding: 6px;
}
a{
	text-decoration: none;
	color:white;
	display: inline-block;
}
</style>
</head>

<body>

<% 
	//request.setCharacterEncoding("UTF-8") ; 
    EmpolyeeDAOImpl impl = new EmpolyeeDAOImpl();
    ArrayList <Empolyee> R = impl.getAll(); 
%>

<div id="warp">
<div id="table-warp">
<form action="empAdd.jsp?msg=0" method="post">
    <div class="table-head">
    	<div class="title">新增員工基本資料</div>
	    <table id="table-h">
	        <thead>
	        </thead>
	    </table>
    </div>
    <div class="table-body">
    	
	    <table id="table-b">
	        <tbody>
	            <!--更改下面-->
	            <tr>
					<td>員工編號</td>
					<td>
						<input type="text" name="Id" id="" >
					</td>
					<td>員工密碼</td>
					<td>
						<input type="password" name="Pwd" id="">
					</td>
	            </tr>
	            <tr>
					<td>員工姓名</td>
					<td>
						<input type="text" name="Name" >
					</td>
					<!--
					<td>員工性別</td>
					<td>
						<input type="radio" name="sex" id="sex1" value="1">男性
						<input type="radio" name="sex" id="sex2" value="2">女性
					</td>													-->
	            </tr>
	            <tr>
					<td>員工生日</td>
					<td>
						<input type="date" name="BirthD" id="" >
					</td>
					<td>電子郵件</td>
					<td>
						<input type="email" name="Email" id="email" value="" size="30">
					</td>
	            </tr>
	            <tr>
					<td>電話(住家)</td>
					<td>
						<input type="text" name="" id="" size="2" maxlength="5">-<input type="text" name="Tel" id="" size="13" maxlength="20">
					</td>
					<td>電話手機</td>
					<td>
						<input type="text" name="CellPhone" id="CellPhone" value="" size="20" maxlength="20">
					</td>
	            </tr>
	            <tr>
					<td>通訊地址</td>
					<td colspan="3">
						<input type="text" name="Addr" id="" size="50" maxlength="20">
					</td>
	            </tr>
	            <tr>
					<td>員工到職日</td>
					<td>
						<input type="date" name="InD" id="">
				    </td>
					<!--  <td>員工職階</td> -->
					<td>
						<input type="hidden" name="Title" id="" size="20" value="0">
					</td> 
	            </tr>
	            <tr>
					<td>員工Depart</td>
					<td>
						<select name="Depart" id="Depart">
                    	
                    	<option value=總經理室>總經理室  </option>
                    	<option value=管理部>管理部  </option>
                    	<option value=財務部>財務部  </option>
                    	<option value=資訊部>資訊部  </option>
                    	<option value=業務部>業務部  </option>
                    	<option value=製造部>製造部  </option>
                    	</select>
					</td>
					  <td>直屬主管</td>
					  <td>
						<select name="BossPosId" id="BossPosId">
						<%
						Document_PositionDAOImpl impl2=new Document_PositionDAOImpl();
						ArrayList<Document_Position> flowList = impl2.getAll();
						for(Document_Position o : flowList )
						{
						%>
							<option value=<%=o.getPosID() %> > <%=o.getPosTitle() %></option>
						<% } %>	
						</select>
					</td>
	            </tr>
	        </tbody>
	    </table>
	    
    </div>
	    <div id="Update">
	    	<input type="submit" value="送出" name='send' class="button button-rounded button-flat-primary">
	    	<input type="reset" value="重填" name='delete' class="button button-rounded button-flat-primary">
	    	<button type="button" class="button button-rounded button-flat-primary"><a href="empData.jsp">返回</a>
	    </div>
</form>
</div>
</div>
</body>
</html>