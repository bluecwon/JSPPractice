<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link rel="stylesheet" type="text/css" href="style.css">
    
<html>
<head>
	<title>Ȩ������</title>
	<script type="text/javascript">
	function openMember(){
		<!--window.open("�ش��ϴ� jsp����","check","width=650, height=400")-->
		window.open("<%=request.getContextPath()%>/member/member_Ssn.jsp","check","width=650, height=400")
	}
	
	function searchId(){
		window.open("<%=request.getContextPath()%>/login/searchid.jsp","searchid","width=650, height=400")
	}
	
	function searchPw(){
		window.open("<%=request.getContextPath()%>/login/searchpw.jsp","searchpw","width=650, height=400")
	}
	</script>
</head>
<%
	boolean isLogin=false;
	String mbid=(String)session.getAttribute("mbid");
	String mbname=(String)session.getAttribute("mbname");
	if(mbid!=null&&mbname!=null){isLogin=true;}
	%>
<body>
	<div align="center">
	<table border="1" width="800" height="600">
		<tr height="10%">
			<td colspan="2" align="center"><a href="<%=request.getContextPath()%>/index.jsp">main</a> | <!-- �����η� ���� -->
			<%if(isLogin){%>
			<a href="<%=request.getContextPath()%>/login/logout.jsp">�α׾ƿ�</a> |
			<%}else{ %>
			<a href="<%=request.getContextPath()%>/login/login.jsp">�α���</a> |
			<%} %> 
			<a href="javascript:openMember()">ȸ������</a> |
			<a href="<%=request.getContextPath()%>/member/viewmember.jsp">ȸ������</a> |
			<a href="<%=request.getContextPath()%>/member/memberFind.jsp">ȸ��ã��</a> |
			<a href="<%=request.getContextPath()%>/company.jsp">ȸ��Ұ�</a></td>
		</tr>
		<tr><%if(isLogin){%>
			<td align="center" valign="top" width="20%"><b>[<%=mbname%>]��<br> ȯ���մϴ�!</b></td>
		<%}else{ %>
			<td align="center" valign="top" width="20%"><b>�α����� ���ּ���</b></td>
		<%} %>
			<td width="80%">