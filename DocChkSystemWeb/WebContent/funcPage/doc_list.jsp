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
    <title>文件簽核系統-文件查詢</title>
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
table,tr,td{
    border: 1px solid #C6C9CA;
}
tr{
    background: white;
}
.text-top{
    vertical-align:text-top;
    }
</style>
</head>

<script type="text/javascript">    
function opnefile( fileURL )
{
    window.open( fileURL, "文件內容", config="height=720,width=960" );
}
</script>

<body>
<%
    int Dou_TmpId = Integer.valueOf(request.getParameter("Lib_TmpId"));
    DetailDAOImpl  impl = new DetailDAOImpl();
    Document_Detail  r = impl.searchNo(Dou_TmpId);

    String Author = new EmpolyeeDAOImpl().findByNo( r.getDou_Author() ).getName();
%>
<div id="table-warp">
    <form action="" method="post">
    <div class="title">文件詳細內容</div>
    <div class="table-body">
        <table id="table-b">
            <tbody>
                <!--更改下面-->
          <tr>
            <td align="center" width="150" height="40">申請編號</td>
            <td><% out.print(r.getDou_TmpNo()); %></td>
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
            <!-- 
            <td colspan="3" width="650">
            <% //out.print(r.getDou_Speed()); %>
            </td>
             -->
             <td width="150" align="center">件速</td>
             <td>
                 <input type="radio" name="Dou_Speed" disabled="disabled" value=0 <% if( r.getDou_Speed() == 0 ) out.print("checked"); %> >急件
                 <input type="radio" name="Dou_Speed" disabled="disabled" value=1 <% if( r.getDou_Speed() == 1 ) out.print("checked"); %> >普件
                 <input type="radio" name="Dou_Speed" disabled="disabled" value=2 <% if( r.getDou_Speed() == 2 ) out.print("checked"); %> >其他
             </td>
             <td width="150" align="center">申請人</td>
             <td><input type="text" name="Dou_Date" disabled="disabled" value="<%=Author %>" ></td>
          </tr>
          <tr>
            <td align="center" width="150">主旨</td>
            <td colspan="3" class="text-top" width="650">
             <% out.print(r.getDou_Keynote());%>
            </td>
          </tr>
          <tr>
            <td align="center" width="150">說明</td>
            <td colspan="3" class="text-top" width="650">
            <% out.print(r.getDou_Content());%>
            </td>
          </tr>
          <tr>
            <td align="center" width="150" height="40">附件</td>
            <td colspan="3"  width="650">
                <!-- <input type="file" name="fileField" id="fileField" class="file" >  -->
                <%
                if( !r.getDou_Link().equals("0"))
                {
                    String fileUrl = "\"opnefile('" +
                                     r.getDou_Link() +
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