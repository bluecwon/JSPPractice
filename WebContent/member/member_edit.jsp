<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.member.*"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mdao" class="my.member.MemberDAO"/>
	<link rel="stylesheet" type="text/css" href="../style.css">
	
	<script type="text/javascript">
	function check(){
		if(f.passwd.value==""){
			alert("�н����带 �Է��ϼ���")
			f.passwd.focus()
			return
		}
		document.f.submit()
	}
	</script>

	<%
	String no=request.getParameter("no");
	if(no==null||no.trim().equals("")){
		response.sendRedirect("viewmember.jsp");
	}
	MemberDTO mdto=mdao.memberInfo(Integer.parseInt(no));
	%>
	<%@include file="../top.jsp" %>
	<form name="f" method="POST" action="member_editok.jsp">
			<input type="hidden" name="no" value="<%=mdto.getNo()%>">
			<table width="600" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">��������</td>
 				</tr>
				<tr>
					<td width="150" class="m3">�̸�</td>
					<td class="m3">
						<input type="text" name="name" class="box" value="<%=mdto.getName()%>" readonly>
					</td>
				</tr>
				<tr>
					<td width="150" class="m3">���̵�</td>
					<td class="m3">
						<input type="text" name="id" class="box" value="<%=mdto.getId()%>" readonly>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">��й�ȣ</td>
					<td class="m3">
						<input type="password" name="passwd" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">�ֹι�ȣ</td>
					<td class="m3">
						<input type="text" name="ssn1" class="box" value="<%=mdto.getSsn1()%>" readonly> -
				<input type="password" name="ssn2" class="box" value="<%=mdto.getSsn2()%>" readonly>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">�̸���</td>
					<td class="m3">
						<input type="text" name="email" class="box" value="<%=mdto.getEmail()%>">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">����ó</td>
					<td class="m3">
						<input type="text" name="hp1" class="box" size="3" maxlength="3" value="<%=mdto.getHp1()%>"> -
						<input type="text" name="hp2" class="box" size="4" maxlength="4" value="<%=mdto.getHp2()%>"> -
						<input type="text" name="hp3" class="box" size="4" maxlength="4" value="<%=mdto.getHp3()%>">
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
						<a href="javascript:check()">[����]</a>
						<a href="#">[���]</a>
					</td>
  				</tr>
  			</table>
		</form>
		<%@include file="../bottom.jsp" %>