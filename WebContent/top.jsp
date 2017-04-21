<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link rel="stylesheet" type="text/css" href="style.css">
    
<html>
<head>
	<title>홈페이지</title>
	<script type="text/javascript">
	function openMember(){
		<!--window.open("해당하는 jsp파일","check","width=650, height=400")-->
		window.open("member/member_Ssn.jsp","check","width=650, height=400")
	}
	</script>
</head>
<body>
	<div align="center">
	<table border="1" width="800" height="600">
		<tr height="10%">
			<td colspan="2" align="center"><a href="index.jsp">main</a> | 
			<a href="login.jsp">로그인</a> | 
			<a href="javascript:openMember()">회원가입</a> | 
			<a href="company.jsp">회사소개</a></td>
		</tr>
		<tr>
			<td align="center" width="20%">tree/view</td>
			<td width="80%">