<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>���� ���� ���α׷�</title>
</head>
<body>
	<div align="center">
	<hr color="green" width="300">
	<h2>�� �� �� �� �� �� ��</h2>
	<hr color="green" width="300">
	<form name ="f" action="bookinsert.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					������ : <input type="text" name="name"><br>
					������ : <input type="text" name="writer"><br>
					���ǻ� : <input type="text" name="publisher"><br>
					<input type="submit" value="�Է�">
					<input type="reset" value="���">
				</td>
			</tr>
		</table>
	</form>
	<hr color="green" width="300">
	<h2>�� �� �� �� �� �� ��</h2>
	<hr color="green" width="300">
	<form name ="f" action="bookdelete.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					������ : <input type="text" name="name">
					<input type="submit" value="����">
				</td>
			</tr>
		</table>
	</form>
	<hr color="green" width="300">
	<h2>�� �� �� �� �� �� �� �� ��</h2>
	<hr color="green" width="300">
	<form name ="f" action="bookmodify.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					������ : <input type="text" name="name">
					<input type="submit" value="����">
				</td>
			</tr>
		</table>
	</form>
	<hr color="green" width="300">
	<h2>�� �� ã �� �� �� ��</h2>
	<hr color="green" width="300">
	<form name ="f" action="booksearch.jsp" method="post">
		<table border="1">
			<tr>
				<td>
				������ : <input type="text" name="name">
					<input type="submit" value="ã��">
				</td>
			</tr>
		</table>
	</form>
	<hr color="green" width="300">
	<h2>�� �� �� �� �� �� ��</h2>
	<hr color="green" width="300">
	<form name ="f" action="booklist.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					<input type="submit" value="��Ϻ���">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>