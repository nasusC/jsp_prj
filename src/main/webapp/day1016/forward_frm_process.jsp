<%@ page contentType="text/html;charset=UTF-8" language="java" info="내부 요청인지 외부 요청인지를 판단하는 일" %>
<%
  String movePage = "kor.jsp";
  String lang="한국어"; // web param으로 전송

  if(!"localhost".equals(request.getServerName())){
    movePage = "eng.jsp";
    lang="english";
  }
%>
<jsp:forward page="<%=movePage%>">

  <jsp:param name="lang" value="<%=lang%>"/>

</jsp:forward>