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
		//mr=new MultipartRequest(request,"������ ��ġ",ũ��,"�۲�");
		dp=new DefaultFileRenamePolicy();//�ߺ��� �̸� ó���ϴ� Ŭ����
		mr=new MultipartRequest(request,upPath,len,"EUC-KR",dp);
		out.println("���ε� ����!!");//���� ���� ����
	}catch(IOException e){
		out.println("���ε� ����!!"); // �������� ���н� IOException �߻�
		e.printStackTrace();
	}
%>
<hr color="red">
<ul>
	<li>�ø��� : <%=mr.getParameter("name") %></li>
	<li>���ϸ� : <%=mr.getFilesystemName("filename") %></li>
	<li>������Ÿ�� : <%=mr.getContentType("filename") %></li>
	<li>����ũ�� : 
		<%File file=mr.getFile("filename");
			if(file != null){
				long size=file.length();
				out.println(size);
			}
		%>Bytes</li>
</ul>