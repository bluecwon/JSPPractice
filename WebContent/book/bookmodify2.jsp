<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.book.*"%>
        <jsp:useBean id="bdao" class="my.book.BookDAO"/>
    
<!-- edit_ok.jsp -->
<%
		String name = request.getParameter("name");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		
		if (name==null || writer==null || publisher==null ||
				name.trim().equals("") || writer.trim().equals("") ||
				publisher.trim().equals("")){
			response.sendRedirect("book.jsp");
			return;
		}
		
		int res = bdao.modifyBook(name, writer, publisher);
		if (res>0){%>
		<script type="text/javascript">
			alert("도서 수정 성공!! 도서목록페이지로 이동합니다.")
			location.href="booklist.jsp"
		</script>
	<%	}else { %>
		<script type="text/javascript">
			alert("도서 수정 실패!! 도서삭제페이지로 이동합니다.")
			location.href="bookmanagement.jsp"
		</script>
	<%	} %>