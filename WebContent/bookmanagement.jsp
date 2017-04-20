<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>도서 관리 프로그램</title>
</head>
<body>
	<div align="center">
	<hr color="green" width="300">
	<h2>도 서 등 록 페 이 지</h2>
	<hr color="green" width="300">
	<form name ="f" action="bookinsert.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					도서명 : <input type="text" name="name"><br>
					지은이 : <input type="text" name="writer"><br>
					출판사 : <input type="text" name="publisher"><br>
					<input type="submit" value="입력">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<hr color="green" width="300">
	<h2>도 서 삭 제 페 이 지</h2>
	<hr color="green" width="300">
	<form name ="f" action="bookdelete.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					도서명 : <input type="text" name="name">
					<input type="submit" value="삭제">
				</td>
			</tr>
		</table>
	</form>
	<hr color="green" width="300">
	<h2>도 서 정 보 수 정 페 이 지</h2>
	<hr color="green" width="300">
	<form name ="f" action="bookmodify.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					도서명 : <input type="text" name="name">
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
	<hr color="green" width="300">
	<h2>도 서 찾 기 페 이 지</h2>
	<hr color="green" width="300">
	<form name ="f" action="booksearch.jsp" method="post">
		<table border="1">
			<tr>
				<td>
				도서명 : <input type="text" name="name">
					<input type="submit" value="찾기">
				</td>
			</tr>
		</table>
	</form>
	<hr color="green" width="300">
	<h2>도 서 목 록 페 이 지</h2>
	<hr color="green" width="300">
	<form name ="f" action="booklist.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					<input type="submit" value="목록보기">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>