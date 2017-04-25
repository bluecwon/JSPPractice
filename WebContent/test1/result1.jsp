<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- result.jsp -->
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<h2>result.jsp 파일입니다.</h2>
<b>request : obj의 getCount() : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="test1.jsp">처음으로</a>