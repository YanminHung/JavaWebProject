<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  
 
    String [] ProdelNo = request.getParameterValues("chIsHis");        
    DetailDAOImpl  impl = new DetailDAOImpl();
    
    /*for(String o:ProdelNo)
    	{out.print(o);}*/
    if(ProdelNo != null){
    	for(String o:ProdelNo){
    		int No = Integer.valueOf(o);
    		Document_Detail D_D = impl.searchNo(No);
    		if(D_D.getStatus() != 0){
    		impl.updateIsHistory(No);}
    	}
    	response.sendRedirect("doc_process.jsp");
    }
    
    /*if ( doudel != null )
    {    
    for (String o: doudel)
       {
        //out.print("Dou_NO:"+Integer.valueOf(o));
        impl.updateDraftFlag(Integer.valueOf(o));    
       }
    }
    response.sendRedirect("doc_draft.jsp");*/
%>	
</body>
</html>