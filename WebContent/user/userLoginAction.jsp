<%@page import="dao.UserDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	UserVO user = new UserVO();
	user.setUserId(request.getParameter("userId"));
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
	
	UserVO resultUser = userDao.login(user);
	
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter printWriter = response.getWriter();
	
	if(resultUser != null && resultUser.getUserId() != null){
		session.setAttribute("user", resultUser);
		printWriter.println("<script>alert('로그인 되었습니다.'); location.href='"+request.getContextPath()+"/board/boardList.jsp'</script>");
		printWriter.flush();
	}else{
		printWriter.println("<script>alert('아이디나 비밀번호가 다릅니다.'); location.href='"+request.getContextPath()+"/user/userLoginForm.jsp'</script>");
		printWriter.flush();
	}
%>
</body>
</html>