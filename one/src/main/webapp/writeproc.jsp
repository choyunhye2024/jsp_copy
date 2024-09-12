<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = request.getParameter("id");

	try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhist:3306/my_cat", "root", "root");
		Statement st = con.createStatement();
		String sql = "insert into cat_board (title,contentid) values ('" + title + "','" + content + "','" + id + "')";
		System.out.println("===전송하려는 sql:" + sql);
		int resultCount = st.executeUpdate(sql);
		if (resultCount == 1) {

			System.out.println("======글쓰기 성공");

		} else {

			System.out.println("=======글쓰기 실패");

		}

	} catch (Exception e) {

		e.printStackTrace();
	}
	
	response.sendRedirect("list.jsp");
	%>

</body>
</html>