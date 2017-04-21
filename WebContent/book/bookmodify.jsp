<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.book.*"%>
        <jsp:useBean id="bdao" class="my.book.BookDAO"/>
    
<!-- edit.jsp -->
<%
		String name = request.getParameter("name");
		if (name==null || name.trim().equals("")){
			response.sendRedirect("bookmanagement.jsp");
			return;
		}
		ArrayList<BookDTO> list=bdao.searchBook("name", name);
		if(list!=null&&list.size()!=0){
		for(BookDTO bdto:list){
			String writer=bdto.getWriter();
			String publisher=bdto.getPublisher();
		%>
		<div align="center">
	<hr color="green" width="300">
	<h2>도 서 수 정 페 이 지</h2>
	<hr color="green" width="300">
	<form name="f" action="bookmodify2.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					도서명 : <input type="text" name="name" 
					value="<%=name%>" readOnly><br>
					지은이 : <input type="text" name="writer" 
					value="<%=writer%>"><br>
					출판사 : <input type="text" name="publisher" 
					value="<%=publisher%>"><br>
					<input type="submit" value="입력">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>			
<%	}}else{%>
	<table border="1">
			<tr>
				<td>
					해당 도서가 존재 하지 않습니다.
				</td>
			</tr>
		</table>
		
<%} %>	
</div>















