<%@page import="java.util.*, my.board.*, my.db.*"%>
<%@page import="java.io.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<jsp:useBean id="bdbb" class="my.board.BoardDBBean"/>
<%	
	String mode=request.getParameter("mode");
	if(mode.equals("2")){
		int num=Integer.parseInt(request.getParameter("num"));
		String filename=bdb.getFile(num);
		String delPath = application.getRealPath("/board/downloadfile");
		File file = new File(delPath, filename);
		if(file.exists())file.delete();
		bdb.deleteFile(num);
		return;
	}
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
	bdbb.setNum(Integer.parseInt(mr.getParameter("num")));
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
	if(bdb.checkPass(bdbb.getNum(),bdbb.getPasswd())){
		int res=bdb.updateBoard(bdbb);
		if(res>0){%>
		<script type="text/javascript">
		alert("글 수정에 성공했습니다.")
		location.href="list.jsp"
		</script>
		<%} else{%>
		<script type="text/javascript">
		alert("글 수정에 실패했습니다. 다시 시도해 주세요")
		history.back();
		</script>
		<%}}else{%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.")
		history.back();
		</script>
		<%} %>
	
<%@ include file="../bottom.jsp" %>