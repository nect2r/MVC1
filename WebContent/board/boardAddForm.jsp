<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardAddForm</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/board/boardAddAction.jsp" method="post">
	    <div>boardPw : </div>
	    <div><input name="boardPw" id="boardPw" type="password"/></div>
	    <div>boardTitle : </div>
	    <div><input name="boardTitle" id="boardTitle" type="text"/></div>
	    <div>boardContent : </div>
	    <div><textarea name="boardContent" id="boardContent" rows="5" cols="50"></textarea></div>
	    <div>boardName : </div>
	    <div><input name="boardUser" id="boardUser" type="text"/></div>
	    <div>
	        <input type="submit" value="글입력"/>
	        <input type="reset" value="초기화"/>
	    </div>
	</form>
</body>
</html>