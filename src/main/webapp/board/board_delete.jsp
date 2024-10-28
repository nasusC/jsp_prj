<%@ page import="kr.co.sist.user.board.BoardDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ include file="../common/session_chk.jsp"%>
<%@ include file="../common/post_chk.jsp"%>
<jsp:useBean id="bVO" class="kr.co.sist.user.board.BoardVO" scope="page"/>
<jsp:setProperty name="bVO" property="*"/>
<%--글 제목, 글 내용, 글 번호 들이 bVO객체에 입력된다.--%>
<%
//  작성자는 로그인한 세션에서 받아온다. (userData를 변수로 받아서 거기서 받아와도 됌)
  bVO.setWriter(sessionId);

  BoardDAO bDAO = BoardDAO.getInstance();
  int rowCnt = 0;
  try{
      rowCnt = bDAO.deleteBoard(bVO);
  }catch (SQLException se){
      rowCnt = -1; // DB에서 문제 발생 처리
      se.printStackTrace();
  }
  //EL로 쓰기 위한 Scope 객체에 rowCnt 할당.
  //이걸 안쓰면 expressiond(표현식)으로 써야함.
  pageContext.setAttribute("rowCnt",rowCnt);

%>
<head>
  <body></body>
</head>
<script>
    var msg = '문제가 발생했습니다. 잠시 후 다시 시도해주세요.';
    var cnt = ${rowCnt};
    var deleteFlag = false;
    if(cnt = 0){
        msg = '번호는 외부에서 임의로 편집 할 수 없습니다.'
    }
    if(cnt = 1){
        deleteFlag = true;
        msg = '${param.num}번의 글의 삭제를 성공하였습니다.'
    }

    alert(msg);

    if(deleteFlag){
        location.href = "board_list.jsp?currentPage=${currentPage}";
    }else{
        history.back();
    }


    $(function () {

    })
</script>
