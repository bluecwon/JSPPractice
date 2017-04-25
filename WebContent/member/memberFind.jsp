<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.member.*"%>
<jsp:useBean id="mdao" class="my.member.MemberDAO"/>

<%@ include file="../top.jsp"%>
<% request.setCharacterEncoding("EUC-KR");
String search = request.getParameter("search");
String searchString = request.getParameter("searchString");
%>
<link rel="stylesheet" type="text/css" href="../style.css">
	<div align="center">
		<hr color=green width="300">
		<h2>ȸ �� ã ��</h2>
		<form name="f" method="post"><!-- action�� ������ �ڱ� �ڽ� -->
		<select name="search">
			<option value="id">���̵�
			<option value="name">�̸�
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="ã��">
		</form>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="600">
			<tr align="center" bgcolor="YELLOW">
				<th class ="m3">��ȣ</th>
				<th class ="m3">�̸�</th>
				<th class ="m3">���̵�</th>
				<th class ="m3">�̸���</th>
				<th class ="m3">��ȭ��ȣ</th>
				<th class ="m3">������</th>
				<th class ="m3">����/����</th>
			</tr>
			<%
				if(search==null||search.trim().equals("")||searchString==null||searchString.trim().equals("")){%>
					<tr>
						<td colspan="7" align="center">�˻�� �Է����ּ���.</td>
					</tr>
				<%}else{
				ArrayList<MemberDTO> list= mdao.findMember(search,searchString);
				if(list!=null&&list.size()!=0){
					for(MemberDTO mdto:list){
			%>
			<tr align="center">
				<td><%=mdto.getNo()%></td>
				<td><%=mdto.getName()%></td>
				<td><%=mdto.getId()%></td>
				<td><%=mdto.getEmail()%></td>
				<td><%=mdto.getAllHp() %></td>
				<td><%=mdto.getJoindate() %></td>
				<td><a href="member_edit.jsp?no=<%=mdto.getNo()%>">����</a> | <a href="member_delete.jsp?no=<%=mdto.getNo()%>">����</a></td>
			</tr>
			<%
					}
				}
				else{
			%>
			<tr>
				<td colspan="7" align="center">�ش� ȸ���� �����ϴ�.</td>
			</tr>
			<%
				}
				}
			%>
		</table>
<%@ include file="../bottom.jsp"%>