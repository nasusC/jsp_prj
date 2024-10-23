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
    <h2>parameter 받기</h2>
    <form action="use_el2.jsp">
        <input type="text" name="name" placeholder="이름"><br>
        <input type="text" name="addr" placeholder="주소"><br>

        <label>취미</label> <br>
        <input type="checkbox" name="hobby" value="운동">운동<br>
        <input type="checkbox" name="hobby" value="낚시">낚시<br>
        <input type="checkbox" name="hobby" value="등산">등산<br>
        <input type="checkbox" name="hobby" value="잠자기">잠자기<br>
        <input type="submit" class="btn btn-success">


    </form>

    <div>
        입력값 : <br>
        이름 : ${empty param.name?"이름을 입력해":param.name}<br>
        주소 : ${empty param.addr?"주소를 입력해":param.addr}<br>
        취미 : ${paramValues.hobby[0]}

    </div>

    <h2> ${empty param.nick?"아래 링크를 클릭해주세요":param.nick}</h2>
</div>

<div>
<%--    요청 링크를 클릭했을 때 nick의 값으로 test를 출력하고  --%>

    <a href="use_el2.jsp?nick=test&age=20">요청</a>
</div>

<%
    String msg = "오늘은 목요일입니다.";

%>

${msg}

</body>
</html>
