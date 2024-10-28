<%@ page import="kr.co.sist.user.board.BoardDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ include file="../common/session_chk.jsp" %>
<%@ include file="../common/post_chk.jsp" %>

<jsp:useBean id="bVO" class="kr.co.sist.user.board.BoardVO" scope="page"/>
<jsp:setProperty name="bVO" property="*"/>
<jsp:setProperty name="bVO" property="ip" value="<%=remoteIp%>"/>

<%
  boolean insertFlag = false;
  try {
    BoardDAO bDAO = BoardDAO.getInstance();
    bDAO.insertBoard(bVO);
    insertFlag = true;
  } catch (SQLException se) {
    se.printStackTrace();
  }
  pageContext.setAttribute("insertFlag", insertFlag);
%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>board_write_process</title>
  <link rel="stylesheet" href="../common/css/main_20240911.css">
  <!--    bootstrap CDN  start-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
  <!--    JQuery CDN start-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

  <style>

  </style>
</head>
<body>
<div id="wrap">

</div>
<script>
    if(${insertFlag}){
        alert('${userData.id}님 글을 작성하였습니다.')
        location.href = 'board_list.jsp';
    }else{
        alert('글 쓰기 시에 문제가 발생하였습니다.')
        history.back();
    }

    $(function () {

    })
</script>
</body>
</html>
</html>
