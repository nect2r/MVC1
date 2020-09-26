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
String boardPw = request.getParameter("boardPw");
System.out.println("param boardPw:"+boardPw);
String boardTitle = request.getParameter("boardTitle");
System.out.println("param boardTitle:"+boardTitle);
String boardContent = request.getParameter("boardContent");
System.out.println("param boardContent:"+boardContent);
String boardUser = request.getParameter("boardUser");
System.out.println("param boardUser:"+boardUser);
 
BoardVO board = new BoardVO();
board.setBoardPw(boardPw);
board.setBoardTitle(boardTitle);
board.setBoardContent(boardContent);
board.setBoardUser(boardUser);
 
BoardDAO boardDao = new BoardDAO();
int rowCount = boardDao.insertBoard(board);
 
response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
%>
</body>
</html>