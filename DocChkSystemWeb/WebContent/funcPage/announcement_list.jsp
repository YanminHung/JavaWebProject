<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*"%>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文件簽核系統-公告內容查詢</title>
    <script type="text/javascript" src="js/minwt.auto_full_height.mini.js"></script>
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
.table-body{
    width:100%; 
    height:440px;
    overflow-y:none;
    text-align:left;
    background:#e9e9e9;
    font-family: 微軟正黑體;
    font-size: 16px;
    }
.table-body table tr:nth-child(2n+1){
    background-color:#f6f6f6;
    }
#table-b{
    border-collapse:collapse;
     border: 0px;
     height: 440px;
    }
#table-b,tr,td{
    border-collapse:collapse;
    border: 0px;;
    }
table{
    border-collapse: collapse;

}
tr{
    border: 3px solid white;
}
tr{
    background: white;
}
.text-top{
    vertical-align:text-top;
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
	var p = window.open( fileURL, "文件內容", config="height=720,width=960" );
	p.focus();
}
</script>

<body>
<%
    int Dou_TmpId = Integer.valueOf(request.getParameter("Lib_TmpId"));
    DetailDAOImpl  impl = new DetailDAOImpl();
    Document_Detail  r = impl.searchNo(Dou_TmpId);
    String DocLibNum = request.getParameter("DocLibNo");

%>
<div id="table-warp">
    <form action="" method="post">
    <div class="title">公告文件</div>
    <div class="table-body">
        <table id="table-b">
            <tbody>
                <!--更改下面-->
          <tr>
            <td align="center" width="150" height="40">文件編號</td>
            <td><% out.print(DocLibNum); %></td>
            <td align="center" width="150" >發文日期</td>
            <td>
            <% if (r.getDou_Date() !=null)
                 {out.print(r.getDou_Date().substring(0,11));}
                 else {out.print(" ");} 
            %>   
            </td>
          </tr>
          <tr>
            <td align="center" width="150" height="40">件速</td>
            <td colspan="3" width="650">
                <input type="radio" name="Dou_Speed" disabled="disabled" value=1 <% if( r.getDou_Speed() == 0 ) out.print("checked"); %> >急件
                <input type="radio" name="Dou_Speed" disabled="disabled" value=1 <% if( r.getDou_Speed() == 1 ) out.print("checked"); %> >普件
                <input type="radio" name="Dou_Speed" disabled="disabled" value=2 <% if( r.getDou_Speed() == 2 ) out.print("checked"); %> >其他
            </td>
          </tr>
          <tr>
            <td align="center" width="150">主旨</td>
            <td colspan="3" class="text-top" width="650">
             <div class="content"><% out.print(r.getDou_Keynote());%></div>
            </td>
          </tr>
          <tr>
            <td align="center" width="150">說明</td>
            <td colspan="3" class="text-top" width="650">
            <div class="content"><% out.print(r.getDou_Content());%></div>
            </td>
          </tr>
          <tr>
            <td align="center" width="150" height="40">附件</td>
            <td colspan="3"  width="650">
                <%
                if( !r.getDou_Link().equals("0"))
                {
                    String fileUrl = "\"opnefile('" +
                                     r.getDou_Link() +
                                     "')\"";
                %>
                <input name="file" id="file" type="button" value="開啟附件" class="button button-rounded button-flat-primary" onclick=<%=fileUrl %> >
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