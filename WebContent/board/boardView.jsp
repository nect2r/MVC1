<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="dao.*"%>
<%@page import="vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardView</title>
</head>
<body>
<h1>boardView</h1>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    BoardDAO boardDao = new BoardDAO();
    BoardVO board = boardDao.selectBoardByKey(boardNo);
    int resultCount = boardDao.updateBoardByViewUp(boardNo);
    
    request.setAttribute("userId", board.getUserId());
%>
    <div>board_no :</div>
    <div><%=board.getBoardNo()%></div>
    <div>board_title :</div>
    <div><%=board.getBoardTitle()%></div>
    <div>board_content :</div>
    <div><%=board.getBoardContent()%></div>
    <div>board_date :</div>
    <div><%=board.getBoardDate()%></div>
    <div>user_id :</div>
    <div><%=board.getUserId()%></div>
    <div>
    	<c:choose>
			<c:when test="${sessionScope.user.userId == userId}">
		        <a href="<%=request.getContextPath()%>/board/boardModifyForm.jsp?boardNo=<%=board.getBoardNo()%>">수정</a>
		        <a href="<%=request.getContextPath()%>/board/boardRemoveAction.jsp?boardNo=<%=board.getBoardNo()%>">삭제</a>
			</c:when>
		</c:choose>
		<a href="<%=request.getContextPath()%>/board/boardList.jsp">리스트</a>
    </div>
<%
}
%>
</body>
</html>