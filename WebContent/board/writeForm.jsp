<%@page import="java.util.*, my.board.*, my.db.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<jsp:setProperty property="pool" name="bdb" value="<%=pool %>"/>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function check(){
		if(f.subject.value==""){
			alert("������ �Է� ���ּ���!");
			f.subject.focus();
			return false;
		}
		if(f.content.value==""){
			alert("������ �Է� ���ּ���!");
			f.content.focus();
			return false;
		}
		if(f.passwd.value==""){
			alert("������ �Է� ���ּ���!");
			f.passwd.focus();
			return false;
		}
		return true;
	}
</script>
<%String id=(String)session.getAttribute("mbid");
String ip=request.getRemoteAddr();
if(id==null){%>
<script type="text/javascript">
alert("�α����� �ʿ��� �������Դϴ�.")
location.href="../login/login.jsp?mode=2"
</script>
<%return;}
String mode=request.getParameter("mode");
String re_step="0";
String re_level="0";
if(mode.equals("2")){
re_step=request.getParameter("re_step");
re_level=request.getParameter("re_level");
}
%>
<div align="center">
		<hr color=green width="300">
		<font size="4"><b>�� �� ��</b></font>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="600">
			<form name="f" action="writePro.jsp" method="post" onsubmit="return check()">
			<input type="hidden" name="re_step" value="<%=re_step%>">
			<input type="hidden" name="re_level" value="<%=re_level%>">
				<tr>
					<td class="m2">�ۼ���</td>
					<td><input type="text" name="writer" value="<%=id%>" readonly></td>
				</tr>
				<tr>
					<td class="m2" width="20%">����</td>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<td class="m2">email</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td class="m2">����</td>
					<td><textarea name="content" rows="13" cols="65"></textarea></td>
				</tr>
				<tr>
					<td class="m2">��й�ȣ</td>
					<td><input type="password" name="passwd"></td>
					<input type="hidden" name="ip" value="<%=ip%>">
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="�۾���">
					<input type="reset" value="�ٽ��ۼ�">
					<input type="button" value="��Ϻ���" onclick="javascript:listBoard();">
					</td>
				</tr>
			</form>
		</table>
<%@ include file="../bottom.jsp" %>