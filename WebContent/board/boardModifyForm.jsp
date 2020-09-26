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
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardModify param boardNo:"+boardNo);
    BoardDAO boardDao = new BoardDAO();
    BoardVO board = boardDao.selectBoardByKey(boardNo);
%>    
    <form action="<%=request.getContextPath()%>/board/boardModifyAction.jsp" method="post">
        <div>boardNo</div>
        <div><input name="boardNo" value="<%=board.getBoardNo()%>" type="text" readonly="readonly"/></div>
        <div>비밀번호확인: </div>
        <div><input name="boardPw" id="boardPw" type="password"/></div>
        <div>boardTitle : </div>
        <div><input name="boardTitle" value="<%=board.getBoardTitle()%>" id="boardTitle" type="text"/></div>
        <div>boardContent : </div>
        <div><textarea name="boardContent" id="boardContent" rows="5" cols="50"><%=board.getBoardContent()%></textarea></div>
        <div>
            <input type="submit" value="글수정"/>
            <input type="reset" value="초기화"/>
        </div>
    </form>
<%
}    
%>
</body>
</html>