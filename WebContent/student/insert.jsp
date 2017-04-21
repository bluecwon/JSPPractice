<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!-- insert.jsp -->
    <% request.setCharacterEncoding("EUC-KR"); %><!-- 포스트 방식일때 한글 처리 -->
    <jsp:useBean id="stdao" class="my.student.StudentDAO"/>
        <!-- Student stdao =new StudentDAO();  같은 역할-->
    <!-- useBean은 default 생성자를 불러오기 때문에 꼭 존재해야 한다 public -->
    <jsp:useBean id="stdto" class="my.student.StudentDTO"/>
    <!-- <jsp:setProperty property="id" name="stdto"/> -->
    <!-- stdto.setID(request.getParameter("id")); -->
    <jsp:setProperty property="*" name="stdto"/>
    <!-- 모든 넘어오는 값을 자동으로 dto에 넣어서 정리 -->
<%
	//String id=request.getParameter("id");
	//String name=request.getParameter("name");
	//String cname=request.getParameter("cname");
	
	if(stdto.getId()==null||stdto.getName()==null||stdto.getCname()==null||//페이지를 직접 찾아왔을때
			stdto.getId().trim().equals("")||stdto.getName().trim().equals("")||stdto.getCname().trim().equals("")){%>
	<script type="text/javascript">
	alert("아이디, 이름, 학급명을 모두 입력하셔야 합니다.")
	history.back();
	</script>
<%	return;//_jspservice 메소드를 끝내기 위해서
	}
	int res=stdao.insertStudent(stdto);
	if(res>0){%>
		<script type="text/javascript">
		alert("학생 등록 성공!! 학생 목록페이지로 이동합니다.")
		location.href="list.jsp"
		</script>
<%
	}else{
%>
		<script type="text/javascript">
		alert("학생 등록 실패!! 학생 등록페이지로 이동합니다.")
		location.href="student.jsp"
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