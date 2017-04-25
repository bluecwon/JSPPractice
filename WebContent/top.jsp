<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link rel="stylesheet" type="text/css" href="style.css">
    
<html>
<head>
	<title>홈페이지</title>
	<script type="text/javascript">
	function openMember(){
		<!--window.open("해당하는 jsp파일","check","width=650, height=400")-->
		window.open("<%=request.getContextPath()%>/member/member_Ssn.jsp","check","width=650, height=400")
	}
	
	function searchId(){
		window.open("<%=request.getContextPath()%>/login/searchid.jsp","check","width=650, height=400")
	}
	
	function searchPw(){
		window.open("<%=request.getContextPath()%>/login/searchpw.jsp","check","width=650, height=400")
	}
	</script>
</head>
<body>
	<div align="center">
	<table border="1" width="800" height="600">
		<tr height="10%">
			<td colspan="2" align="center"><a href="<%=request.getContextPath()%>/index.jsp">main</a> | <!-- 절대경로로 지정 -->
			<a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a> | 
			<a href="javascript:openMember()">회원가입</a> |
			<a href="<%=request.getContextPath()%>/member/viewmember.jsp">회원보기</a> |
			<a href="<%=request.getContextPath()%>/member/memberFind.jsp">회원찾기</a> |
			<a href="<%=request.getContextPath()%>/company.jsp">회사소개</a></td>
		</tr>
		<tr>
			<td align="center" width="20%">tree/view</td>
			<td width="80%">