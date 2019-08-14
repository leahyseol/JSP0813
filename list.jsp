<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membership list</title>
</head>
<body>

<%
//bring session
String id=(String)session.getAttribute("id");
//session id is not exist (null) or not admin -> main.jsp
if(id==null || !id.equals("admin")){
	response.sendRedirect("loginForm.jsp");
	return;
}
%>


<%
//DB접속정보
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";

	//1단계: DB 드라이버 로딩
	Class.forName("oracle.jdbc.OracleDriver");
	//2단계: DB연결
	Connection con = DriverManager.getConnection(url, user, password);
	//3rd : prepare sql statement
	String sql = "SELECT * FROM member ORDER BY id ASC";
	PreparedStatement pstmt=con.prepareStatement(sql);
	//4th : sql statement execute->created rs
	ResultSet rs =pstmt.executeQuery();
	
%>

<h1>membership list</h1>

<table border="1">
<tr>
<th>ID</th>
<th>PW</th>
<th>name</th>
<th>gender</th>
<th>age</th>
<th>Email</th>
<th>reg_date</th>

</tr>

<%
while(rs.next()){
	String userID=rs.getString("id");
	String passwd= rs.getString("passwd");
	String name=rs.getString("name");
	String gender=rs.getString("gender");
	String age=rs.getString("age");
	String email=rs.getString("email");
	String regDate=rs.getString("reg_date");
%>	
	<tr>
	<td><%=userID %></td>
	<td><%=passwd %></td>
	<td><%=name %></td>
	<td><%=gender %></td>
	<td><%=age %></td>
	<td><%=email %></td>
	<td><%=regDate %></td>
	</tr>

<% 
}//while

%>


</table>
<a href="main.jsp">go to main page</a>

<%
// JDBC 자원 닫기
rs.close();
pstmt.close();
con.close();
%>

</body>
</html>