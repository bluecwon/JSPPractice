<%@page import="java.util.*, my.board.*, my.db.*, java.io.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<jsp:useBean id="bdbb" class="my.board.BoardDBBean"/>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function deleteBoard(num){
		location.href="deleteForm.jsp?num="+num;
	}
	function updateBoard(num){
		location.href="updateForm.jsp?num="+num;
	}
</script>
<%String id=(String)session.getAttribute("mbid");
if(id==null){%>
<script type="text/javascript">
alert("로그인이 필요한 페이지입니다.")
location.href="../login/login.jsp?mode=2"
</script>
<%return;}
%>
<%
	String num=request.getParameter("num");
	int number=Integer.parseInt(num);
	bdbb=bdb.detailView(number);
	bdb.updateCount(number);
	if(bdbb!=null){
%>
	<div align="center">
		<hr color=green width="300">
		<font size="4"><b>글내용 보기</b></font>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="600">
				<tr>
					<td class="m2" align="center" width="25%">글번호</td>
					<td align="center" width="25%"><%=bdbb.getNum()%></td>
					<td class="m2" align="center" width="25%">조회수</td>
					<td align="center" width="25%"><%=bdbb.getReadcount()+1%></td>
				</tr>
				<tr>
					<td class="m2" align="center" width="25%">작성자</td>
					<td align="center" width="25%"><%=bdbb.getWriter()%></td>
					<td class="m2" align="center" width="25%">작성일</td>
					<td align="center" width="25%"><%=bdbb.getReg_date()%></td>
				</tr>
				<tr>
					<td class="m2" align="center" width="25%">글제목</td>
					<td align="center" colspan="3"><%=bdbb.getSubject() %></td>
				</tr>
				<tr>
					<td class="m2" align="center" width="25%">글내용</td>
					<td align="left" colspan="3"><%=bdbb.getContent() %></td>
				</tr>
				<%if(bdbb.getFilesize()>0){
					String upPath=application.getRealPath("/board/downloadfile");
				%>
				<tr>
					<td class="m2" align="center" width="25%">파일명</td>
					<td align="center" colspan="3">
					<a href="<%=upPath%>/<%=bdbb.getFilename()%>">
					<%
						int pos=bdbb.getFilename().lastIndexOf(".");
						String ext=bdbb.getFilename().substring(pos+1);
						if(ext.equals("jpg")||ext.equals("gif")||ext.equals("bmp")||ext.equals("png")){
					%><img src="<%=upPath%>/<%=bdbb.getFilename()%>" height="100" width="200">
					<%}else{%><%=bdbb.getFilename()%><%}%></a></td>
				</tr>
				<%}%>
				<tr>
					<td colspan="4" align="right">
					<%if(id.equals(bdbb.getWriter())) {%>
					<input type="button" value="글삭제" onclick="javascript:deleteBoard(<%=number%>);">
					<input type="button" value="글수정" onclick="javascript:updateBoard(<%=number%>);">
					<%}%>
					<input type="button" value="답글쓰기" onclick="window.location='writeForm.jsp?mode=2&re_step=<%=bdbb.getRe_step()%>&re_level=<%=bdbb.getRe_level()+1%>'">
					<input type="button" value="목록보기" onclick="javascript:listBoard();">
					</td>
				</tr>
		</table>
	<%} %>
<%@ include file="../bottom.jsp" %>