<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
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
	
	int userNo = Integer.parseInt(request.getParameter("userNo"));
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	 
	BoardVO board = new BoardVO();
	board.setUserNo(userNo);
	board.setBoardTitle(boardTitle);
	board.setBoardContent(boardContent);
	 
	BoardDAO boardDao = new BoardDAO();
	int rowCount = boardDao.insertBoard(board);
	 
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
%>
</body>
</html>