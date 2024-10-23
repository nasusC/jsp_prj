<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>join_frm_process</title>
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
  <jsp:useBean id="mVO" class="day1016.MemberVO" scope="page"/>
  <jsp:setProperty name="mVO" property="*"/>
  <h2><jsp:getProperty name="mVO" property="name"/>님 회원가입 축하합니다.(<%=request.getMethod()%>요청)</h2>
  <div style="/*border: 1px solid #333">
    <ul>
      <li>아이디 : <jsp:getProperty name="mVO" property="id"/>
      </li>
      <li>비밀번호 : <jsp:getProperty name="mVO" property="pass"/>
      </li>
      <li>이름 : <jsp:getProperty name="mVO" property="name"/>
      </li>
      <li>생일 : <jsp:getProperty name="mVO" property="birth"/>
      </li>
      <li>연락처 : <jsp:getProperty name="mVO" property="tel"/>
      </li>
      <li>휴대폰 : <jsp:getProperty name="mVO" property="cellphone"/>
      </li>
      <li>이메일 : <jsp:getProperty name="mVO" property="email"/>@<jsp:getProperty name="mVO" property="email2"/>
      </li>
      <li>성별 : <jsp:getProperty name="mVO" property="gender"/>
      </li>
      <li>관심언어 : <%
        String lang[] = mVO.getLang();
        for (String temp : lang) {
          out.print(temp);
          out.print(" ");
        }
      %></li>
      <li>소재지 : <jsp:getProperty name="mVO" property="location"/>
      </li>
      <li>우편번호 : <jsp:getProperty name="mVO" property="zipcode"/>
      </li>
      <li>상세주소 : <jsp:getProperty name="mVO" property="addr1"/>
      </li>
      <li>상세주소2 : <jsp:getProperty name="mVO" property="addr2"/>
      </li>
    </ul>
  </div>
  위와 같은 정보로 회원가입이 완료되었습니다.*/
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
