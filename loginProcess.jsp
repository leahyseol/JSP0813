<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// post 파라미터값 한글처리
	request.setCharacterEncoding("utf-8");
	// 폼 id passwd 파라미터값 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	//DB접속정보
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";

	//1단계: DB 드라이버 로딩
	Class.forName("oracle.jdbc.OracleDriver");
	//2단계: DB연결
	Connection con = DriverManager.getConnection(url, user, password);
	//3단계: sql문 준비
	String sql = "SELECT * FROM member WHERE id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	//4th : sql statement execute
	ResultSet rs = pstmt.executeQuery();
	//5th : rs data use
	// rs data(row) exist : id 
	//						compare password => log in
	//						wrong password 
	//				non-exist
	if (rs.next()) {
		if (passwd.equals(rs.getString("passwd"))) {
			// 로그인 인증
			session.setAttribute("id", rs.getString("id"));
			session.setAttribute("name", rs.getString("name"));
			response.sendRedirect("main.jsp");
		} else {
%>
<script>
	alert('Wrong password');
	history.back();
</script>
<%
	}
	} else { // 아이디 없음
%>
<script>
	alert('Id is not exist');
	//location.href='loginForm.jsp';
	history.back();
</script>
<%
	}
%>

