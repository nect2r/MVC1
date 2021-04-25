<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardAddForm</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	try{
		//로그인 상태 확인
		//로그인을 안한상태면 null이 발생
		int userNo = Integer.parseInt(request.getParameter("userNo"));
	}catch(Exception e){
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter printWriter = response.getWriter();
		
		printWriter.println("<script>alert('로그인을 해주세요.'); location.href='"+request.getContextPath()+"/user/userLoginForm.jsp'</script>");
		printWriter.flush();
	}
%>
	<form action="<%=request.getContextPath()%>/board/boardAddAction.jsp" method="post">
	    <div><input name="userNo" type="hidden" value="${sessionScope.user.userNo }"/></div>
	    <div>boardTitle : </div>
	    <div><input name="boardTitle" id="boardTitle" type="text"/></div>
	    <div>boardContent : </div>
	    <div><textarea name="boardContent" id="boardContent" rows="5" cols="50"></textarea></div>
	    <div>
	        <input type="submit" value="게시글입력"/>
	        <input type="reset" value="초기화"/>
	    </div>
	</form>
</body>
</html>