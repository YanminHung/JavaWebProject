<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>版面公告維護-置頂</title>
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/input_button_g.css">
<script type="text/javascript"> 
function check_all(obj,cName) 
{ 
    var checkboxs = document.getElementsByName(cName); 
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
    height:430px;
    overflow-y:scroll;
    text-align:left;
    background:#e9e9e9;
    font-family: 微軟正黑體;
    font-size: 16px;
    }
.table-head th:first-of-type,.table-body td:first-of-type{
    width:50px;
}
.table-head th:nth-child(2),.table-body td:nth-child(2)
{
    width:50px;
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
</style>
</head>
<body>
<div id="table-warp">
<form action="" method="">
    <div class="table-head">
        <div class="title">版面維護</div>
        <table id="table-h">
            <thead>
                <tr>
                <th><input type="checkbox" name="allselect" id="allselect" onclick="check_all(this,'select')"/></th>
                <th>狀態</th>
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
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>普</td>
                    <td>2014-07-31</td>
                    <td>測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>普</td>
                    <td>2014-07-31</td>
                    <td>測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select" /></td>
                    <td>測試</td>
                    <td>2</td>
                    <td>測試</td>
                </tr>
            </tbody>
        </table>
    </div>
        <div id="delete">
            <input type="submit" value="置頂" name='delete' class="input_button_g">
        </div>
</form>
</div>
</body>
</html>