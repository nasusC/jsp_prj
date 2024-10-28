<%@ page import="kr.co.sist.user.member.WebMemberVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty userData}">
  <c:redirect url="http://localhost:8080/index.jsp"/>
</c:if>
<%
  // 접속자의 IP
  String remoteIp = request.getRemoteAddr();

  // 로그인한 계정의 ID
  String sessionId = ((WebMemberVO)session.getAttribute("userData")).getId();
%>