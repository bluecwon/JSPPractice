<%@page import="java.util.*, my.member.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="../top.jsp"%>
    <jsp:useBean id="mdao" class="my.member.MemberDAO"/>
    <jsp:setProperty property="pool" name="mdao" value="<%=pool %>"/>

<link rel="stylesheet" type="text/css" href="../style.css">
	<div align="center">
		<hr color=green width="300">
		<h2>회 원 목 록 보 기</h2>
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
				ArrayList<MemberDTO> list= mdao.listMember();
				if(list!=null||list.size()!=0){
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
				<td colspan="7" align="center">회원이 없습니다.</td>
			</tr>
			<%
				}
			%>
		</table>
<%@ include file="../bottom.jsp"%>