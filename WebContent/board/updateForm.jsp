<%@page import="java.util.*, my.board.*, my.db.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<jsp:useBean id="bdbb" class="my.board.BoardDBBean"/>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function check(){
		if(f.writer.value==""){
			alert("이름을 입력 해주세요!");
			f.writer.focus();
			return false;
		}
		if(f.subject.value==""){
			alert("제목을 입력 해주세요!");
			f.subject.focus();
			return false;
		}
		if(f.content.value==""){
			alert("내용을 입력 해주세요!");
			f.content.focus();
			return false;
		}
		if(f.passwd.value==""){
			alert("내용을 입력 해주세요!");
			f.passwd.focus();
			return false;
		}
		return true;
	}
</script>

<%
	String num=request.getParameter("num");
	int number=Integer.parseInt(num);
	bdbb=bdb.detailView(number);
%>
	<div align="center">
		<hr color=green width="300">
		<font size="4"><b>글 수 정</b></font>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="600">
			<form name="f" action="updatePro.jsp?mode=1" method="post" onsubmit="return check()" enctype="multipart/form-data">
				<tr>
					<td class="m2">작성자</td>
					<td><input type="text" name="writer" value="<%=bdbb.getWriter()%>" readonly></td>
					<input type="hidden" name="num" value="<%=num%>">
				</tr>
				<tr>
					<td class="m2" width="20%">제목</td>
					<td><input type="text" name="subject" value="<%=bdbb.getSubject()%>"></td>
				</tr>
				<tr>
					<td class="m2">email</td>
					<td><input type="text" name="email" value="<%=bdbb.getEmail()%>"></td>
				</tr>
				<tr>
					<td class="m2">내용</td>
					<td><textarea name="content" rows="13" cols="65"><%=bdbb.getContent()%></textarea></td>
				</tr>
				<tr>
					<td class="m2">파일</td>
					<td><input type="file" name="filename">| 현재 : <%=bdbb.getFilename()%><input type="button" value="삭제" onclick="window.location='updatePro.jsp?mode=2&num=<%=bdbb.getNum()%>'"></td>
				</tr>
				<tr>
					<td class="m2">비밀번호</td>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="글수정" >
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="javascript:listBoard();">
					</td>
				</tr>
			</form>
		</table>
<%@ include file="../bottom.jsp" %>