<%@ page contentType="text/html;charset=UTF-8" language="java" info="공통 디자인 header" %>

  <div>
    <span id="title">header에 들어갈 디자인</span>
    <%
      String msg = "오늘은 화요일";
    %>
    <strong><%= msg %></strong>
    <%
      //끼워지는 모든 페이지에서는 web parameter는 받을 수 있다.
      String birth = request.getParameter("birth");
    %>
    <br>
    1. request.getParameter 입력값 : <%=birth%>
    <br>
    2. EL 입력값 : ${param.birth}

  </div>

