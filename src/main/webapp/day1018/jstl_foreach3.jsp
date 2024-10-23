<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="day1018.DataDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="day1018.DataVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>jstl_foreach3</title>
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
      .no-data {
          text-align: center;
          padding: 20px;
          font-weight: bold;
          color: #888;
      }
  </style>
</head>
<body>
<div id="wrap">
  <%
    DataDAO dDAO = new DataDAO();
    List<DataVO> list = dDAO.selectData();
    pageContext.setAttribute("datalist",list);
  %>
  <table class="table table-hover">
    <thead>
    <tr>
      <th style="width: 80px">번호</th>
      <th style="width: 120px">이미지</th>
      <th style="width: 200px">이름</th>
      <th style="width: 400px">설명</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
    <c:when test="${empty datalist}">
      <tr>
        <td colspan="4" class="no-data">데이터없음</td>
      </tr>
    </c:when>
    <c:otherwise>
      <c:forEach var="dataVO" items="${datalist}" varStatus="index">
      <tr>
        <td><c:out value="${index.count}"/></td>
        <td><img src="../common/imges/${dataVO.img}" alt="" style="width: 100%" height="100%"></td>
        <td><a href="detail.jsp?num=${dataVO.itemNum}">
          <c:out value="${dataVO.name}"/>
        </a></td>
        <td><c:out value="${dataVO.info}"/></td>
      </tr>
      </c:forEach>
    </c:otherwise>
    </c:choose>
    </tbody>
  </table>
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
