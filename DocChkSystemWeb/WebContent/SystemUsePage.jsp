<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*" %>
<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if (!login.equals("administrator"))
{
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文件簽核系統-管理員</title>
    <script src="js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="js/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="js/minwt.auto_full_height.mini.js"></script>
    <link rel="stylesheet" href="css/theme.css">
	<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

<script>
$(document).ready(function(e) {
    $(".sub").slideUp(0);
    for(var i=0;i<$(".menu").length;i++){
        $(".menu:eq("+i+")").click({id:i},function(e){
            $(".sub:not(.sub:eq("+e.data.id+"))").slideUp(500);
            $(".sub:eq("+e.data.id+")").slideDown(500);
        });
    };

});

function changeMainPage()
{
    
}

function changeSubBrowse( str )
{
    //alert( "MainPage" + str );
    var iframeElement = document.getElementById("subBrowse");
    
    iframeElement.src = str;
}
</script>
</head>
<body >
    <div id="head" _height="none">
        <div id="toplink">
        <a href="funcPage/PersonnelMainPage.jsp" target="subBrowse" id="logo"></a>    
        </div>
        <div id="toptool">
            <ul>
                <li class="logout"><img src="images/logout.png" alt="" width="50%" height="50%">
                    <ul>
                        <li><a href="Logout.jsp">登出</a></li>
                    </ul>
                </li>
                <li><a href="javascript:history.forward()" target="subBrowse"><img src="images/next.png" alt="" width="50%" height="50%"></a></li>
                <li><a href="funcPage/PersonnelMainPage.jsp" target="subBrowse"><img src="images/home.png" alt="" width="50%" height="50%"></a></li>
                <li><a href="javascript:history.back()" target="subBrowse"><img src="images/back.png" alt="" width="50%" height="50%"></a></li>
            </ul>
        </div>
    </div>
    <div id="lside" _height="auto">
        <div id="hello">
        <%
            Empolyee m =(Empolyee) session.getAttribute("Empolyee");
            
            if( m == null )
                response.sendRedirect("login.jsp");
        %>
        <span class="span1">歡迎光臨</span>
        <span class="span2"><%out.print(m.getName());%></span>
        </div>
            <div class="menu">員工資料維護</div>
                <div class="sub">
                    <ul>
                        <li><a href="adminPage/empData.jsp" target="subBrowse" >員工清單</a></li>
                    </ul>
                </div>
            <div class="menu">版面維護</div>
                <div class="sub">
                    <ul>
                        <li><a href="adminPage/AnnPushUp.jsp" target="subBrowse">版面維護</a></li>
                    </ul>
                </div>
            <div class="menu">組織與流程</div>
                <div class="sub">
                    <ul>
                        <li><a href="adminPage/flowPage.jsp" target="subBrowse">簽核流程設定</a></li>
                        <li><a href="adminPage/positionData.jsp" target="subBrowse" >主管人員設定</a></li>
                    </ul>
                </div>
            <div class="menu">文件查詢</div>
                <div class="sub">
                    <ul>
                        <li><a href="funcPage/search.jsp" target="subBrowse">文件查詢</a></li>
                    </ul>
                </div>      
    </div>
    <div id="right">
	    <div id="con" _height="auto">
	        <div id="iframe-warp">
	            <iframe  name="subBrowse" src="funcPage/PersonnelMainPage.jsp" frameborder="0" scrolling="auto" width="100%" height="99%"></iframe>
	        </div>
	    </div>
    </div>
    <div class="clr"></div>
</div>
</body>
</html>
