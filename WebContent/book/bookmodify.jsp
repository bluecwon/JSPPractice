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
	<h2>�� �� �� �� �� �� ��</h2>
	<hr color="green" width="300">
	<form name="f" action="bookmodify2.jsp" method="post">
		<table border="1">
			<tr>
				<td>
					������ : <input type="text" name="name" 
					value="<%=name%>" readOnly><br>
					������ : <input type="text" name="writer" 
					value="<%=writer%>"><br>
					���ǻ� : <input type="text" name="publisher" 
					value="<%=publisher%>"><br>
					<input type="submit" value="�Է�">
					<input type="reset" value="���">
				</td>
			</tr>
		</table>
	</form>			
<%	}}else{%>
	<table border="1">
			<tr>
				<td>
					�ش� ������ ���� ���� �ʽ��ϴ�.
				</td>
			</tr>
		</table>
		
<%} %>	
</div>















