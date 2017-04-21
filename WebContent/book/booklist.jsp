<%@page import="java.util.*, my.book.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="bdao" class="my.book.BookDAO"/>
<html>
<head>
<title>학생 목록페이지</title>
</head>
<body>
	<div align="center">
		<hr color=green width="300">
		<h2>도 서 목 록 보 기</h2>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="300">
			<tr align="center" bgcolor="YELLOW">
				<th>도서명</th>
				<th>지은이</th>
				<th>출판사</th>
				<th>입고일</th>
			</tr>
			<%
				ArrayList<BookDTO> list= bdao.listBook();
				if(list!=null||list.size()!=0){
					for(BookDTO bdto:list){
			%>
			<tr align="center">
				<td><%=bdto.getName()%></td>
				<td><%=bdto.getWriter()%></td>
				<td><%=bdto.getPublisher()%></td>
				<td><%=bdto.getIndate()%></td>
			</tr>
			<%
					}
				}
				else{
			%>
			<tr>
				<td colspan="3" align="center">도서 목록이 없습니다.</td>
			</tr>
			<%
				}
			%>
		</table>
		<form action="bookmanagement.jsp">
		<input type="submit" value="확인">
		</form>
</body>
</html>

<!-- 
	1. 기본 화면 모습 출력
	2. 드라이버 검색
	3. DB와 연결하여 쿼리문 전송
	4. 결과를 받아서
	5. 있으면 출력, 없으면 없다라고 출력
-->