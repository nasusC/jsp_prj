<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty userData}">
  <c:redirect url="http://localhost:8080/index.jsp"/>
</c:if>