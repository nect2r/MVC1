<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    String boardPw = request.getParameter("boardPw");
    String boardTitle = request.getParameter("boardTitle");
    String boardContent = request.getParameter("boardContent");
 
    BoardVO board = new BoardVO();
    board.setBoardNo(boardNo);
    board.setBoardTitle(boardTitle);
    board.setBoardContent(boardContent);
    
    BoardDAO boardDao = new BoardDAO();
    boardDao.updateBoard(board);
    
    response.sendRedirect(request.getContextPath()+"/board/boardView.jsp?boardNo="+boardNo);
}
%>
</body>
</html>