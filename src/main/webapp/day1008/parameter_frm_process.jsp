<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="frm param을 받는 일" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>parameter_frm_process</title>
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
    String method = request.getMethod();
  %>
  <h2><%=method%>방식의 요청</h2>
  <%
    //POST 방식일 때만 동작한다. : 입력스트림의 모든 charset을 변환

    //이름이 유일한 web parameter 받기 (request 내장 객체 사용)
    //parameter_frm_process.jsp?text=dw&pass=dw&chk=on&hid=%EC%88%A8%EA%B9%80%EA%B0%92&select=%EC%9E%90%EB%B0%94&ta=dw
    String text = request.getParameter("text"); //input type='text'
    request.setCharacterEncoding("UTF-8");
    String pass = request.getParameter("pass"); //input type='password'
    String chk = request.getParameter("chk"); //input type='checkbox'
    String hid = request.getParameter("hid"); //input type='hidden'
    String select = request.getParameter("select"); //input type='select'
    String ta = request.getParameter("ta"); //input type='textarea'
    // 업무로직, 유효성 검증
    // POST방식일 때 한글 변환
//    if("POST".equals(method)){
//        // String class를 사용한 변환 (문자열을 byte[]로 쪼개서 인코딩 수행
//        text = new String(text.getBytes("8859_1"),"UTF-8");
//        // URLEncoder, URLDecoder
//        hid= URLDecoder.decode(URLEncoder.encode(hid,"8859_1"),"UTF-8");
//
//    }
  %>
  <ul>
    <li>text : <%=text%></li>
    <li>password : <%=pass%></li>
    <li>checkbox : <%=chk%></li>
    <li>hidden : <%=hid%></li>
    <li>select : <%=select%></li>
    <li>textarea : <%=ta%></li>
  </ul>
  <input type="text" value="text : <%=text%>">

</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
