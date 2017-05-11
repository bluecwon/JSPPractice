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
alert("�α����� �ʿ��� �������Դϴ�.")
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
		<font size="4"><b>�۳��� ����</b></font>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="600">
				<tr>
					<td class="m2" align="center" width="25%">�۹�ȣ</td>
					<td align="center" width="25%"><%=bdbb.getNum()%></td>
					<td class="m2" align="center" width="25%">��ȸ��</td>
					<td align="center" width="25%"><%=bdbb.getReadcount()+1%></td>
				</tr>
				<tr>
					<td class="m2" align="center" width="25%">�ۼ���</td>
					<td align="center" width="25%"><%=bdbb.getWriter()%></td>
					<td class="m2" align="center" width="25%">�ۼ���</td>
					<td align="center" width="25%"><%=bdbb.getReg_date()%></td>
				</tr>
				<tr>
					<td class="m2" align="center" width="25%">������</td>
					<td align="center" colspan="3"><%=bdbb.getSubject() %></td>
				</tr>
				<tr>
					<td class="m2" align="center" width="25%">�۳���</td>
					<td align="left" colspan="3"><%=bdbb.getContent() %></td>
				</tr>
				<%if(bdbb.getFilesize()>0){
					String upPath=application.getRealPath("/board/downloadfile");
				%>
				<tr>
					<td class="m2" align="center" width="25%">���ϸ�</td>
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
					<input type="button" value="�ۻ���" onclick="javascript:deleteBoard(<%=number%>);">
					<input type="button" value="�ۼ���" onclick="javascript:updateBoard(<%=number%>);">
					<%}%>
					<input type="button" value="��۾���" onclick="window.location='writeForm.jsp?mode=2&re_step=<%=bdbb.getRe_step()%>&re_level=<%=bdbb.getRe_level()+1%>'">
					<input type="button" value="��Ϻ���" onclick="javascript:listBoard();">
					</td>
				</tr>
		</table>
	<%} %>
<%@ include file="../bottom.jsp" %>