<%@ page import="kr.co.sist.user.board.BoardDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ include file="../common/session_chk.jsp"%>
<%@ include file="../common/post_chk.jsp"%>
<jsp:useBean id="bVO" class="kr.co.sist.user.board.BoardVO" scope="page"/>
<jsp:setProperty name="bVO" property="*"/>
<%--set Property했을 때 글번호, 글제목(필요없음), 내용 3가지를 받는다. --%>
<%
  bVO.setWriter(sessionId);

  BoardDAO bDAO = BoardDAO.getInstance();
  int cnt = 0;

  try{
    cnt = bDAO.updateBoard(bVO); // 0은 실패 (num이 외부에서 변경된 것), 1은 성공
  }catch (SQLException se){
      cnt = -1; // -1은 예외 DB에서 문제가 발생
      se.printStackTrace();
  }

  // -1, 0, 1
  pageContext.setAttribute("cnt",cnt);

%>
<head>
<body></body>
</head>
<script>
    var msg = 'DB에서 문제가 발생했습니다.';
    var cnt = ${cnt};
    if( cnt == 0 ){
        msg = "글 번호가 외부에서 임의로 수정되었습니다."
    }
    if( cnt == 1 ){
        msg = '글이 정상적으로 수정되었습니다.'
    }

    alert(msg);

    if(cnt <= 0){
        history.back();
    }else{
        location.href="board_list.jsp?currentPage=${param.currentPage}";
    }

    $(function () {

    })
</script>

