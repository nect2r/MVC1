<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userLoginForm</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/user/userLoginAction.jsp" method="post">
	    <div>userId : </div>
	    <div><input name="userId" id="userId" type="text"/></div>
	    <div>userPw : </div>
	    <div><input name="userPw" id="userPw" type="password"/></div>
	    <div>
	        <input type="submit" value="로그인"/>
	        <input type="reset" value="초기화"/>
	    </div>
	</form>
</body>
</html>