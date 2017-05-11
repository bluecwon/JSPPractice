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
	<h3>오늘의 공지사항<h3>
	<form name="f" action="alim_save.jsp" method="post">
		<table border="1" width="600">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>공지사항</th>
				<td><textarea name="notice"></textarea></td>
			</tr>
			<tr>
				<th>파일명</th>
				<td><input type="text" name="filename" value="<%=filename%>" readOnly></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="쓰기">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../bottom.jsp"%>
<!-- 1. file명을 어떻게 지정할 것인지 (단, 확장자는 .html)-->
<!-- file저장하는 방법(문자열 처리하여 저장) -->
<!-- file열기는 새창을 띄워서 새창에 입력된 내용이 나타나게 없으면 없다 출력 -->