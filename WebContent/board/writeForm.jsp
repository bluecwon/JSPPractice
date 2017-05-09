<%@page import="java.util.*, my.board.*, my.db.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="../top.jsp" %>
<jsp:useBean id="bdb" class="my.board.BoardDataBean" scope="session"/>
<jsp:setProperty property="pool" name="bdb" value="<%=pool %>"/>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function check(){
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
<%String id=(String)session.getAttribute("mbid");
String ip=request.getRemoteAddr();
if(id==null){%>
<script type="text/javascript">
alert("로그인이 필요한 페이지입니다.")
location.href="../login/login.jsp?mode=2"
</script>
<%return;}
String mode=request.getParameter("mode");
String re_step="0";
String re_level="0";
if(mode.equals("2")){
re_step=request.getParameter("re_step");
re_level=request.getParameter("re_level");
}
%>
<div align="center">
		<hr color=green width="300">
		<font size="4"><b>글 쓰 기</b></font>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="600">
			<form name="f" action="writePro.jsp" method="post" onsubmit="return check()">
			<input type="hidden" name="re_step" value="<%=re_step%>">
			<input type="hidden" name="re_level" value="<%=re_level%>">
				<tr>
					<td class="m2">작성자</td>
					<td><input type="text" name="writer" value="<%=id%>" readonly></td>
				</tr>
				<tr>
					<td class="m2" width="20%">제목</td>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<td class="m2">email</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td class="m2">내용</td>
					<td><textarea name="content" rows="13" cols="65"></textarea></td>
				</tr>
				<tr>
					<td class="m2">비밀번호</td>
					<td><input type="password" name="passwd"></td>
					<input type="hidden" name="ip" value="<%=ip%>">
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="javascript:listBoard();">
					</td>
				</tr>
			</form>
		</table>
<%@ include file="../bottom.jsp" %>