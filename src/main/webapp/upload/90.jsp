<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<% Map<String, String> map = System.getenv();
  Set<String> keySet = map.keySet();

  Iterator<String> ita = keySet.iterator();

  String key = null;

  while (ita.hasNext()) {
    key = ita.next();
%>
  키명 : <%=key%>, 값 : <%=map.get(key)%><br>

<%
  }
%>