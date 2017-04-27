<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MultipartRequest mr=null;
	DefaultFileRenamePolicy dp;
	String upPath=config.getServletContext().getRealPath("/test3");
	int len=30*1024*1024;
	try{
		//mr=new MultipartRequest(request,"저장할 위치",크기,"글꼴");
		dp=new DefaultFileRenamePolicy();//중복된 이름 처리하는 클래스
		mr=new MultipartRequest(request,upPath,len,"EUC-KR",dp);
		out.println("업로드 성공!!");//파일 전송 성공
	}catch(IOException e){
		out.println("업로드 실패!!"); // 파일전송 실패시 IOException 발생
		e.printStackTrace();
	}
%>
<hr color="red">
<ul>
	<li>올린이 : <%=mr.getParameter("name") %></li>
	<li>파일명 : <%=mr.getFilesystemName("filename") %></li>
	<li>컨텐츠타입 : <%=mr.getContentType("filename") %></li>
	<li>파일크기 : 
		<%File file=mr.getFile("filename");
			if(file != null){
				long size=file.length();
				out.println(size);
			}
		%>Bytes</li>
</ul>