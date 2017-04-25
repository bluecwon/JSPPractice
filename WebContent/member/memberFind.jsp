<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.member.*"%>
<jsp:useBean id="mdao" class="my.member.MemberDAO"/>

<%@ include file="../top.jsp"%>
<% request.setCharacterEncoding("EUC-KR");
String search = request.getParameter("search");
String searchString = request.getParameter("searchString");
%>
<link rel="stylesheet" type="text/css" href="../style.css">
	<div align="center">
		<hr color=green width="300">
		<h2>회 원 찾 기</h2>
		<form name="f" method="post"><!-- action이 없을땐 자기 자신 -->
		<select name="search">
			<option value="id">아이디
			<option value="name">이름
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="찾기">
		</form>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="600">
			<tr align="center" bgcolor="YELLOW">
				<th class ="m3">번호</th>
				<th class ="m3">이름</th>
				<th class ="m3">아이디</th>
				<th class ="m3">이메일</th>
				<th class ="m3">전화번호</th>
				<th class ="m3">가입일</th>
				<th class ="m3">수정/삭제</th>
			</tr>
			<%
				if(search==null||search.trim().equals("")||searchString==null||searchString.trim().equals("")){%>
					<tr>
						<td colspan="7" align="center">검색어를 입력해주세요.</td>
					</tr>
				<%}else{
				ArrayList<MemberDTO> list= mdao.findMember(search,searchString);
				if(list!=null&&list.size()!=0){
					for(MemberDTO mdto:list){
			%>
			<tr align="center">
				<td><%=mdto.getNo()%></td>
				<td><%=mdto.getName()%></td>
				<td><%=mdto.getId()%></td>
				<td><%=mdto.getEmail()%></td>
				<td><%=mdto.getAllHp() %></td>
				<td><%=mdto.getJoindate() %></td>
				<td><a href="member_edit.jsp?no=<%=mdto.getNo()%>">수정</a> | <a href="member_delete.jsp?no=<%=mdto.getNo()%>">삭제</a></td>
			</tr>
			<%
					}
				}
				else{
			%>
			<tr>
				<td colspan="7" align="center">해당 회원이 없습니다.</td>
			</tr>
			<%
				}
				}
			%>
		</table>
<%@ include file="../bottom.jsp"%>