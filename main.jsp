<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// bring session value
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		// session value is not exist => move to loginFrom.jsp
		if (id == null) {
			response.sendRedirect("loginForm.jsp");
			return;
		}
	%>

	<h1>Main page</h1>

	<%=name%>(<%=id %>) log in<br>
	<button type="button" onclick="location.href='logout.jsp';">로그아웃</button>
	<br>
	<a href="">Membership review</a><br>
	<a href="">Membership revise</a><br>
	<a href="">Membership delete</a><br>
	<% 
	if (id.equals("admin")) {
		%>
		<a href="">Whole list</a><br>
		<%
	}
	%>

</body>
</html>