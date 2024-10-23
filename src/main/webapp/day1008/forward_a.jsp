<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="데이터 처리에 집중" %>
<%
  String name ="정동진";
  List<String> list = new ArrayList<>();
  list.add("이것이 자바다");
  list.add("오라클로 배우는 데이터베이스");
  list.add("HTML5 웹 프로그래밍");
  list.add("JSP%Servlet");
%>
<%
  request.setAttribute("name",name);
  request.setAttribute("list",list);

  RequestDispatcher rd =request.getRequestDispatcher("forward_b.jsp");
  rd.forward(request,response);
%>

