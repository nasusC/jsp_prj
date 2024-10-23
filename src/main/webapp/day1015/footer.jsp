<%@ page contentType="text/html;charset=UTF-8" language="java" info="공통 디자인 header" %>

  <div>
    <span id="titleFooter">footer에 들어갈 디자인</span>
    <%
      String msg ="오늘은 화요일";
    %>
    <strong><%=msg%></strong>
    <br>
    입력값 : ${param.birth}
  </div>

