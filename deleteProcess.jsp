<%@page import="java.sql.*"%>
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
//post parameter Korean processing
request.setCharacterEncoding("utf-8");
//id passwd bring parameter
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");

//DB접속정보
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "scott";
String password = "tiger";

//1단계: DB 드라이버 로딩
Class.forName("oracle.jdbc.OracleDriver");
//2단계: DB연결
Connection con = DriverManager.getConnection(url, user, password);
//3단계: sql문 준비해서 실행.id에 해당하는 passwd 가져오기
String sql="SELECT passwd From member WHERE id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,id);
//4th: sql statement execute
ResultSet rs=pstmt.executeQuery();
//5th: rs data exist -> id exist 
//	 : rs data non-exist -> delete 수행. delete 
if(rs.next()){
	if(passwd.equals(rs.getString("passwd"))){
		pstmt.close();
		
		//delete statement execute / sucessed delete
		sql="DELETE FROM member WHERE id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,id);
		//execute
		pstmt.executeUpdate();
		%> <p>delete membership!</p> <%
		}else{
	%><p>id not exist </p><% 
	}
} else {
	%><p>아이디 없음</p><%
}
%>
</body>
</html>