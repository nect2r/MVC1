<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
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
%>
    <div>board_no :</div>
    <div><%=board.getBoardNo()%></div>
    <div>board_title :</div>
    <div><%=board.getBoardTitle()%></div>
    <div>board_content :</div>
    <div><%=board.getBoardContent()%></div>
    <div>board_user :</div>
    <div><%=board.getBoardUser()%></div>
    <div>board_date :</div>
    <div><%=board.getBoardUser()%></div>
    <div>
        <a href="<%=request.getContextPath()%>/board/boardModifyForm.jsp?boardNo=<%=board.getBoardNo()%>">수정</a>
        <a href="<%=request.getContextPath()%>/board/boardRemoveForm.jsp?boardNo=<%=board.getBoardNo()%>">삭제</a>
    </div>
<%
}
%>
</body>
</html>