<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,org.apache.commons.fileupload.*, org.apache.commons.io.*, org.apache.commons.fileupload.servlet.*, org.apache.commons.fileupload.disk.*, java.io.*, java.util.Iterator, java.util.regex.Pattern , java.text.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    Document_Detail d=new Document_Detail();
    Empolyee m = ( Empolyee) session.getAttribute("Empolyee");
    
    //int Dou_No=Integer.valueOf(request.getParameter("Dou_No"));
    
    String Dou_TmpNo=request.getParameter("Dou_TmpNo");
    int Dou_Type=Integer.valueOf(request.getParameter("Dou_Type"));
    int Dou_Speed=Integer.valueOf(request.getParameter("Dou_Speed"));
    String Dou_Keynote=request.getParameter("Dou_Keynote");
    String Dou_Content=request.getParameter("Dou_Content");
	String Dou_Link=request.getParameter("Dou_Link");
    String Dou_Date=request.getParameter("Dou_Date");
    int Dou_FlowType=Integer.valueOf(request.getParameter("Dou_FlowType"));

    d.setDou_TmpNo(Dou_TmpNo);
    d.setDou_Type(Dou_Type);
    d.setDou_Speed(Dou_Speed);
    d.setDou_Keynote(Dou_Keynote);
    d.setDou_Content(Dou_Content);
    d.setDou_Date(Dou_Date);
    d.setDou_Flow(Dou_FlowType);
    out.print(Dou_Link);
    
    out.print( "<p> submit: " + request.getParameter("submit") + "</p>" );
    if(request.getParameter("submit").equals("發送"))
    {
    	out.print( "<p> submit: GG </p>" );
    	d.setDou_Draft(0);
    }
    else if(request.getParameter("submit").equals("暫存"))
    {
    	out.print( "<p> submit: PP </p>" );
    	d.setDou_Draft(1);
    }
    out.print(Dou_TmpNo+" "+Dou_Type+" "+
  		  Dou_Speed+" "+Dou_Keynote+" "+
  		  Dou_Content+" "+Dou_Date+" "+
  		  Dou_FlowType+" "+d.getDou_Link()+" "+d.getDou_Draft());
    
%>
<%


	d.setDou_Link(Dou_Link);
	
	DetailDAOImpl impl= new DetailDAOImpl();
    impl.update(d);
	//

/* 產生簽核進度資料 */
// 文件Detail PK值
if(d.getDou_Draft()==0){
	d = impl.searchTmpNo( Dou_TmpNo );
int DocTmpId = d.getDou_No(); //流水號
//String Dou_FlowType = request.getParameter("Dou_FlowType");

int FlowTypeId =  Dou_FlowType ;
int FlowMaxStep = new Document_FlowTypeDAOImpl().getFlowTypeById(FlowTypeId).getFlowMax();

ArrayList< Document_FlowSeq > flowDetail = new Document_FlowSeqDAOImpl().getAll( FlowTypeId );

ArrayList< DocProcess > docProcess = new ArrayList< DocProcess >();

int index = 0;

for( Document_FlowSeq o : flowDetail )
{
    // 設定第一筆簽核狀態為Enable
    docProcess.add( new DocProcess( DocTmpId,
                                    o.getFlowType(),
                                    o.getFlowSeq(),
                                    FlowMaxStep,
                                    new Document_PositionDAOImpl().getPosDataFromPosId( o.getFlowPosId() ).getEmpolyeeID(),
                                    ( index == 0) ? DocProcess.Enable : DocProcess.Disable ) );
    index++;
}

new DocProcessDAODBImpl().add( docProcess );
}
response.sendRedirect("PersonnelMainPage.jsp");
%>

</body>
</html>