<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>���̵� ã��</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� ã ��</h2>
		<hr color="green" width="300">
		<form name="f" action="search.jsp" method="post">
		<input type="hidden" name="mode" value="1">
			<table width="500" class="outline">
				<tr>
					<th>�̸�</th>
					<td align="left"><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th>�ֹε�Ϲ�ȣ</th>
					<td align="left"><input type="text" name="ssn1" class="box" maxlength="6"> - <input
						type="text" name="ssn2" class="box" maxlength="7"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Ȯ��"> <input
						type="reset" value="���"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>