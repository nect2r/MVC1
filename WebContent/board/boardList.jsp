<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page import="dao.*"%>
<%@page import="vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
</head>
<body>
<h1>
	<c:choose>
		<c:when test="${not empty sessionScope.user.userNo}">
			${sessionScope.user.userId }님 환영합니다.<br/>
			<a href="<%=request.getContextPath()%>/user/userLogoutAction.jsp">로그아웃</a>
		</c:when>
		<c:when test="${empty sessionScope.user.userNo}">
			<a href="<%=request.getContextPath()%>/user/userLoginForm.jsp">로그인</a>
		</c:when>
	</c:choose>
</h1>
<h1>boardList</h1>
<%
int currentPage = 1;
if(request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
BoardDAO boardDao = new BoardDAO();
int totalRowCount = boardDao.selectTotalBoardCount();
int pagePerRow = 10; 
int beginRow = (currentPage-1)*pagePerRow;
List<BoardVO> list = boardDao.selectBoardListPerPage(beginRow, pagePerRow);
%>
    <div>전체행의 수 : <%=totalRowCount%>/<%=list.size()%></div>
    <table border="1">
        <thead>
            <tr>
                <th>글쓴이</th>
                <th>제목</th>
                <th>날짜</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
<%
            for(BoardVO b : list) {
%>
                <tr>
                    <td><%=b.getUserId()%></td>
                    <td><a href="<%=request.getContextPath()%>/board/boardView.jsp?boardNo=<%=b.getBoardNo()%>"><%=b.getBoardTitle()%></a></td>
                    <td><%=b.getBoardDate()%></td>
                    <td style="text-align: center;"><%=b.getBoardView()%></td>
                </tr>
<%        
            }
%>
        </tbody>
    </table>
 
    <div>
        <a href="<%=request.getContextPath()%>/board/boardAddForm.jsp?userNo=${sessionScope.user.userNo }">게시글 입력</a>
    </div>
<%
    int lastPage = totalRowCount/pagePerRow;
    if(totalRowCount%pagePerRow != 0) {
        lastPage++;
    }
%>
    <div>
<%
        if(currentPage>1) {
%>
            <a href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage-1%>">이전</a>
<%
        }
        if(currentPage < lastPage) {
%>
 
            <a href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage+1%>">다음</a>
<%
        }
%>
    </div>
</body>
</html>