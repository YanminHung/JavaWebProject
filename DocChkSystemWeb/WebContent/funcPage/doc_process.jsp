<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.ArrayList" %>
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
<!DOCTYPE html>

<% 
    EmpolyeeDAOImpl impl = new EmpolyeeDAOImpl();
    Empolyee Emp = (Empolyee)session.getAttribute("Empolyee");
    //Emp.getNo();
    DetailDAOImpl Doc = new DetailDAOImpl();
    ArrayList<Document_Detail> R = Doc.findByAuthor(Emp.getNo());
   
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文件簽核系統-進度查詢</title>
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/input_button_g.css">
    <link rel="stylesheet" href="../css/iconmoon.css">
    
<script type="text/javascript"> 
$(document).ready(function(){  
    $('.slidingDiv').hide();    
    $("a.show_hide").bind('click', function() { 
       if($("a.active").length) $("a.active").removeClass('active');
       if($(".slidingDiv").is(":visible") == true) { $('.slidingDiv').slideUp(); } else {}
       $(this).addClass('active');
       $('.slidingDiv').slideToggle();
    });
   $("#close").click( function() {
        $('.slidingDiv').slideUp();
    });
 });
/*$(document).ready(function(){
    $(".slidingDiv").hide();
    $(".show_hide").show();
	$('.show_hide').click(function(){
	$(".slidingDiv").slideToggle();
	});
});*/
function ifram_change( Proc_TempNo )
{
	var iframeElement = document.getElementById("sub");
    iframeElement.src = "doc_processDetail.jsp?Proc_TempNo=" + Proc_TempNo  ;
	
	//document.location.href="doc_processDetail.jsp?Proc_TempNo=" + Proc_TempNo  ;
}
function check_all(obj,chIsHis) 
{ 
    var checkboxs = document.getElementsByName(chIsHis); 
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
    height: 500px;
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
    width:30px;
}
.table-head th:nth-child(2),.table-body td:nth-child(2)
{
    width:70px;
    text-align: center;
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
#top{
	width: 800px;
	height:auto !important;
	height: 257px;
	max-height:257px;
	box-shadow: 0 1px 3px rgba(0,0,0,0.2);	
	position: relative;
}
.slidingDiv{
	position:relative;
	top:10px;
}
#table-b tr:hover{
	background: gray;
	color: white;
	}
a{
	text-decoration: none;
	color:black;
	display: block;
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
	color:#E78127;
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
<div id="top">
<form action="processDelete.jsp" method="post">
    <div class="table-head">
        <div class="title">進度查詢</div>
        <table id="table-h">
            <thead>
                <tr>
                <th><input type="checkbox" name="allselect" id="allselect" onclick="check_all(this,'chIsHis')"/></th>
                <th>審核狀態</th>
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
                //DocProcessDAODBImpl DocPrc=new DocProcessDAODBImpl();
                //Docprc.findByProc_TmpNo(Doc.getDou_No())
                //String TitleStr;
                
                for(int i=0 ; i<R.size() ; i++) 
                { 
                    Document_Detail r = R.get(i);                   
                    String funcStr = "\"ifram_change(" + r.getDou_No() +  ")\"";
                    //String funcDel = "processDelete.jsp";
                %>
                    <tr onclick=<%= funcStr %> >
                
                    <td><input type="checkbox" name="chIsHis" id="chIsHis" value=<%=r.getDou_No()%>></td>
                    <td><a class="show_hide active" name="show_hide" href="#"><%
                    int Proc_BO = r.getStatus();
                    String status = "";
                    /*
                    if(Proc_BO==0){status="審核中";}
                    if(Proc_BO==1){status="審核完畢";}
                    if(Proc_BO==2){status="退件";}
                    */
                    if(Proc_BO==0){status="\"icon-pending_1\"";}
                    if(Proc_BO==1){status="\"icon-pendover_1\"";}
                    if(Proc_BO==2){status="\"icon-back_1\"";}
                    //out.print(status);
                    %><span class = <%=status %>></span></a></td>
                    <td><a class="show_hide active" name="show_hide" href="#"><%=r.getDou_Date().substring(0,11)%></a></td>
                    <td><a class="show_hide active" name="show_hide" href="#"><%out.print(r.getDou_Keynote());%></a></td>
                </tr>    
                <% } %>
            </tbody>
        </table>
    </div>
        <div id="delete">
            <input type="submit" value="刪除" name='delete' class="input_button_g">
        </div>
</form>
</div>
	<div class="slidingDiv" name="slidingDiv">
		<iframe name="sub" id="sub" width="100%" height="250" src="doc_processDetail.jsp" frameborder="0" scrolling="no"></iframe>
	</div>
</div>
</body>
</html>