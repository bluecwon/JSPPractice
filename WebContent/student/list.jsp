<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.* , my.student.*"%>
	<<jsp:useBean id="stdao" class="my.student.StudentDAO"/>
<html>
<head>
<title>학생 목록페이지</title>
</head>
<body>
	<div align="center">
		<hr color=green width="300">
		<h2>학 생 목 록 보 기</h2>
		<hr color=green width="300">
	</div>
		<table align="center" border="1" width="300">
			<tr align="center" bgcolor="YELLOW">
				<th>ID</th>
				<th>이름</th>
				<th>학급명</th>
			</tr>
			<%
			ArrayList<StudentDTO> list =stdao.listStudent();
			if(list==null || list.size()==0){%>
				<tr>
					<td colspan="3">등록된 학생이 없습니다.</td>
				</tr>
			<%}else{
			for(StudentDTO sdto:list){%>
				<tr>
					<td><%=sdto.getId() %></td>
					<td><%=sdto.getName() %></td>
					<td><%=sdto.getCname() %></td>
				</tr>
			<%}
			}
			%>
		</table>
</body>
</html>

<!-- 
	1. 기본 화면 모습 출력
	2. 드라이버 검색
	3. DB와 연결하여 쿼리문 전송
	4. 결과를 받아서
	5. 있으면 출력, 없으면 없다라고 출력
-->