<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userAddForm</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">
</head>
<body>
	<form action="<%=request.getContextPath()%>/user/userAddAction.jsp" method="post">
	    <div>userId : </div>
	    <div><input name="userId" id="userId" type="text"/></div>
	    <div>userPw : </div>
	    <div><input name="userPw" id="userPw" type="password"/></div>
	    <div>userEmail : </div>
	    <div><input name="userEmail" id="userEmail" type="text"/></div>
	    <div>
	        <input type="submit" value="글입력"/>
	        <input type="reset" value="초기화"/>
	    </div>
	</form>
</body>
</html>