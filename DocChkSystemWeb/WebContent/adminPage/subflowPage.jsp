<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.ArrayList"%>
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

String FlowTypeName = request.getParameter("msg");
Document_FlowTypeDAOImpl impl = null;
Document_FlowType flowDetail = null;

if( FlowTypeName != null )
{
    Document_FlowTypeDAOImpl FTimpl = new Document_FlowTypeDAOImpl();
    impl = new Document_FlowTypeDAOImpl();
    flowDetail = impl.getFlowType( FlowTypeName );
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文件流程篩選</title>
    <script src="js/jquery-1.3.2.js"></script>
    <link rel="stylesheet" href="../css/input_button_g.css">
    
<script language="javascript" type="text/javascript">  
$(document).ready(function (){  
    //為添加按鈕增加事件  
    $("#leftbtn").click(function (){  
        //獲取選擇的值  
        $("#leftop option:selected").each(function (i){       
              
            //在右邊添加所選值，並且添加之後在左邊刪除所選值  
            $("#rightop").append("<option>"+this.text+"</option>");  
        }).remove();  
    });  
    //為刪除按鈕增加事件  
    $("#rightbtn").click(function (){  
        //獲取所選擇的值  
        $("#rightop option:selected").each(function (i){          
              
            //在左邊添加所選值，並且添加之後在右邊刪除所選值  
            $("#leftop").append("<option>"+this.text+"</option>");  
        }).remove();  
    });
});

function ReloadPage()
{
    parent.ReloadPage();
}

function confirmModify()
{
    if (document.getElementById("flowname").value == '')
    {
        alert( "請輸入流程名" );
        return false;
    }
    
    return confirm( "請確認修改?" );
}

</script>   
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
#table-h_2{
    width:400px;
    background-color:#43464c;
    color:white;
    font-family: 微軟正黑體;
    text-align:center;
    }
#table-h_2 tr td{
    padding:6px;
}
.table-head{
    width:400px;
    background-color:#0dadb7;
    color:white;
    font-family: 微軟正黑體;
    text-align:center;
    }
.table-body{
    width:100%; 
    height:430px;
    text-align:center;
    background:#e9e9e9;
    font-family: 微軟正黑體;
    font-size: 16px;
    }
.table-head th:first-of-type,.table-body td:first-of-type{
    width:180px;
}
.table-head th:nth-child(2),.table-body td:nth-child(2)
{
    width:40px;
}
.table-head th:last-of-type,.table-body td:last-of-type
{
    width:180px;
}
.table-head table,.table-body table{
    width:100%;
    }
.tb2{
    height: 100%;
}
.tb2 tr:nth-child(2n+1){
    background-color:#f6f6f6;
    }
#table-b{
    border-collapse:collapse;
    border: 0px;
    }
#delete{
    text-align: left;
    background:#0dadb7;
    padding: 6px;
}
#table-h,tr,th{
    border-collapse:collapse;
    border: 0px;
    padding: 6.5px;
    }
#table-b,tr,td{
    border-collapse:collapse;
    border: 0px;
    }
input[type=button]{
    font-size: 10px;
    width: 25px;
    height: 25px;
}
select{
    width: 100%;
    height:430px;
}
</style>
</head>
<body>
<div id="table-warp">
    <form name="flowEdit" method="post" action="updateFlow.jsp" onsubmit="return confirmModify();" >
	    <input name="oldflowname" id="oldflowname" type="hidden" value=<% if( flowDetail != null ) out.print( flowDetail.getFlowName() ); %>  >
        <table id="table-h_2">
            <tr>
                <td>流程名</td>
                <td colspan="3">
                    <input name="flowname" id="flowname" type="text" <% if( FlowTypeName == null ) out.print( "disabled=\"disabled\"" ); %> value=<% if( flowDetail != null ) out.print( flowDetail.getFlowName() ); %>  >
                </td>
            </tr>
            <tr>
                <td colspan="4">
	                <label><input name="radio" type="radio" value="Enable" <% if( flowDetail != null && flowDetail.getFlowEnable() == Document_FlowType.Enable ) out.print("checked"); %> >啟用</label>
                    <label><input name="radio" type="radio" value="Disable" <% if( flowDetail != null && flowDetail.getFlowEnable() == Document_FlowType.Disable ) out.print("checked"); %> >停用</label>
                </td>
            </tr>
        </table>
        <div class="table-head">
            <table id="table-h">
                <thead>
                    <th>簽核職位順序</th>
                    <th></th>
                    <th>職位清單</th>
                </thead>
            </table>
        </div>
        <div class="table-body">
            <table id="table-b">
                <tbody>
                    <!--更改下面-->
                    <tr>
                        <td>
                            <select id="leftop" name="leftop" multiple="multiple" size="2" disabled="disabled">
                            <%
                            if( FlowTypeName != null )
                            {
                                Document_FlowSeqDAOImpl FlowSeqImpl = new Document_FlowSeqDAOImpl();
                                ArrayList<Document_FlowSeq> FlowSeq = FlowSeqImpl.getAll( flowDetail.getFlowType() );
                                Document_PositionDAOImpl PosImpl = new Document_PositionDAOImpl();
                            
                                for( Document_FlowSeq o : FlowSeq )
                                {
                            %>
                                <option><% out.print( PosImpl.getPosDataFromPosId( o.getFlowPosId() ).getPosTitle() ); %></option>
                            <%  } } %>
                            </select>
                        </td>
                        <td>
                            <div>
                            <input id="leftbtn" name="" type="button" value=">" class="button1">
                            <input id="rightbtn" name="" type="button" value="<" class="button2">
                            </div>
                        </td>
                        <td>
                            <select id="rightop" name="rightop" multiple="multiple" size="2" disabled="disabled">
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="delete">
            <input type="submit" class="input_button_g" value="修改" <% if( FlowTypeName == null ) out.print( "disabled=\"disabled\"" ); %> >
        </div>
    </form>
</div>
</body>
</html>