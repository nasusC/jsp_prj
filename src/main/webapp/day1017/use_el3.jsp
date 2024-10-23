<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="http://192.168.10.213:8080/jsp_prj/common/css/main_20240911.css">
    <link rel="icon" type="image/png" sizes="16x16" href="../common/images/favicon-16x16.png">
    <!--bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <style type="text/css">

    </style>

    <script type="text/javascript">

    </script>

    <script type="text/javascript">
        $(function () {

        });
    </script>

</head>
<body>
<div>
    <h2>EL의 scope 객체 사용</h2>

    <%
        String msg = "오늘은 목요일 입니다";
    %>
</div>
<h3>EL에서는 변수를 직접 접근할 수 없다.</h3>
EL : ${msg} <br>
Expression : <%=msg%> <br>
<%
    //Scope 객체에 저장하고, 저장된 이름을 사용하여 변수를 사용한다.
    //1. 저장

    pageContext.setAttribute("m",msg);
%>

2. EL에서 scope객체를 사용한 접근 : <strong>${pageScope.m}</strong>
${m} 출력 안됨.

<br>
<%
    pageContext.setAttribute("pMsg", "pmsg.");
    request.setAttribute("rMsg", "rmsg.");
    session.setAttribute("sMsg", "smsg");
    application.setAttribute("aMsg", "amsg");
%>
scope 객체를 사용한 접근 <br>
page scope : ${pageScope.pMsg} <br>
request scope : ${requestScope.rMsg} <br>
session scope : ${sessionScope.sMsg} <br>
application scope : ${applicationScope.aMsg} <br>

<%
    pageContext.setAttribute("PI", "pmsg.");
    request.setAttribute("PI", "rmsg.");
    session.setAttribute("PI", "smsg");
    application.setAttribute("PI", "amsg");
%>
scope 객체를 사용한 접근 근데? 같은 이름을 곁들인.... <br>
page scope : ${PI} <br>
request scope : ${PI} <br>
session scope : ${PI} <br>
application scope : ${PI} <br>

결론 -> 스콥 객체를 생략하고 이름만 사용하면 가장 작은 범위의 스콥 객체부터 검색한다. page < request < session < application


</body>
</html>
