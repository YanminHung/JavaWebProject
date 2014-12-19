<%------------------------------------------------------------------------
Copyright 2009 SÃ©Â·Â¨en Lund <soren@lund.org>

This file is part of Simple JSP Upload.

Simple JSP Upload is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

Simple JSP Upload is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with Simple JSP Upload.  If not, see http://www.gnu.org/licenses/
------------------------------------------------------------------------%>

<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.io.*, org.apache.commons.fileupload.servlet.*, org.apache.commons.fileupload.disk.*, java.io.*, java.util.Iterator, java.util.regex.Pattern , java.text.*, java.util.*, DocChkDbAccess.*" %>
<%

// This pattern is used to get the basename of a filename
final Pattern basenamePattern = Pattern.compile("^.*[/\\\\]");

// Check that we have a file upload request
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

// if not, send to message page with the error message
if(!isMultipart){
    request.setAttribute("msg", "Request was not multipart!");
    request.getRequestDispatcher("dialog.jsp").forward(request, response);
    return;
}

/* 網頁專案路徑 */
String ProjectPath = "I:\\JavaProject\\DocChkSystemWeb\\WebContent";

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

/* 員工編號 */
String EmpIdPath = "\\QQQQQ";

uploadPath += EmpIdPath;

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
        //String fileName = item.getName();
        
        String subfileName = item.getName().substring( item.getName().lastIndexOf('.') );
        
        /* 檔名為申請編號 */
        String fileName = "GGG" + subfileName;
        
        String uploadedFile = uploadPath + "\\" + basenamePattern.matcher(fileName).replaceFirst("");

        IOUtils.copy(stream, new FileOutputStream(uploadedFile));

        request.setAttribute("msg", "Uploaded '" + fileName + "' to '" + uploadedFile);
        
        String DbFileLink = savePath + EmpIdPath + dts + "\\" + fileName;
        
        DbFileLink = DbFileLink.replace( '\\', '/' );
        
        out.print( "<p>" + DbFileLink + "</p>" );
    }
}

/* 產生簽核進度資料 */
// 文件Detail PK值

int DocTmpId = 1;
String Dou_FlowType = request.getParameter("Dou_FlowType");

int FlowTypeId = Integer.valueOf( Dou_FlowType );
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

%>
