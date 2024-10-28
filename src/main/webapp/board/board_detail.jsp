<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.sist.user.board.BoardDAO" %>
<%@ page import="kr.co.sist.user.board.SearchVO" %>
<%@ page import="kr.co.sist.user.board.BoardVO" %>
<%@ page import="java.sql.SQLException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시글 상세보기</title>
  <link rel="stylesheet" href="../common/css/main_20240911.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <style>
      #content-box {
          min-height: 300px;
          padding: 20px;
          border: 1px solid #ddd;
          border-radius: 5px;
          margin: 20px 0;
      }
  </style>
</head>
<body>
<div id="wrap">
  <div id="header">
    <c:import url="../common/header.jsp"/>
  </div>

  <div style="width: 1010px">
    <h2>게시글 상세보기</h2>
    <%
      String num = request.getParameter("num");
      BoardVO bVO = null;

      if(num == null || "".equals(num)) {
        response.sendRedirect("board_list.jsp");
        return;
      }

      SearchVO sVO = new SearchVO();
      sVO.setCurrentPage(Integer.parseInt(num));

      BoardDAO bDAO = BoardDAO.getInstance();
      try {
        bVO = bDAO.selectDetailBoard(sVO);
        pageContext.setAttribute("bVO", bVO);
      } catch(SQLException se) {
        se.printStackTrace();
      }
    %>

    <c:if test="${empty bVO}">
      <script>
          alert("존재하지 않는 게시글입니다.");
          location.href="board_list.jsp";
      </script>
    </c:if>

    <div class="mt-4">
      <table class="table">
        <tr>
          <th width="150">제목</th>
          <td colspan="3"><c:out value="${bVO.subject}"/></td>
        </tr>
        <tr>
          <th>작성자</th>
          <td><c:out value="${bVO.writer}"/></td>
          <th width="150">작성일</th>
          <td><fmt:formatDate value="${bVO.input_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
        <tr>
          <th>IP</th>
          <td colspan="3"><c:out value="${bVO.ip}"/></td>
        </tr>
      </table>

      <div id="content-box">
        <c:out value="${bVO.content}" escapeXml="false"/>
      </div>

      <div class="text-center mt-4">
        <button type="button" class="btn btn-secondary" onclick="location.href='board_list.jsp'">목록</button>
        <c:if test="${not empty userData and userData.id eq bVO.writer}">
          <button type="button" class="btn btn-warning" onclick="moveEdit()">수정</button>
          <button type="button" class="btn btn-danger" onclick="confirmDelete()">삭제</button>
        </c:if>
      </div>
    </div>
  </div>
</div>

<script>
    function moveEdit() {
        location.href = "board_detail2.jsp?num=${bVO.num}";
    }

    function confirmDelete() {
        if(confirm("정말 삭제하시겠습니까?")) {
            location.href = "board_delete_process.jsp?num=${bVO.num}";
        }
    }
</script>
</body>
</html>