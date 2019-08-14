<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membership check</title>
</head>
<body>

<%
//Bring session value
String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
//without session => move to loginForm.jsp 
if(id==null){
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
//3단계: sql문 준비
String sql = "SELECT * FROM member WHERE id = ?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,id);
//4th sql execute
ResultSet rs=pstmt.executeQuery();

//변수 선언
String passwd = "";
String age = "";
String gender = "";
String email = "";
Timestamp regDate = null;


if (rs.next()) {
	passwd = rs.getString("passwd");
	age = rs.getString("age");
	gender = rs.getString("gender");
	email = rs.getString("email");
	regDate = rs.getTimestamp("reg_date");
}
%>

<h1>membership check</h1>

ID: <%=id %><br>
PW: <%=passwd %><br>
name: <%=name %><br>
age: <%=(age == null) ? "" : age %><br>
gender: <%=gender %><br>
email: <%=email %><br>
reg_date: <%=regDate %><br>


<a href="main.jsp">go to main page</a>

<%
// JDBC 자원닫기
rs.close();
pstmt.close();
con.close();
%>
</body>
</html>