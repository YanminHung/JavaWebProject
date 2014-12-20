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
    
    String Dou_TmpNo=request.getParameter("Dou_TmpNo");
    int Dou_Type=Integer.valueOf(request.getParameter("Dou_Type"));
    int Dou_Speed=Integer.valueOf(request.getParameter("Dou_Speed"));
    String Dou_Keynote=request.getParameter("Dou_Keynote");
    String Dou_Content=request.getParameter("Dou_Content");
//    int name=Integer.valueOf(request.getParameter("name"));
    String Dou_Date=request.getParameter("Dou_Date");
    int Dou_FlowType=Integer.valueOf(request.getParameter("Dou_FlowType"));
    //int Status=Integer.valueOf(request.getParameter("Status"));
    //int Dou_IsHistoryCheck=Integer.valueOf(request.getParameter("Dou_IsHistoryCheck"));
    //String Dou_Link=request.getParameter("Dou_Link");
    //int Dou_Draft=Integer.valueOf(request.getParameter("Dou_Draft"));

    d.setDou_TmpNo(Dou_TmpNo);
    d.setDou_Type(Dou_Type);
    d.setDou_Speed(Dou_Speed);
    d.setDou_Keynote(Dou_Keynote);
    d.setDou_Content(Dou_Content);
    d.setDou_Author(m.getNo());
    d.setDou_Date(Dou_Date);
    d.setDou_Flow(Dou_FlowType);
    d.setStatus(0);
    d.setDou_IsHistoryCheck(0);
    //d.setDou_Link(Dou_Link);
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
    //DetailDAOImpl impl= new DetailDAOImpl();
    //impl.add(d);
    //response.sendRedirect("PersonnelMainPage.jsp");
%>
<%

// This pattern is used to get the basename of a filename
final Pattern basenamePattern = Pattern.compile("^.*[/\\\\]");

// Check that we have a file upload request
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
String DbFileLink="0";
// if not, send to message page with the error message
if(!isMultipart){
    request.setAttribute("msg", "Request was not multipart!");
    d.setDou_Link("0");
    //DetailDAOImpl impl= new DetailDAOImpl();
    //impl.add(d);
	//request.getRequestDispatcher("PersonnelMainPage.jsp").forward(request, response);
    //return;
}

/* 網頁專案路徑 */
String ProjectPath = "C:\\JavaWebProject\\DocChkSystemWeb\\WebContent";

/* 上傳資料夾 */
String savePath = "\\uploads";

String uploadPath = System.getProperty("os.name").matches("Windows.*") ?
                    ProjectPath + savePath :
                    "/tmp/uploads/";

/* 檢查資料夾是否存在，否則建立 */
File saveDir = new File(uploadPath);    
if(!saveDir.exists()){
  saveDir.mkdir();
}

out.print( "<p>" + uploadPath + "</p>" ); 

/* 員工編號 */
String EmpIdPath = m.getId();  

uploadPath += "\\";
uploadPath += EmpIdPath;

out.print( "<p>" + uploadPath + "</p>" ); 

/* 檢查資料夾是否存在，否則建立 */
saveDir = new File(uploadPath);    
if(!saveDir.exists()){
  saveDir.mkdir();
}

/* Date Path String */
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
Date dt=new Date();
String dts=sdf.format(dt);

dts = "\\" + dts;
uploadPath += dts;

/* 檢查資料夾是否存在，否則建立 */
saveDir = new File(uploadPath);    
if(!saveDir.exists()){
  saveDir.mkdir();
}

// Create a new file upload handler
ServletFileUpload upload = new ServletFileUpload();

// Parse the request
FileItemIterator iter = upload.getItemIterator(request);
while (iter.hasNext()) {
    FileItemStream item = iter.next();
    InputStream stream = item.openStream();
    if (!item.isFormField()) {
        String fileName = item.getName();
        if(!fileName.equals("") ){
        String subfileName = fileName.substring( fileName.lastIndexOf('.') );
        
        /* 檔名為申請編號 */
        fileName = Dou_TmpNo + subfileName;  
        
        String uploadedFile = uploadPath + "\\" + basenamePattern.matcher(fileName).replaceFirst("");

        IOUtils.copy(stream, new FileOutputStream(uploadedFile));

        request.setAttribute("msg", "Uploaded '" + fileName + "' to '" + uploadedFile);
        
        DbFileLink = savePath + "\\" + EmpIdPath + dts + "\\" + fileName;
        
        DbFileLink = DbFileLink.replace( '\\', '/' );
        
        out.print( "<p>" + DbFileLink + "</p>" ); //link位置
        
    }
}
}
	d.setDou_Link(DbFileLink);
	DetailDAOImpl impl= new DetailDAOImpl();
    impl.add(d);
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