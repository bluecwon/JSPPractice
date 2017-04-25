<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- scope1.jsp -->
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<jsp:setProperty property="count" name="obj"/>

<h2>page scope</h2>
<b>obj¿« getCount() »£√‚ : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<jsp:forward page="result1.jsp"/><!--  -->