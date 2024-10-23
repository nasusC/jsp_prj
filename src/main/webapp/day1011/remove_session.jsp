<%@ page contentType="text/html;charset=UTF-8" language="java" info="세션의 값 삭제" %>
<%
  //세션 값 삭제 ( 세션은 존재하고 값만 삭제 )
  session.removeAttribute("age");
  session.removeAttribute("name");


  // 세션 자체 무효화
  session.invalidate();
//  System.out.println("---");
//  System.out.println(session.getAttribute("name")); //null발생
  response.sendRedirect("get_session.jsp");
%>