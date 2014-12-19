<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>  
<!DOCTYPE html>

<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if (!login.equals("Employee"))
{
    response.sendRedirect("login.jsp");
}
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>變更密碼</title>
    <link rel="stylesheet" href="css/buttons_small.css"> 
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.validate.js" type="text/javascript"></script>
    <script src="js/messages.js" type="text/javascript"></script>
<script>
$(document).ready(function(){ 
    $("#signupForm").validate(); 
});
 </script>  
<style>
*{
    margin:0px 0px;
    padding:0px 0px;
    }
#warp{
    width:100%;
    }
#table-warp{
    width:400px;
    margin:6px auto;
    text-align:center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    position: relative;
    float: left;
    left: 50%;
    margin: 100px -200px;
    }
.title{
    width: 388px;
    background:#43464c;
    color:white;
    font-family: 微軟正黑體;
    text-align:left;
    font-size: 18px;
    padding: 6px;
}
.table-head{
    padding-right:15px;
    color:white;
    font-family: 微軟正黑體;
    text-align:left;
    }
.table-body{
    width:100%; 
    height:100%;
    text-align:left;
    font-family: 微軟正黑體;
    font-size: 16px;
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
.table-body td:first-of-type{
    width:100px;
}.table-body td:last-of-type
{
    width:300px;
}
.table-body{
    padding: 20px 0px;
}
#delete{
    text-align: center;
    padding: 6px;
}
#signupForm label.error { 
    font-size: 8px;
    color:red; 
    padding-left: 16px;
} 
</style>
</head>
<body>             
<div id="warp">
<div id="table-warp">
<form method="post" id="signupForm" action="editpassword.jsp">
    <div class="table-head">
        <div class="title">密碼變更</div>
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
                    <td>舊密碼</td>
                    <td>
                        <input type="password" name="pw" placeholder="請輸入舊密碼" autofocus="autofocus" class="required">
                    </td>
                </tr>
                <tr>
                    <td>新密碼</td>
                    <td>
                        <input type="password" name="pw1" placeholder="請輸入新密碼" autofocus="autofocus" id="password">
                    </td>
                </tr>
                <tr>
                    <td>確認新密碼</td>
                    <td>
                        <input type="password" name="pw2" placeholder="再輸入一次新密碼" autofocus="autofocus" id="confirm_password" class="required" equalTo="#password">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
        <div id="delete">
            <input type="submit" value="送出" name='delete' class="button button-rounded button-flat-primary">
            <input type="reset" value="重填" name='delete' class="button button-rounded button-flat-primary">
        </div>
</form>
</div>
</div>
</body>
</html>