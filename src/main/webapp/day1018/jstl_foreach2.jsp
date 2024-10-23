<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>jstl_foreach2</title>
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
  <%
    String arr[] = {"김현우","정미영","차성호","이인혁"};
    List<String> list = new ArrayList<>();
    list.add("JAVA SE");
    list.add("DBMS");
    list.add("JDBC");
    list.add("HTML");
    // 배열과 list를 EL에서 사용하기 위해 scope객체에 저장
    pageContext.setAttribute("arrName",arr);
    pageContext.setAttribute("listSub",list);

  %>
  ${arrName}<br>
  ${listSub}<br>

  <c:forEach var="name" items="${arrName}" varStatus="i">
    ${i.count}<input type="text" value="${name}"${i.first?" readonly='readonly'": "" }${i.count eq 2?" autofocus='autofocus'":""}/><br>
  </c:forEach>

<%--  list의 값을 체크 박스로 만들어서 출력--%>
  <div>
  <c:forEach var="sub" items="${listSub}" varStatus="i">
    <input type="checkbox" value="${sub}">${sub}
  </c:forEach>
  </div>
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
