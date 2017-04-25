<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- test1.jsp -->
<html>
<head>
<title>scope 테스트</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>스 코 프 테 스 트</h2>
		<hr color="green" width="300">
		<form name="f" action="scope1.jsp" method="post">
			전송값 : <input type="text" name="count"> 
			<input type="submit" value="전송">
		</form>
	</div>
</body>
</html>