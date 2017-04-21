<%@page import="java.util.*, my.book.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="bdao" class="my.book.BookDAO"/>
        <% request.setCharacterEncoding("EUC-KR"); %>
    
<html>
<head>
<title>도서 찾기 페이지</title>
</head>
<body>
	<div align="center">
		<hr color=green width="300">
		<h2>도 서 찾 기</h2>
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
		String search = request.getParameter("search");
		String searchString = request.getParameter("searchString");
		if (search==null || search.trim().equals("") ||
				searchString==null || searchString.trim().equals("")){
			response.sendRedirect("bookmanagement.jsp");
			return;
			}
			
		ArrayList<BookDTO> list=bdao.searchBook(search,searchString);
			if(list!=null&&list.size()!=0){
				for(BookDTO bdto:list){
		%>
		<tr align="center">
			<td><%=bdto.getName()%></td>
			<td><%=bdto.getWriter()%></td>
			<td><%=bdto.getPublisher()%></td>
			<td><%=bdto.getIndate()%></td>
		</tr>
		<%
				}}
			else {
		%>
		<tr>
			<td colspan="4" align="center">해당 도서는 존재하지않습니다.</td>
		</tr>
		<%
			}
		%>
		<tr>
		
		</tr>
	</table>
</body>
</html>