<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>forward_b</title>
<%--  <link rel="stylesheet" href="../common/css/main_20240911.css">--%>
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
    String name = (String) request.getAttribute("name");
    List<String> list = (List<String>) request.getAttribute("list");

    // forward_b에서 forward_a의 매개변수를 받을 수 있는 이유는
    // forward()의 매개변수로 request객체를 전달해주기 때문에 가능하다.
    String paramSelectNum = request.getParameter("selectNum");
    int selectNum = paramSelectNum == null ? 0 : Integer.parseInt(paramSelectNum);
  %>
  <h3><%= name %></h3>
  <ul class="nav nav-underline" id="myNav">
    <%
      for (int i = 0; i < list.size(); i++) {
        String itemId = "item" + i;
    %>
    <li class="nav-item">
      <a class="nav-link<%= i == 0 ? " active" : "" %>" href="#<%= itemId %>" id="<%= itemId %>"><%= list.get(i) %></a>
    </li>
    <%
      }
    %>
  </ul>
</div>
<script>
    $(function () {
        $('#myNav').on('click', '.nav-link', function(e) {
            e.preventDefault();
            $('#myNav .nav-link').removeClass('active');
            $(this).addClass('active');
        });
    })
</script>
</body>
</html>
</html>
