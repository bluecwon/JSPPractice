<%@page import="java.util.*, my.board.*, my.db.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<jsp:setProperty property="pool" name="bdb" value="<%=pool %>"/>
<link rel="stylesheet" type="text/css" href="../style.css">
<div align="center">
		<hr color=green width="300">
		<font size="4"><b>�� �� ��</b></font>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="600">
			<tr align="center" class="m2">
				<th class ="m3">��ȣ</th>
				<th class ="m3">����</th>
				<th class ="m3">�ۼ���</th>
				<th class ="m3">�ۼ���</th>
				<th class ="m3">��ȸ</th>
				<th class ="m3">IP</th>
			</tr>
			<%
				ArrayList<BoardDBBean> list=bdb.listBoard();
				if(list!=null&&list.size()!=0){
					for(BoardDBBean bdto:list){
			%>
			<tr align="center">
				<td><%=bdto.getNum()%></td>
				<td align="left"><a href="content.jsp?num=<%=bdto.getNum()%>">
				<%if(bdto.getRe_level()>0){for(int i=0;i<bdto.getRe_level();i++){%><%}%>re:<%}%><%=bdto.getSubject()%></a></td>
				<td><%=bdto.getWriter()%></td>
				<td><%=bdto.getReg_date()%></td>
				<td><%=bdto.getReadcount() %></td>
				<td><%=bdto.getIp() %></td>
			</tr>
			<%
					}
				}
				else{
			%>
			<tr>
				<td colspan="6" align="center">���� �����ϴ�.</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="6" align="right"><a href="writeForm.jsp?mode=1">�۾���</a></td>
			</tr>
		</table>
<%@ include file="../bottom.jsp" %>