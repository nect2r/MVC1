<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardRemove</title>
</head>
<body>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    BoardVO board = new BoardVO();
    board.setBoardNo(boardNo);
    
    BoardDAO boardDao = new BoardDAO();
    
    boardDao.deleteBoard(board);
    
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
}
%>
</body>
</html>