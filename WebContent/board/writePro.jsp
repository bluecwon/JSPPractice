<%@page import="java.util.*, my.board.*, my.db.*"%>
<%@page import="java.io.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<jsp:useBean id="bdbb" class="my.board.BoardDBBean"/>
<%
	MultipartRequest mr=null;
	DefaultFileRenamePolicy dp;
	String upPath=config.getServletContext().getRealPath("/board/downloadfile");
	int len=30*1024*1024;
	try{
		dp=new DefaultFileRenamePolicy();
		mr=new MultipartRequest(request,upPath,len,"EUC-KR",dp);
	}catch(IOException e){
		e.printStackTrace();
	}
	bdbb.setRe_step(Integer.parseInt(mr.getParameter("re_step")));
	bdbb.setRe_level(Integer.parseInt(mr.getParameter("re_level")));
	bdbb.setWriter(mr.getParameter("writer"));
	bdbb.setSubject(mr.getParameter("subject"));
	bdbb.setEmail(mr.getParameter("email"));
	bdbb.setContent(mr.getParameter("content"));
	bdbb.setFilename(mr.getFilesystemName("filename"));
	bdbb.setIp(mr.getParameter("ip")); 
	bdbb.setPasswd(mr.getParameter("passwd"));
	if(bdbb.getFilename()==null){
		bdbb.setFilesize(0);	
	}else{
		bdbb.setFilesize((int)mr.getFile("filename").length());
	}
	
	int res=bdb.inputBoard(bdbb);
	if(res>0){%>
	<script type="text/javascript">
	alert("글 등록에 성공했습니다.")
	location.href="list.jsp"
	</script>
	<%} else{%>
	<script type="text/javascript">
	alert("글 등록에 실패했습니다. 다시 시도해 주세요")
	history.back();
	</script>
	<%} %>

<%@ include file="../bottom.jsp" %>