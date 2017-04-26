<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>비 밀 번 호 찾 기</h2>
		<hr color="green" width="300">
		<form name="f" action="search.jsp" method="post">
		<input type="hidden" name="mode" value="2">
			<table width="500" class="outline">
				<tr>
					<th>이름</th>
					<td align="left"><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td align="left"><input type="text" name="id" class="box"></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td align="left"><input type="text" name="ssn1" class="box" maxlength="6"> - <input
						type="text" name="ssn2" class="box" maxlength="7"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="확인"> <input
						type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>