<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="dao.*"%>
<%@page import="vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userAddAction</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	UserVO user = new UserVO();
	user.setUserId(request.getParameter("userId"));
	user.setUserEmail(request.getParameter("userEmail"));
	String userPw = request.getParameter("userPw");
	
	//SHA256
	MessageDigest digest = MessageDigest.getInstance("SHA-256");
	byte[] hash = digest.digest(userPw.getBytes("UTF-8"));
	StringBuffer hexString = new StringBuffer();
	
	for(int i = 0; i < hash.length; i++){
		String hex = Integer.toHexString(0xff & hash[i]);
		if(hex.length() == 1) hexString.append('0');
		hexString.append(hex);
	}
	user.setUserPw(hexString.toString());
	
	UserDAO userDao = new UserDAO();
	
	int rowCount = 0;
	int resultCount = userDao.selectUserId(user);
	
	if(resultCount == 0){
		rowCount = userDao.insertUser(user);
	}
	
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter printWriter = response.getWriter();
	
	if(rowCount == 1){
		printWriter.println("<script>alert('계정이 등록 되었습니다'); location.href='"+request.getContextPath()+"/board/boardList.jsp'</script>");
		printWriter.flush();
	}else{
		printWriter.println("<script>alert('다시 시도해주세요.'); location.href='"+request.getContextPath()+"/user/userAddForm.jsp'</script>");
		printWriter.flush();
	}
%>
</body>
</html>