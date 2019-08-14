<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// post 파라미터값 한글처리
	request.setCharacterEncoding("utf-8");
	// 파라미터값 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	//String age = request.getParameter("age");

	//age context is text box: This is not for null, just for empty context. 
	String strAge = request.getParameter("age");//""
	int age = 0;
	if (strAge != null || !strAge.equals("")) {
		age = Integer.parseInt(strAge);

	}
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");

	//date
	Timestamp regDate = new Timestamp(System.currentTimeMillis());

	//DB접속정보
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";

	//1단계: DB 드라이버 로딩
	Class.forName("oracle.jdbc.OracleDriver");
	//2단계: DB연결
	Connection con = DriverManager.getConnection(url, user, password);
	//3단계: sql문 준비해서 실행
	String sql = "INSERT INTO member(id,passwd,name,age,gender,email,reg_date)";
	sql += " VALUES (?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	pstmt.setString(3, name);
	pstmt.setInt(4, age);
	pstmt.setString(5, gender);
	pstmt.setString(6, email);
	pstmt.setTimestamp(7, regDate);
	//4th : execute
	int rowCount = pstmt.executeUpdate();
%>
<script>
	alert('회원가입 성공');
	location.href = 'loginForm.jsp'; // 이동
</script>


