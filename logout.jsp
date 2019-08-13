<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//log out - session reset
session.invalidate();

//response.sendRedirect("loginForm.jsp");

%>
<script>
alert('log out');
location.href='loginForm.jsp';
</script>