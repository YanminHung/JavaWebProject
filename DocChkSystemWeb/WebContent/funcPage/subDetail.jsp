<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.ArrayList"%>
	<!DOCTYPE html>

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

	request.setCharacterEncoding("utf-8");

	String Dou_No = request.getParameter("Dou_No");
	String realNo = request.getParameter("realNo");

	if( Dou_No == null )
	{
	    response.sendRedirect("../SystemUsePage.jsp");
	}

	Document_Detail docDetail = new DetailDAOImpl().searchNo( Integer.valueOf(realNo) );
	String Author = new EmpolyeeDAOImpl().findByNo( docDetail.getDou_Author() ).getName();


	%>

	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <title>文件簽核系統-草稿修改</title>
	    <script type="text/javascript" src="../js/minwt.auto_full_height.mini.js"></script>
	    <link rel="stylesheet" href="../css/input_button_g.css">
	<style>
	*{
	    margin:0px;;
	    padding:0px;
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
	    height:477px;
	    overflow-y:none;
	    text-align:left;
	    background:#e9e9e9;
	    font-family: 微軟正黑體;
	    font-size: 18px;
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
	input[type=text]
	{
	    margin: 10px 40px;
	    text-align: left;
	}
	input[type=radio]
	{
	    margin: 10px 10px;
	    text-align: center;
	}
	input[type=file]
	{
	    margin: 10px 10px;
	    text-align: center;
	    font-family: 微軟正黑體;
	}
	select
	{
	    margin: 10px 10px;
	    text-align: center;
	}
	table{
	    border-collapse: collapse;

	}
	table,tr,td{
	    border: 0px solid #C6C9CA;
	}
	tr{
	    background: white;
	}
	textarea{
	    resize:none;
	    width: 700px;
	}
	#delete{
	    text-align: center;
	    background:#0dadb7;
	    padding: 6px;
	}
	.content{
    margin:3px;
    width:638px;
    height:160px;
    background:white;
    border:1px solid #9c9d9d;
    border-radius: 6px;
    padding:3px;
}
	</style>
	</head>

	<script type="text/javascript">    
	function opnefile( fileURL )
	{
	    var p = window.open( fileURL, "file", "height=720,width=960,top=100,left=100" );
	    p.focus();
	}
	</script>

	<body>
	<div id="table-warp">
	    <form action="" method="post">
	        <div class="title">草稿文件</div>
	        <div class="table-body">
	            <table id="table-b">
	                <tbody>
	                <!--更改下面-->
	                <tr>
	                    <td width="150" align="center">申請編號</td>
	                    <td><%=Dou_No%></td>
	                    <td width="150" align="center">發文日期</td>
	                    <td><%=docDetail.getDou_Date().substring(0,11) %></td>
	                </tr>
	          
	                <tr>
	                    <td width="150" align="center">件速</td>
	                    <td >
	                    <%
	                    String speed="";
	                    if( docDetail.getDou_Speed() == 0 ) speed="急件";
	                    if( docDetail.getDou_Speed() == 1 ) speed="普件";
	                    if( docDetail.getDou_Speed() == 2 ) speed="其他";
	                    out.print(speed);
	                    %>
	                    </td>
	                    <td width="150" align="center">文件類型</td>
                        <td><%
                        String type = "";
                        if( docDetail.getDou_Type() == 1 ) type = "公告";
                        if( docDetail.getDou_Type() == 2 ) type = "一般文件";
                        out.print(type);
                        %></td>
	                </tr> 
	                
	                <tr>
	                    <td width="150" align="center">主旨</td>
	                    <td colspan="3">
	                        <div class="content"><%=docDetail.getDou_Keynote() %></div>
	                    </td>
	                </tr>
	          
	                <tr>
	                    <td width="150" align="center">說明</td>
	                    <td colspan="3">
	                       <div class="content"><%=docDetail.getDou_Content() %></div>
	                    </td>
	                </tr>
	          
	                <tr>
	                    <td align="center">附件</td>
                    <td colspan="3">
                        <!-- <input type="file" name="Dou_Link" id="Dou_Link" class="file" > -->
                        <%
                        if( !docDetail.getDou_Link().equals("0"))
                        {
                        	String fileUrl = "\"opnefile('" +
                                             docDetail.getDou_Link() +
                                             "')\"";
						%>
						<input name="file" id="file" type="button" value="開啟附件" onclick=<%=fileUrl %> >
						<%
                        }
                        else
                        {
						%>
						無附件...
						<%
                        }
						%>
                    </td>
	                </tr>
	                </tbody>
	            </table>
	        </div>
	    </form>
	</div>
	</body>
	</html>

