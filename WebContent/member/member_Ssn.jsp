<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ȸ�� ���� ����</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>ȸ �� �� �� �� ��</h2>
		<hr color="green" width="300">
		<form name="f" action="checkMember.jsp" method="post">
			<table width="500" class="outline">
				<tr>
					<th>�̸�</th>
					<td align="left"><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th>�ֹε�Ϲ�ȣ</th>
					<td align="left"><input type="text" name="ssn1" class="box"> - <input
						type="text" name="ssn2" class="box"></td>
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