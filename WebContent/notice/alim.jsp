<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- notice/alim.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<%
	String filename=null;
	Calendar ca=Calendar.getInstance();
	int yy=ca.get(Calendar.YEAR);
	int mm=ca.get(Calendar.MONTH)+1;
	int dd=ca.get(Calendar.DAY_OF_MONTH);
	filename=String.valueOf(yy);
	if(mm<10)filename+="0"+mm;
	else filename+=mm;
	if(dd<10)filename+="0"+dd;
	else filename+=dd;
	filename+=".html";
	/* java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = 
			new java.text.SimpleDateFormat("yyyyMMdd");
	filename = sdf.format(date);
	filename += ".html"; */
%>
<div align="center">
	<h3>������ ��������<h3>
	<form name="f" action="alim_save.jsp" method="post">
		<table border="1" width="600">
			<tr>
				<th>����</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>��������</th>
				<td><textarea name="notice"></textarea></td>
			</tr>
			<tr>
				<th>���ϸ�</th>
				<td><input type="text" name="filename" value="<%=filename%>" readOnly></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="����">
					<input type="reset" value="���">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../bottom.jsp"%>
<!-- 1. file���� ��� ������ ������ (��, Ȯ���ڴ� .html)-->
<!-- file�����ϴ� ���(���ڿ� ó���Ͽ� ����) -->
<!-- file����� ��â�� ����� ��â�� �Էµ� ������ ��Ÿ���� ������ ���� ��� -->