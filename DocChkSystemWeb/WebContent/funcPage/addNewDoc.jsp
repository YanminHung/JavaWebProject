<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.*,java.text.*"%>
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
Empolyee m = (Empolyee) session.getAttribute("Empolyee");
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd");
Date dt=new Date();
String dts=sdf.format(dt);
String dts2 = sdf2.format(dt);
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文件簽核系統-新增文件</title>
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
    height:560px;
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
</style>
<script type="text/javascript">    
function formSubmit( submitValue )
{
    var Dou_TmpNo = document.getElementById("Dou_TmpNo").value;
    var Dou_Date = document.getElementById("Dou_Date").value;
    
    var Dou_Speed;
    var obj = document.getElementsByName( "Dou_Speed" );    
    for( i = 0; i < obj.length; i++ )
    {
        if( obj[ i ].checked )
        {
            Dou_Speed = obj[ i ].value;
            break;
        }
    }
    
    var site = document.all.Dou_FlowType.selectedIndex; 
    var Dou_FlowType = document.all.Dou_FlowType.options[site].value;
    
    site = document.all.Dou_Type.selectedIndex; 
    var Dou_Type = document.all.Dou_Type.options[site].value;
    
    var Dou_Keynote = document.all.Dou_Keynote.value;
    var Dou_Content = document.all.Dou_Content.value;
    
    var msgStr = "Dou_TmpNo=" + Dou_TmpNo + "&" +
                 "Dou_Date=" + Dou_Date + "&" +
                 "Dou_Speed=" + Dou_Speed + "&" +
                 "Dou_FlowType=" + Dou_FlowType + "&" +
                 "Dou_Type=" + Dou_Type + "&" +
                 "Dou_Keynote=" + Dou_Keynote + "&" +
                 "Dou_Content=" + Dou_Content + "&" +
                 "submit=" + submitValue;
    
//    alert( msgStr );
    
    document.form1.action="detailAdd.jsp?" + msgStr;
    
//    alert( document.form1.action );
    document.form1.submit();

}
    
</script>
</head>
<body>
<div id="table-warp">
    <form name = "form1" id = "form1" action="detailAdd.jsp" method="post" enctype="multipart/form-data">
    <!-- 隱藏 下列 直接預設，name直接抓取 Empolyee -->
    <input name="name" id="name" type="hidden" value=<%out.print(m.getNo()); %>>
    <input name="Status" id="Status" type="hidden" value=0>
    <input name="Dou_IsHistoryCheck" id="Dou_IsHistoryCheck" type="hidden" value=0>
    
    <input name="Dou_Draft" id="Dou_Draft" type="hidden" value=0>
        <div class="title">新增文件</div>
        <div class="table-body">
            <table id="table-b">
                <tbody>
                <!--更改下面-->
                <tr>
                    <td width="150" align="center">申請編號</td>
                    <td><input type="text" id = "Dou_TmpNo" name="Dou_TmpNo" value="<% out.print(m.getId() + dts); %>"></td>
                    <td width="150" align="center">發文日期</td>
                    <td><input type="text" id="Dou_Date" name="Dou_Date" value="<% out.print(dts2); %>"></td>
                </tr>
          
                <tr>
                    <td width="150" align="center">件速</td>
                    <td colspan="3">
                        <input type="radio" name="Dou_Speed" value=0 >急件
                        <input type="radio" name="Dou_Speed" value=1 checked >普件
                        <input type="radio" name="Dou_Speed" value=2 >其他
                    </td>
                </tr>
            
                <tr>
                    <td width="150" align="center">流程</td>
                    <td>
                        <select name="Dou_FlowType" id="Dou_FlowType">
	                    <%
	                    Document_FlowTypeDAOImpl impl = new Document_FlowTypeDAOImpl();
	                    // 職階關係表尚未建立完成，先列出所有流程
	                    ArrayList< Document_FlowType > flowList = impl.getAllEnableFlow();
	                    
	                    for( Document_FlowType o : flowList )
	                    {
	                    %>
	                        <option value=<%=o.getFlowType() %> > <%=o.getFlowName() %> </option>
	                    <%
	                    }
	                    %>
	                    </select>
                    </td>
                    <td width="150" align="center">文件類型</td>
                    <td>
                        <select name="Dou_Type" id="Dou_Type">
                            <option value="1">公告</option>
                            <option value="2">一般文件</option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td width="150" align="center">主旨</td>
                    <td colspan="3">
                        <textarea name="Dou_Keynote" id="Dou_Keynote" cols="30" rows="10"></textarea>
                    </td>
                </tr>
          
                <tr>
                    <td width="150" align="center">說明</td>
                    <td colspan="3">
                        <textarea name="Dou_Content" id="Dou_Content" cols="30" rows="10"></textarea>
                    </td>
                </tr>
          
                <tr>
                    <td align="center">附件</td>
                    <td colspan="3">
                        <input type="file" name="Dou_Link" id="Dou_Link" class="file">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        
        <div id="delete">
            <input name="submit" type="submit" value="發送" class="input_button_g" onclick="formSubmit('發送')" >
            <input name="submit" type="submit" value="暫存" class="input_button_g" onclick="formSubmit('暫存')">
        </div>
    </form>
</div>
</body>
</html>