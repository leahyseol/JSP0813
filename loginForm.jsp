<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Sign in</h1>
<form action ="loginProcess.jsp" method="post">
ID:<input type="text" name="id" /><br>
PASSWD:<input type="password" name="passwd" /><br>
<button type="submit">Login</button>
<button type="button" onclick="location.href='joinForm.jsp'">Sign in</button>






</form>

</body>
</html>