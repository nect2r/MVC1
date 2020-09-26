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
if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardModifyAction param boardNo :"+boardNo);
    String boardPw = request.getParameter("boardPw");
    System.out.println("boardModifyAction param boardPw :"+boardPw);
    String boardTitle = request.getParameter("boardTitle");
    System.out.println("boardModifyAction param boardTitle :"+boardTitle);
    String boardContent = request.getParameter("boardContent");
    System.out.println("boardModifyAction param boardContent :"+boardContent);
 
    BoardVO board = new BoardVO();
    board.setBoardNo(boardNo);
    board.setBoardPw(boardPw);
    board.setBoardTitle(boardTitle);
    board.setBoardContent(boardContent);
    
    BoardDAO boardDao = new BoardDAO();
    boardDao.updateBoard(board);
    
    response.sendRedirect(request.getContextPath()+"/board/boardView.jsp?boardNo="+boardNo);
}
%>


출처: https://injava.tistory.com/25?category=719298 [JSP로 배우는 JAVA(자바) 기초부터 끝까지]
</body>
</html>