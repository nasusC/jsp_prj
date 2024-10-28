package kr.co.sist.user.board;

/**
 * @author : S.H.CHA
 */

import kr.co.sist.dao.DbConnection;
import kr.co.sist.util.BoardUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 게시판의 리스트, 추가, 삭제, 변경 업무
 */
public class BoardDAO {

    private static BoardDAO bDAO;

    private BoardDAO() {

    }

    public static BoardDAO getInstance() {
        if (bDAO == null) {
            bDAO = new BoardDAO();
        }
        return bDAO;
    }

    /**
     * 게시판의 리스트, 추가, 삭제, 변경의 업무를 구현한다.
     *
     * @param sVO 총 게시물의 수
     * @return
     * @throws SQLException
     */
    public int selectTotalCount(SearchVO sVO) throws SQLException {
        int totalCount = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        //1. JNDI 사용객체 생성
        //2. DBCP에서 Datasource 얻기
        DbConnection dbCon = DbConnection.getInstance();
        try {
            //3. Connecion 얻기
            conn = dbCon.getConnection();

            //4. 쿼리문 생성 객체 얻기
            StringBuilder selectCount = new StringBuilder();
            selectCount
                    .append("select count(*) cnt ")  // num 대신 * 사용
                    .append("from board ");

            // dynamic query : 검색 키워드를 판단 기준으로 where절이 동적으로 생성되어야 한다.
            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                selectCount.append(" where instr(")
                        .append(BoardUtil.numToField(sVO.getField()))
                        .append(", ? ) != 0 ");
            }

            pstmt = conn.prepareStatement(selectCount.toString());

            //5. 바인드 변수에 값 설정
            // 검색키워드를 판단 기준으로 바인드변수에 값을 할당
            // 검색키워드가 없으면 아래 구문은 실행안됌.
            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                pstmt.setString(1, sVO.getKeyword());
            }

            //6. 쿼리문 수행후 결과 얻기

            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt("cnt");
            }
        } finally {
            //7. 연결 끊기
            dbCon.dbClose(rs, pstmt, conn);
        }

        return totalCount;
    }


    /**
     * 한개의 게시물을 조회하는 업무를 한다.
     *
     * @param sVO
     * @return
     * @throws SQLException
     */
    public List<BoardVO> selectBoard(SearchVO sVO) throws SQLException {
        List<BoardVO> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        // 1. JNDI 사용객체 생성
        // 2. DBCP에서 DataSource 얻기
        try {
            // 3. Connection 얻기
            con = dbCon.getConnection();
            // 4. 쿼리문 생성 객체 얻기
            StringBuilder selectBoard = new StringBuilder();
            selectBoard
                    .append("   select *     ")
                    .append("   from( select num, subject, writer, input_date, ip,     ")
                    .append("   row_number() over (order by num desc) as rnum    ")
                    .append("   from board     ");

            // dynamic query : 검색 키워드를 판단 기준으로 where절이 동적으로 생성되어야 한다.
            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                selectBoard.append(" where instr(")
                        .append(BoardUtil.numToField(sVO.getField()))
                        .append(", ? ) != 0 ");
            }
            selectBoard.append("   )WHERE rnum BETWEEN ? AND ?    ");

            pstmt = con.prepareStatement(selectBoard.toString());
            // 5. 바인드 변수에 값 설정
            // dynamic query : 검색 키워드를 판단 기준으로 where절이 동적으로 생성되어야 한다.
            int bindIndex = 0;
            if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())){
                pstmt.setString(++bindIndex, sVO.getKeyword());

            }
                pstmt.setInt(++bindIndex, sVO.getStartNum());
                pstmt.setInt(++bindIndex, sVO.getEndNum());
            // 6. 쿼리문 수행 후 결과 얻기
            rs = pstmt.executeQuery();
            BoardVO bVO = null;
            while (rs.next()) {
                bVO = new BoardVO();
                bVO.setNum(rs.getInt("num"));
                bVO.setSubject(rs.getString("subject"));
                bVO.setWriter(rs.getString("writer"));
                bVO.setInput_date(rs.getDate("input_date"));
                bVO.setIp(rs.getString("ip"));
                list.add(bVO);
            }
        } finally {
            // 7. 연결해제
            dbCon.dbClose(rs, pstmt, con);
        }

        return list;
    }

    /**
     * 입력 값을 Board Table에 추가하는 일
     *
     * @param bVO
     * @throws SQLException
     */
    public void insertBoard(BoardVO bVO) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();
        // 1. JNDI 사용객체 생성
        // 2. DBCP에서 DataSource 얻기
        try {
            // 3. Connection 얻기
            con = dbCon.getConnection();
            // 4. 쿼리문 생성 객체 얻기
            StringBuilder insertBoard = new StringBuilder();
            insertBoard.append("INSERT INTO board(num,subject,content,writer,ip) ")
                    .append("VALUES (seq_board.nextval, ?, ?, ? ,?)");
            System.out.println(insertBoard.toString());
            pstmt = con.prepareStatement(insertBoard.toString());

            pstmt.setString(1, bVO.getSubject());
            pstmt.setString(2, bVO.getContent());
            pstmt.setString(3, bVO.getWriter());
            pstmt.setString(4, bVO.getIp());

            pstmt.executeUpdate();
        } finally {
            // 7. 연결해제
            dbCon.dbClose(null, pstmt, con);
        }
    }

    /**
     * 입력된 글번호에 해당하는 글 하나 조회
     *
     * @param num
     * @return
     * @throws SQLException
     */
    public BoardVO selectOneBoard(int num) throws SQLException {
        BoardVO bVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        // 1. JNDI 사용객체 생성
        // 2. DBCP에서 DataSource 얻기
        try {
            // 3. Connection 얻기
            con = dbCon.getConnection();
            // 4. 쿼리문 생성 객체 얻기

            StringBuilder selectQuery = new StringBuilder();
            selectQuery
                    .append(" select num, subject, content, writer, input_date, ip ")
                    .append(" from board ")
                    .append(" where num = ? ");
            pstmt = con.prepareStatement(selectQuery.toString());
            // 5. 바인드 변수에 값 설정
            pstmt.setInt(1, num);
            // 6. 쿼리문 수행 후 결과 얻기
            rs = pstmt.executeQuery();
            if (rs.next()) {  // while이 아닌 if 사용 (단일 결과)
                bVO = new BoardVO();
                bVO.setNum(num);
                bVO.setSubject(rs.getString("subject"));
                bVO.setWriter(rs.getString("writer"));
                bVO.setInput_date(rs.getDate("input_date"));
                bVO.setIp(rs.getString("ip"));

                // CLOB을 읽어들이기 위해서 별도의 스트림을 연결해야한다.
                BufferedReader br = new BufferedReader(rs.getClob("content").getCharacterStream());
                StringBuilder content = new StringBuilder();
                String temp; // 한줄 읽어들인 데이터를 저장할 변수.
                try {
                    while ((temp = br.readLine()) != null) {
                        // br은 엔터가 나오기 전까지 읽어들이기 때문에 줄바꿈까지 처리해야한다.("\n")
                        // 한줄 읽어들여서 컨텐트(스트링빌더)에 저장한다.
                        content.append(temp).append("\n");
                    }
                    // 모든 줄을 읽어들여 저장한 변수를 BoardVO 객체에 할당한다.
                    bVO.setContent(content.toString());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } finally {
            // 7. 연결해제
            dbCon.dbClose(rs, pstmt, con);
        }

        return bVO;
    }

    /**
     * 글 번호와 아이디에 해당하는 글의 내용을 변경.
     *
     * @param bVO
     * @return
     * @throws SQLException
     */
    public int updateBoard(BoardVO bVO) throws SQLException {
        int rowCnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();
        // 1. JNDI 사용객체 생성
        // 2. DBCP에서 DataSource 얻기
        try {
            // 3. Connection 얻기
            con = dbCon.getConnection();
            // 4. 쿼리문 생성 객체 얻기
            StringBuilder updateBoard = new StringBuilder();
            updateBoard.append(" update board   ")
                    .append(" set  content = ?")
                    .append(" where  num = ? and writer = ?");

            pstmt = con.prepareStatement(updateBoard.toString());

            pstmt.setString(1, bVO.getContent());
            pstmt.setInt(2, bVO.getNum());
            pstmt.setString(3, bVO.getWriter());

            rowCnt = pstmt.executeUpdate();
        } finally {
            // 7. 연결해제
            dbCon.dbClose(null, pstmt, con);
        }

        return rowCnt;
    }

    public int deleteBoard(BoardVO bVO) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        // 1. JNDI 사용객체 생성
        // 2. DBCP에서 DataSource 얻기
        try {
            // 3. Connection 얻기
            con = dbCon.getConnection();
            // 4. 쿼리문 생성 객체 얻기

            StringBuilder deleteQuery = new StringBuilder();
            deleteQuery
                    .append(" delete ")
                    .append(" from board ")
                    .append(" where num = ? and writer = ?");
            pstmt = con.prepareStatement(deleteQuery.toString());
            // 5. 바인드 변수에 값 설정
            pstmt.setInt(1, bVO.getNum());
            pstmt.setString(2, bVO.getWriter());
            // 6. 쿼리문 수행 후 결과 얻기
            cnt = pstmt.executeUpdate();
        } finally {
            // 7. 연결해제
            dbCon.dbClose(null, pstmt, con);
        }

        return cnt;

    }

} // BoardDAO 끝
