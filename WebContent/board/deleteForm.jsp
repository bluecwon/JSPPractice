<%@page import="java.util.*, my.board.*, my.db.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<jsp:useBean id="bdbb" class="my.board.BoardDBBean"/>
<jsp:setProperty property="pool" name="bdb" value="<%=pool %>"/>
<link rel="stylesheet" type="text/css" href="../style.css">
<%
	String num=request.getParameter("num");
%>
	<div align="center">
		<hr color=green width="300">
		<font size="4"><b>�� ����</b></font>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="300">
		<form name="f" action="deletePro.jsp" method="post">
				<tr>
					<td class="m2" align="center">��й�ȣ�� �Է��� �ּ���.</td>
				</tr>
				<tr>
					<td align="center">��й�ȣ <input type="password" name="passwd">
					<input type="hidden" name="num" value="<%=num%>">
					</td>
				</tr>
				<tr>
					<td class="m2" align="center">
					<input type="submit" value="�ۻ���">
					<input type="button" value="��Ϻ���" onclick="javascript:listBoard();">
					</td>
				</tr>
			</form>
		</table>
<%@ include file="../bottom.jsp" %>