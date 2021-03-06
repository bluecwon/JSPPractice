<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="bdao" class="my.book.BookDAO"/>
    <% request.setCharacterEncoding("EUC-KR"); %>
    <jsp:useBean id="bdto" class="my.book.BookDTO"/>
    <<jsp:setProperty property="*" name="bdto"/>
    
    <!-- insert.jsp -->
<%
	if(bdto.getName()==null||bdto.getWriter()==null||bdto.getPublisher()==null||//페이지를 직접 찾아왔을때
			bdto.getName().trim().equals("")||bdto.getWriter().trim().equals("")||bdto.getPublisher().trim().equals("")){%>
	<script type="text/javascript">
	alert("도서명 지은이 출판사를 모두 입력하셔야 합니다.")
	history.back();
	</script>
<%	return;
	}
	int res=bdao.checkBook(bdto.getName());
	if(res==0){
		res= bdao.insertBook(bdto);
		if(res>0){%>
			<script type="text/javascript">
			alert("도서 등록 성공!! 도서 목록페이지로 이동합니다.")
			location.href="booklist.jsp"
			</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("도서 등록 실패!! 도서 관리페이지로 이동합니다.")
		location.href="bookmanagement.jsp"
		</script>
<%}
}else{%>
		<script type="text/javascript">
		alert("도서 등록 실패!! 해당 도서명이 존재합니다.")
		location.href="bookmanagement.jsp"
		</script>
<%} %>
<!-- 
	1. 넘어온 데이터 받아오기
	2. 받은 데이터의 유효성을 검사
	3. 드라이버 검색
	4. DB와 연결하여 쿼리문을 전송
	5. 결과에 따라 성공하면 list.jsp로 이동
	    실패를 하면 student.jsp로 이동을 시킨다.
-->