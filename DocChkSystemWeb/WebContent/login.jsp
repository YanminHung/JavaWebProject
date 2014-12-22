<%@page import="sun.applet.resources.MsgAppletViewer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文件簽核系統-首頁</title>
  <link rel="stylesheet" href="css/buttons.css">
  <script type="text/javascript" src="js/buttons.js"></script>
<script>

</script>

<%
String errMsg = request.getParameter("msg");
%>

<style>
*{
    margin:0px;;
    padding:0px;
}
body{
    text-align: center;
    background-image:url(images/background.jpg) ;
}
#head{
  width:100%;
  margin:0px auto;
  background:#297AAE;
  height: 80px;
  background-image:url(../images/bg02.png);
}
#logo{
  display: block;
  background:url(images/logo.png) no-repeat;
  float: left;
  width: 200px;
  height: 50px;
  margin-left: 25px;
  margin-top: 25px;
}
#container{
  width: 100%;
  height: 100%;
}
#login{
    background: #C6C9CA;
    width: 300px;
    height: 300px;
    border-radius: 5px;
  box-shadow: 0 1px 5px rgba(0,0,0,0.75), inset 0 5px 22px 5px white;
  position: relative;
  margin: 9% 39%;
}
#errMsg {
    font-family: 微軟正黑體;
    color: #F00;
}
h2{
    background: #388ECB;
    border-radius: 5px 5px 0px 0px;
    color:#EBEFF0;
    font-family: 微軟正黑體;
  display: block;
  height: 50px;
  line-height: 50px;
}
p{
    margin: 20px 0px;
}
input[type=text], input[type=password] {
  margin: 5px;
  padding: 0 10px;
  width: 200px;
  height: 34px;
  color: #404040;
  background: white;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px solid #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
}
</style>
</head>
<body>
  <div id="head">
  <div id="logo"></div>
  </div>
    <div id="container">
    <div id="login">
        <h2>登入文件簽核系統</h2>
      <form method="POST" action="LoginChk.jsp">
        <p><input type="text" id="emplid" name="emplid" placeholder="員工編號"></p>
        <p><input type="password" id="password" name="password" placeholder="password"></p>
        <p><input type="submit" value="登入" class="button button-rounded button-flat-primary"></p>
      </form>
      <p id="errMsg">
      <%
          if( errMsg != null )
          {
              if( errMsg.equals( "1" ) )
                  out.print( "密碼錯誤" );
              else if( errMsg.equals( "2" ) )
                  out.print( "員工編號錯誤" );
          }
      %>
      </p>
    </div>
  </div>
</body>
</html>
